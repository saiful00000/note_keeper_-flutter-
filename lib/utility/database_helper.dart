
import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:node_keeper/models/note.dart';



class DatabaseHelper{

  // singleton database helper
  static DatabaseHelper _databaseHelper;

  static Database _database;

  String noteTable = "note_table";
  String colId = "id";
  String colTitle = "totle";
  String colDescription = "description";
  String colPriority = "priority";
  String colDate = "date";

  // constractor to creat instance of database helper
  DatabaseHelper._createInstance();


  factory DatabaseHelper(){
    if(_databaseHelper == null) {
      _databaseHelper = DatabaseHelper._createInstance();
    }
  }

  Future<Database> get database async {
    if (_database == null) {
      _database = await initializeDatabase();
    }
    return _database;
  }

  Future<Database> initializeDatabase() async {
    // get the path on the directory
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + "notes.db";

    // create the database
    var noteDatabase = await openDatabase(path, version: 1, onCreate: _createDb);

    return noteDatabase;

  }


  void _createDb(Database db, int newVersion) async {

    await db.execute("CREATE TABLE $noteTable($colId INTEGER PRIMARY KEY AUTOINCREMENT, $colTitle TEXT, "
        "$colDescription TEXT, $colPriority INTEGER, $colDate TEXT)");
  }

  // fetch all note object from database
  Future<List<Map<String, dynamic>>> getNoteMapList() async {
    Database db = await this.database;
    var result = await db.query(noteTable, groupBy: "$colPriority ASC");
    return result;
  }

  // insert a note object to database
  Future<int> insertNote(Note note) async {
    Database db = await this.database;
    var result = db.insert(noteTable, note.toMap());
    return result;
  }

  // update a note object into the database
  Future <int> updateNote(Note note) async {
    var db = await this.database;
    var result = await db.update(noteTable, note.toMap(), where: "$colId == ?", whereArgs: [note.id]);
    return result;
  }

  // delete a note from database
  Future<int> deleteNote(int id) async {
    var db = await this.database;
    var result = db.rawDelete("DELETE FROM $noteTable WHERE $colId = $id");
    return result;
  }

  // get number of note in database
  Future<int> getCount() async {
    Database db = await this.database;
    List<Map<String, dynamic>> x = await db.rawQuery('SELECT COUNT (*) from $noteTable');
    int result = Sqflite.firstIntValue(x);
    return result;
  }

}


















