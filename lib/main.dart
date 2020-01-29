import 'package:flutter/material.dart';
import 'package:node_keeper/screens/note_detail.dart';
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
      title: "Note Kepper",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple
      ),
      home: NoteList(),
    );
  }

}