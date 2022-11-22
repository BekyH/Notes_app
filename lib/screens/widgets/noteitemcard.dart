import 'dart:ui';


import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:intl/intl.dart';
import 'package:notes_app/models/note.dart';

class NoteItemCard extends StatelessWidget{
   final Note note;
 NoteItemCard({Key? key,required this.note}):super(key: key);
  @override
  Widget build(BuildContext context) {
    final screenheight = MediaQuery.of(context).size.height;
    final screenwidth  =MediaQuery.of(context).size.width;

        return  Container(
        //  width: screenwidth * 0.44,
         // padding: EdgeInsets.all(20),
         // height: screenheight * 0.12,
         
          child: Card(
          
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(12))
          ),
         
           child:
            Container(
                    padding: EdgeInsets.symmetric(horizontal: screenwidth * 0.03,vertical: screenheight * 0.002),

          
            child: Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                       // padding:EdgeInsets.all(10),
                        child: Text('title: ' ,style:TextStyle(fontFamily:"Poppins Regular",fontWeight: FontWeight.w400,fontSize: 12)),

                      ),
                        Container(
                   // padding: EdgeInsets.only(left: screenwidth * 0.03,top: screenheight * 0.01,),
                    child: Flexible(child: 
                    Text(note.title.toString(), maxLines: 2,overflow: TextOverflow.ellipsis, style: TextStyle(fontFamily:"Poppins Regular",fontWeight: FontWeight.w400,fontSize: 14),),
                    )
                   ),
                    ],
                  ),
                   
                   
                   Container(
                    padding: EdgeInsets.only(top: screenheight * 0.009),
                 //   padding: EdgeInsets.symmetric(horizontal: screenwidth * 0.03),
                    //width: screenwidth,
                    //padding: EdgeInsets.only(left:screenwidth * 0.03, top: screenheight * 0.005,),

                    child: Text(note.description.toString(),style: TextStyle(fontFamily:"Poppins Regular",fontWeight: FontWeight.w300,fontSize: 12),maxLines: 2,overflow: TextOverflow.ellipsis,),
                   ),
                   Container(
                    padding: EdgeInsets.only(left: screenwidth * 0.13,top: screenheight * 0.003),
                    child: Text(DateFormat.yMMMEd().format(DateTime.parse(note.date.toString())),style: TextStyle(fontFamily:"Poppins Regular",fontWeight: FontWeight.w400,fontSize: 12),),
                   )

                ],
           )),
          ),

        );

        
  }
  
}