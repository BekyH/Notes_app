import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/bloc/notes_bloc.dart';
import 'package:notes_app/bloc/notes_event.dart';
import 'package:notes_app/bloc/notes_state.dart';
import 'package:notes_app/screens/display_note.dart';
import 'package:notes_app/screens/edit_notes.dart';
import 'package:notes_app/screens/widgets/noteitemcard.dart';
import 'package:notes_app/screens/widgets/notelistitem.dart';
import 'package:notes_app/utils/colors.dart';

class Home extends StatefulWidget{
  static const pageroute = "/";
  @override
  State<StatefulWidget> createState() => HomeState();

}

class HomeState extends State<Home>{
  @override
  Widget build(BuildContext context) {
     final size = MediaQuery.of(context).size;
      final screenheight = MediaQuery.of(context).size.height;
    final screenwidth  =MediaQuery.of(context).size.width;
    return Scaffold(
     // backgroundColor: c6,
      appBar: AppBar(
        backgroundColor: c4,
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        title: Text('Notes',style: TextStyle(fontFamily: 'Poppins Medium',color: c5),
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.pushNamed(context, EditNote.pageroute);
        },
        child: const Icon(Icons.add,color: c5,),
        tooltip: 'New Notes',
        backgroundColor: c4,
        
        ),
        body: Container(
          child: Container(
            padding: EdgeInsets.all(10),
           // padding: EdgeInsets.symmetric(horizontal: screenwidth * 0.04,vertical: screenheight * 0.008),
          child: BlocBuilder<NotesBloc,NotesState>(builder: (context, state) {
                    if(state is NotesLoadingState){
                        return Center(child: CircularProgressIndicator(),);
                    }
                    else if(state is NotesLoadedState){
                      final notes = state.notes;
                      if(notes.isEmpty){
                          return Center(
                            child: Text("There are no notes "),
                          );
                      }
                      // return GridView(
                      //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      //     crossAxisCount:3 ,
                      //     mainAxisSpacing: 10
                      //   ),
                      //   children: [

                      //   ],
                      //   );
                        // return ListView.separated(
                        //   scrollDirection: Axis.vertical,
                          
                        //   shrinkWrap: true,
                          
                        //   itemBuilder: (context, index) {
                        //     return GestureDetector(
                              
                        //         onTap:() async{
                        //           await Navigator.push(
                        //                  context,
                        //                   MaterialPageRoute(builder:(_)=>DisplayNote(note: notes[index]),));
                               
                                  
                        //         },
                        //         child: NoteItemCard(note: notes[index],
                                
                        //         ),
                                  
                              
                        //     );
                        //   },

                        //    separatorBuilder: ((context, index) {
                        //       return SizedBox(
                        //         height: 5,
                        //       );
                        //    }),
                        //      itemCount:notes.length);
                        return GridView.builder(
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
                childAspectRatio: 2,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20),
            itemCount:notes.length,
            itemBuilder: (BuildContext ctx, index) {
              return Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(15)),
                child: GestureDetector(
                           onTap:() async{
                                  await Navigator.push(
                                         context,
                                          MaterialPageRoute(builder:(_)=>DisplayNote(note: notes[index]),));
                               
                                  
                                },
                   child: NoteItemCard(note: notes[index])
                )
              );
            });
      
                      
                    }
                    else if(state is NotesErrorState){
                        return Center(
                          child: Text('Loading failed'),
                        );

                    }
                    else{
                       context.read<NotesBloc>().add(GetAllNotesEvent());
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                     
                    }
          },)
        ),
        )
        
    );

  }
  

}