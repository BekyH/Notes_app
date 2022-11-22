import 'package:flutter/material.dart';

Future<bool> DeleteDialog(BuildContext context) async{
   
   return await showDialog(
    context: context, 
    builder: (context) {
      return AlertDialog(
          title: Text('Delete'),
          content: Text('Delete this note?'),
          actions: [
            ElevatedButton(
              onPressed: () => Navigator.pop(context,false),
               child:Text('No')),
               ElevatedButton(
              onPressed: () => Navigator.pop(context,true),
               child:Text('Yes')), 
          ],
      );
    });
}