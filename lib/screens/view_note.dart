

import 'package:flutter/material.dart';
import 'package:node_keeper/models/note.dart';
import 'package:node_keeper/screens/note_detail.dart';

class ViewNote extends StatelessWidget {
  final String title;
  final Note note;

  ViewNote(this.note, this.title);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          resizeToAvoidBottomPadding: false,
          appBar: AppBar(
            title: Text(title),
          ),

          floatingActionButton: FloatingActionButton(
            elevation: 6.0,
            tooltip: "Edit Note",
            child: Icon(Icons.edit_attributes),
            backgroundColor: Colors.blue,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
            onPressed: (){
              Navigator.pop(context, true);

              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => NoteDetail(this.note, "")),
              );

            },
          ),

          body: Padding(
            padding: EdgeInsets.all(10.0),
            child: ListView(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Text(
                      "Title:",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 22.0,
                      ),
                    ),
                    Container(
                      width: 10.0,
                    ),
                    Text(
                      this.note.title,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 18.0,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Text(
                      "Priority:",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 22.0,
                      ),
                    ),
                    Container(
                      width: 10.0,
                    ),
                    Text(
                      getPriority(),
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 18.0,
                      ),
                    ),
                  ],
                ),
                ListTile(
                    title: Text(
                        "Paragraphs are the building blocks of papers. Many students define paragraphs in terms of length: a paragraph is a group of at least five sentences, a paragraph is half a page long, etc. In reality, though, the unity and coherence of ideas among sentences is what constitutes a paragraph. A paragraph is defined as “a group of sentences or a single sentence that forms a unit” (Lunsford and Connors 116). Length and appearance do not determine whether a section in a paper is a paragraph. For instance, in some styles of writing, particularly journalistic styles, a paragraph can be just one sentence long. Ultimately, a paragraph is a sentence or group of sentences that support one main idea. In this handout, we will refer to this as the “controlling idea,” because it controls what happens in the rest of the paragraph."
                            "Paragraphs are the building blocks of papers. Many students define paragraphs in terms of length: a paragraph is a group of at least five sentences, a paragraph is half a page long, etc. In reality, though, the unity and coherence of ideas among sentences is what constitutes a paragraph. A paragraph is defined as “a group of sentences or a single sentence that forms a unit” (Lunsford and Connors 116). Length and appearance do not determine whether a section in a paper is a paragraph. For instance, in some styles of writing, particularly journalistic styles, a paragraph can be just one sentence long. Ultimately, a paragraph is a sentence or group of sentences that support one main idea. In this handout, we will refer to this as the “controlling idea,” because it controls what happens in the rest of the paragraph."))
              ],
            ),
          )),
    );
  }

  String getPriority() {
    if (note.priority == 1)
      return "High";
    else
      return "Low";
  }

  /*void navigateToDetail(Note note, String title) async {
    bool result =
    await Navigator.push(context, MaterialPageRoute(builder: (context) {
      return NoteDetail(note, title);
    }));
  }*/

} // view note class
