import 'package:flutter/material.dart';
import 'package:node_keeper/screens/note_detail.dart';



class NoteList extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return NoteListState();
  }

}

class NoteListState extends State<NoteList>{

  int count = 0;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Notes'),
      ),
      body: getNoteListView(),
      floatingActionButton: FloatingActionButton(
        tooltip: "Add new Note",
        child: Icon(Icons.add),
        onPressed: (){
          debugPrint("FAB Tapped");
          navigateToDetailScreen('Add Note');
        },
      ),
    );
  }


  Widget getNoteListView(){

    TextStyle listTitleStyle = Theme.of(context).textTheme.subhead;

    return ListView.builder(
      itemCount: count,
      itemBuilder: (BuildContext context, int position){
        return Card(
          color: Colors.white,
          elevation: 2.0,
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.yellow,
              child: Icon(Icons.keyboard_arrow_right),
            ),

            trailing: Icon(Icons.delete, color: Colors.redAccent,),
            title: Text("DUmmy Title", style: listTitleStyle,),
            subtitle: Text("Dummy Date"),

            onTap: (){
              debugPrint("ListTile Tapped");
              navigateToDetailScreen('Edit Note');
            },

          ),
        );
      },
    );
  }

  void navigateToDetailScreen(String title){
    Navigator.push(context, MaterialPageRoute(builder: (context){
      return NoteDetail(title);
    }));
  }

}