import 'package:flutter/material.dart';
import 'package:notes_app/main.dart';
import 'package:notes_app/screens/edit_notes.dart';
import 'package:notes_app/screens/home.dart';

class pageRouter{
  static Route?  generateRoute(RouteSettings settings){
       switch(settings.name){
          case Home.pageroute:
             return MaterialPageRoute(builder: (context) {
          return MyApp();
             });
          case EditNote.pageroute:
            return MaterialPageRoute(builder: (context) {
          return EditNote();
             });
             
       }
  }
}