import 'package:flutter/material.dart';
import 'package:notes_app/models/note.dart';
import 'package:notes_app/utils/colors.dart';

class NoteListItem extends StatelessWidget{
  final Note note;
  final Size size;
  final VoidCallback  onTap;
  NoteListItem({Key? key,required this.note,required this.size,required this.onTap}): super(key: key);
  @override
  Widget build(BuildContext context) {
    
     return Card(
          child:Row(
            children: [
                InkWell(
            
            onTap: onTap,
            splashColor: Colors.white,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.03,vertical: size.height * 0.01),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    note.title!,
                    maxLines: 2,
                    style: Theme.of(context).textTheme.headline5!.copyWith(
                      fontSize: size.width * 0.05   
                    ),

                  ),
                  
                ],
              )
              ),
              
          ),
          
         
            ],
          )
          
          
     );
  }


}