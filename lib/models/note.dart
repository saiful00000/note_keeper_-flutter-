
class Note{

  int _id;
  int _priority;
  String _title;
  String _description;
  String _date;

  Note(this._title, this._date, this._priority, [this._description]);

  Note.withId(this._id, this._title, this._date, this._priority, [this._description]);

  int get id => _id;

  int get priority => _priority;

  String get title => _title;

  String get description => _description;

  String get date => _date;

  set title(String newTitle){
    if(newTitle.length <= 255){
      this._title = newTitle;
    }
  }

  //description
  set description(String newDescription){
    if(newDescription.length <= 255) {
      this._description = newDescription;
    }
  }

  set priority(int newPriority){
    if(newPriority <= 2 && newPriority >= 1){
      this._priority = newPriority;
    }
  }


  // convert Note object to map Object
  Map<String, dynamic> toMap(){

    var map = Map<String, dynamic>();

    if(id != null)
      map["id"] = _id;

    map["title"] = _title;
    map["description"] = _description;
    map["priority"] = _priority;
    map["date"] = _date;

    return map;
  }

  // Extract Note object from map object
  Note.fromMapObject(Map<String, dynamic> map){

    this._id = map["id"];
    this._title = map["title"];
    this._description = map["description"];
    this._priority = map["priority"];
    this._date = map["date"];

  }

}






























