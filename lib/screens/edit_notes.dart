

import 'package:flutter/material.dart'; 
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/bloc/notes_bloc.dart';
import 'package:notes_app/bloc/notes_event.dart';
import 'package:notes_app/models/note.dart';
import 'package:notes_app/screens/display_note.dart';
import 'package:notes_app/screens/home.dart';
import 'package:notes_app/screens/widgets/action_button.dart';
import 'package:notes_app/screens/widgets/colorpalette.dart';
import 'package:notes_app/screens/widgets/note_descirption.dart';

import 'package:notes_app/screens/widgets/notetitle.dart';
import 'package:notes_app/theme/note_colors.dart';
import 'package:notes_app/utils/colors.dart';
import 'package:path/path.dart';

class EditNote extends StatefulWidget {
  static const pageroute = "/editnote";
  final Note? note;
   const EditNote({Key? key,this.note}):super(key: key);
  @override
  State<StatefulWidget> createState() => EditNoteState();
}

class EditNoteState extends State<EditNote> {
  String title = '';
  String description = '';
  String noteColor = 'red';
  TextEditingController titleEditingcontroller = TextEditingController();
  TextEditingController descriptionEditingcontroller = TextEditingController();
  late Note _note;

  void handleTitleChange() {
    setState(() {
      title = titleEditingcontroller.text.trim();
    });
  }

  void handleDescriptionChange() {
    setState(() {
      description = descriptionEditingcontroller.text.trim();
    });
  }


  void handleColor(currentContext) {
    showDialog(
        context: currentContext,
        builder: (context) {
          return ColorPalette(
            parentContext: currentContext,
          );
        }).then((colorName) {
      if (colorName != null) {
        setState(() {
          noteColor = colorName;
        });
      }
    });
  }

  void insertNote(BuildContext context){
    if (title.isEmpty) {
      if (description.isEmpty) {
        Navigator.pop(context);
        return;
      } else {
        String tit = description.split('\n')[0];
        if (tit.length > 31) {
          tit = tit.substring(0, 31);
        }
        setState(() {
          title = tit;
        });
      }
    }
   // print(DateTime.now().toString());
    Note note =
        Note(title: title, description: description,date: DateTime.now().toString());
      
        context.read<NotesBloc>().add(CreateNoteEvent(note));
        Navigator.pop(context);
      
  }
  void updateNote(BuildContext context){

       _note = widget.note!.copyWith(
        title: title,
        description: description
       );
       context.read<NotesBloc>().add(UpdateNoteEvent(_note));

       
       

  }
  void onSave(BuildContext context){
    if(widget.note!=null){
      
   
     updateNote(context);
   //  print(_note.title);
    // Navigator.pop(context,_note);
  // Navigator.pushReplacement(context, MaterialPageRoute(
  //                   builder: (_) {
  //                    return DisplayNote(
  //                       note: _note,
  //                     );
  //                   }));
                    
     Navigator.pushNamed(context, Home.pageroute);
    
    }
    else{
      
      insertNote(context);
     
    }
  }

  @override
  void initState() {
    title = widget.note?.title??'';
    description = widget.note?.description??'';
    titleEditingcontroller.text = title;
    descriptionEditingcontroller.text = description;
    titleEditingcontroller.addListener(handleTitleChange);
    descriptionEditingcontroller.addListener(handleDescriptionChange);
   
    super.initState();
  }

  @override
  void dispose() {
    titleEditingcontroller.dispose();
    descriptionEditingcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     // backgroundColor: Color(NoteColors[this.noteColor]!['l']!),
      appBar: AppBar(
        backgroundColor: c4,
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
        title: NoteTitle(titleController: titleEditingcontroller),
        actions: [
           actionButton(context, text: "Save", onTap: (() => onSave(context)))
             
          // IconButton(
          //   onPressed: () => handleColor(context),
          //   icon: const Icon(
          //     Icons.color_lens,
          //     color: c1,
          //   ),
          //   tooltip: 'Color palette',
          // )
        ],
      ),
      body: NoteDescription(descriptionController: descriptionEditingcontroller)
      ,
    );
  }
}
