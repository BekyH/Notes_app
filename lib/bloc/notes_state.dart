
import 'package:flutter/material.dart';
import 'package:notes_app/models/note.dart';

abstract class NotesState{}

class NotesInitalState extends NotesState{}

class NotesLoadingState extends NotesState{}

class NotesLoadedState extends NotesState{
  List<Note> notes;
  NotesLoadedState(this.notes);
}
class CreateNoteState extends NotesState{
    List<Note> notes;
    CreateNoteState(this.notes);
}

class UpdateNoteState extends NotesState{
  List<Note> notes;
  UpdateNoteState(this.notes);
}

class AllNotesDeletedState extends NotesState{

}

class DeleteNoteState extends NotesState{
  List<Note> notes;
  DeleteNoteState(this.notes);
}

class NotesErrorState extends NotesState{
  String message;
  NotesErrorState(this.message);
}

class ShowNotesViewState extends NotesState{
  bool inGrid = false;
  ShowNotesViewState(this.inGrid);
}
