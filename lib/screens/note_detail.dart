import 'package:flutter/material.dart';

class NoteDetail extends StatefulWidget {

  String appBartitle;

  NoteDetail(this.appBartitle);

  @override
  State<StatefulWidget> createState() {
    return NoteDetailState(this.appBartitle);
  }
}

class NoteDetailState extends State<NoteDetail> {

  static var _priorities = ["High","Low"];
  String appBarTitle;

  NoteDetailState(this.appBarTitle);

  TextEditingController titleController = TextEditingController();
  TextEditingController detailController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    TextStyle textStyle = Theme.of(context).textTheme.title;

    return Scaffold(
      appBar: AppBar(
          title: Text(appBarTitle)
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 15.0, left: 10.0, right: 10.0),
        child: ListView(
          children: <Widget>[

            // first element
            ListTile(
              title: DropdownButton(
                items: _priorities.map((String dropDownMenuItems){
                  return DropdownMenuItem<String>(
                    value: dropDownMenuItems,
                    child: Text(dropDownMenuItems),
                  );
                }).toList(),

                style: textStyle,
                value: "Low",
                onChanged: (valueSelectedByUser){
                  setState(() {
                    debugPrint("user selec $valueSelectedByUser");
                  });
                },

              ),
            ),

            // second element
            Padding(
              padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
              child: TextField(
                style: textStyle,
                controller: titleController,
                onChanged: (value){
                  debugPrint("SOmething changed in title text field");
                },
                decoration: InputDecoration(
                  labelText: 'Title',
                  labelStyle: textStyle,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0)
                  )
                ),
              ),
            ),

            // third element
            Padding(
              padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
              child: TextField(
                style: textStyle,
                controller: titleController,
                onChanged: (value){
                  debugPrint("SOmething changed in title text field");
                },
                decoration: InputDecoration(
                    labelText: 'Description',
                    labelStyle: textStyle,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0)
                    )
                ),
              ),
            ),

            // third element
            Padding(
              padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: RaisedButton(
                      color: Theme.of(context).primaryColorDark,
                      textColor: Theme.of(context).primaryColorLight,
                      child: Text(
                        "Save",
                        textScaleFactor: 1.5,
                      ),
                      onPressed: (){
                        debugPrint("Save button was clicked");
                      },
                    ),
                  ),

                  Container(width: 5.0,),

                  Expanded(
                    child: RaisedButton(
                      color: Theme.of(context).primaryColorDark,
                      textColor: Theme.of(context).primaryColorLight,
                      child: Text(
                        "Delete",
                        textScaleFactor: 1.5,
                      ),
                      onPressed: (){
                        debugPrint("Delete button was clicked");
                      },
                    ),
                  ),
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}
