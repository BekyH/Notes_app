import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:notes_app/bloc/notes_bloc.dart';
import 'package:notes_app/bloc/notes_event.dart';
import 'package:notes_app/models/note.dart';
import 'package:notes_app/screens/edit_notes.dart';
import 'package:notes_app/screens/widgets/dialog.dart';
import 'package:notes_app/theme/note_colors.dart';
import 'package:notes_app/utils/colors.dart';
import 'package:path/path.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class DisplayNote extends StatefulWidget{
  final Note note;

  DisplayNote({Key? key,required this.note}):super(key: key);
  
  @override
  State<StatefulWidget> createState() => DisplayNoteState();

}

class DisplayNoteState extends State<DisplayNote>{
String noteColor = 'red';
  late Note _note;
  
  @override
  void initState(){
   _note = widget.note;
   
   super.initState();

  }
   
  @override
  Widget build(BuildContext context) {
      
      return Scaffold(
        //backgroundColor: Color(NoteColors[this.noteColor]!['l']!),
        appBar: AppBar(
           backgroundColor:c4,
          automaticallyImplyLeading: false,
          title: Text(DateFormat.yMMMEd().format(DateTime.parse(_note.date.toString()))),
          leading: IconButton(
          onPressed:(){
             Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: c1,
          ),
          tooltip: 'back',
        ),
        actions: [
          Container(
            child: IconButton(
              onPressed: () async {
                   await Navigator.push(context, MaterialPageRoute(
                    builder: (_) {
                     return EditNote(
                        note: _note,
                      );
                    }));
                    
              }
            , icon: Icon(Icons.edit_outlined)),
          ),
          Container(
            child: IconButton(
              onPressed: () async {
                   bool res = await DeleteDialog(context);
                   if(res){
                      context.read<NotesBloc>().add(DeleteNoteEvent(_note.id!));
                      Navigator.pop(context);
                   }
              }
            , icon: Icon(Icons.delete)),
          ),
        ],

        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(10),

              child: Row(
                children: [
                  Text("title:  "),
                  Text(
                _note.title??'',
                maxLines: 1,
                
                //textAlign: TextAlign.start,
                style: TextStyle(fontSize: 16,fontFamily: 'poppins Regular',fontWeight: FontWeight.w600,),

              ),
                ],
              )
              
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: Text(
                _note.description??'',
                maxLines: 1,
               // textAlign: TextAlign.start,
                style: TextStyle(
                    fontFamily: 'poppins Regular',
                    fontSize: 14,
                    fontWeight: FontWeight.w400
                ),
              ),
            )
          ],
        ),
      );

  }

}