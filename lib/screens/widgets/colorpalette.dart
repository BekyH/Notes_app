import 'package:flutter/material.dart';
import 'package:notes_app/theme/note_colors.dart';
import 'package:notes_app/utils/colors.dart';

class ColorPalette extends StatelessWidget{
   final parentContext;

   ColorPalette({required this.parentContext});
   
  @override
  Widget build(BuildContext context) {
    final screenwidth = MediaQuery.of(context).size.width;
     final screenheight = MediaQuery.of(context).size.height;
   return Dialog(
          backgroundColor: c1,
          clipBehavior: Clip.hardEdge,
          insetPadding: EdgeInsets.all(screenwidth * 0.03),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2)),
          child: Container(
            padding: EdgeInsets.all(8),
            child: Wrap(
              alignment: WrapAlignment.start,
              spacing: screenwidth * 0.02,
              runSpacing: screenwidth * 0.02,
              children: NoteColors.entries.map((entry){
                    return  GestureDetector(
                      onTap: (){
                        Navigator.of(context).pop(entry);
                        child:Container(
                          width: screenwidth*0.12, 
                          height: screenheight * 0.12,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(screenwidth * 0.06),
                              color: Color(entry.value['b']!),

                          ),

                        );
                      },

                    );
              }).toList(),

            ),
          ),

   );

  }

}