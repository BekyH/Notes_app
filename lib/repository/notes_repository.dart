import 'package:notes_app/databases/note_db.dart';
import 'package:notes_app/models/note.dart';

class NotesRepoistory {
  final NoteDB noteDB = NoteDB();

  Future<List<Note>> getAllNotes() async  {
    return await noteDB.getAllNotes();
  }

  Future<Note> getNote(int id) async {
    return await noteDB.getNote(id);
  }

  Future<Note> createNote(Note note) async {
    return await noteDB.insertNote(note);
  }

  Future<bool> updateNote(Note note) async {
    return await noteDB.updateNote(note);
  }

  Future<bool> deleteNote(int id) async {
    return await noteDB.deleteNote(id);
  }

  Future<bool> deleteAllNote() async {
    return await noteDB.deleteAllNotes();
  }

  Future<void> closeDB() async {
    await noteDB.close();
  }
}
