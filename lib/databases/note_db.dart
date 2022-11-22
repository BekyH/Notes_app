import 'dart:ffi';

import 'package:notes_app/models/note.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as path;

class NoteDB {
  NoteDB.init();

  static NoteDB? noteDB;
  Database? database;
  static final dbname = "NotesDatabase.db";
  static final _version = 1;
  static final tableName = 'notes';

  factory NoteDB() {
    return noteDB ??= NoteDB.init();
  }
  Future<Database> getDB() async {
    return database ??= await initDatabase();
  }

  Future<Database> initDatabase() async {
    final String databasePath = await getDatabasesPath();
    final String dbFilePath = path.join(databasePath, dbname);

    return await openDatabase(dbFilePath, version: _version,
        onCreate: (Database db, int version) async {
      await db.execute('''
                CREATE TABLE $tableName (
                    id INTEGER PRIMARY KEY AUTOINCREMENT,
                    title TEXT,
                    description TEXT,
                    
                    date TEXT
                )
                
                ''');
    });
  }

  Future<Note> insertNote(Note note) async {
    final Database db = await getDB();
    int id = await db.insert(tableName, note.toJson());
    return id > 0
        ? note.copyWith(id: id)
        : throw Exception('Data insertion failed');
  }

  Future<List<Note>> getAllNotes() async {
    final Database db = await getDB();

    List<Map<String, Object?>> noteList = await db.query(tableName);

    return noteList.map((note) => Note.fromJson(note)).toList();
  }

  Future<Note> getNote(int id) async {
    final Database db = await getDB();
    var result = await db.query(tableName, where: 'id=?', whereArgs: [id]);
    if (result.isNotEmpty) {
      return Note.fromJson(result.first);
    }

    throw Exception("Id not found");
  }

  Future<bool> updateNote(Note note) async {
    final Database db = await getDB();

    int updates = await db
        .update(tableName, note.toJson(), where: 'id=?', whereArgs: [note.id]);

    return updates > 0;
  }

  Future<bool> deleteNote(int id) async {
    final Database db = await getDB();

    int deleted = await db.delete(tableName, where: 'id=?', whereArgs: [id]);

    return deleted > 0;
  }

  Future<bool> deleteAllNotes() async {
    final Database db = await getDB();

    int deleted = await db.rawDelete('''
      DELETE FROM $tableName 
      ''');

    return deleted > 0;
  }

  Future<void> close() async {
    final Database db = await getDB();
    await db.close();
  }
}
