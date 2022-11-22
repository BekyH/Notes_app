import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/bloc/notes_bloc.dart';
import 'package:notes_app/repository/notes_repository.dart';
import 'package:notes_app/route.dart';
import 'package:notes_app/screens/home.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {

final NotesRepoistory notesRepoistory = NotesRepoistory();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: notesRepoistory,
      child: MultiBlocProvider(
        providers:[
          BlocProvider(
          create: (_)=> NotesBloc(notesRepoistory: notesRepoistory))],
         child: MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: Home(),
      initialRoute: Home.pageroute,
      onGenerateRoute: pageRouter.generateRoute,
      debugShowCheckedModeBanner: false,
),
    ));
    
  }
}

git a