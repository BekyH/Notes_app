import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:notes_app/utils/colors.dart';

class NoteTitle extends StatelessWidget{
  final titleController;
  NoteTitle({required this.titleController});
  @override
  Widget build(BuildContext context) {
     return TextField(
      selectionControls: materialTextSelectionControls,
        controller: titleController,
        decoration: InputDecoration(
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
            contentPadding: EdgeInsets.all(0),  
            counter: null,
            counterText: "",
            hintText: "Title",
            hintStyle: TextStyle(
              fontSize: 21,
              fontWeight: FontWeight.bold,
              height: 1.5
            )
        ),
        maxLength: 31,
        maxLines: 1,
        style: TextStyle(
          fontSize: 21,
          fontWeight: FontWeight.bold,
          height: 1.5,
          color: c1
        ),
        textCapitalization: TextCapitalization.words,
     );
  }

}
