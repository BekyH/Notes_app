

import 'package:notes_app/models/note.dart';

abstract class NotesEvent{
  NotesEvent({this.notes});
  List<Note>? notes;

}

class GetAllNotesEvent extends NotesEvent{

}

class CreateNoteEvent extends NotesEvent{
  Note note;
  CreateNoteEvent(this.note);
}


class DeleteNoteEvent extends NotesEvent{
  int id;
  DeleteNoteEvent(this.id);
}

class UpdateNoteEvent extends NotesEvent{
  Note note;
  UpdateNoteEvent(this.note);
}

class DeleteAllNoteEvent extends NotesEvent{

}

class ShowNotesInGridEvent extends NotesEvent{

}

class ShowNotesInListEvent extends NotesEvent{

}

class CloseDBEvent extends NotesEvent{
      
}