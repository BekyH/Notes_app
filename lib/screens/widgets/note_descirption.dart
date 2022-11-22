import 'package:flutter/material.dart';

class NoteDescription extends StatelessWidget{
  final descriptionController;
  NoteDescription({required this.descriptionController});
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
     return Container(
        height: screenHeight,
        padding: EdgeInsets.symmetric(horizontal: 12,vertical: 8),
        child: TextField(
          selectionControls: materialTextSelectionControls,
          controller: descriptionController,
          maxLines: null,
          textCapitalization: TextCapitalization.sentences,
          decoration: null,
          style: TextStyle(
            fontSize: 19,
            height: 1.5
          ),
        ),
     );
  }

}