import 'package:flutter/material.dart';
import 'package:node_keeper/screens/note_list.dart';

void main(){
  runApp(
    MyApp()
  );
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Note Kepper",                 // app title
      debugShowCheckedModeBanner: false,    // remove debug banner
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      home: NoteList(),
    );
  }

}