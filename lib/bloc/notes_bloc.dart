import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/bloc/notes_event.dart';
import 'package:notes_app/bloc/notes_state.dart';
import 'package:notes_app/models/note.dart';
import 'package:notes_app/repository/notes_repository.dart';

class NotesBloc extends Bloc<NotesEvent,NotesState>{

  final NotesRepoistory notesRepoistory;
  NotesBloc({required this.notesRepoistory}):super(NotesInitalState()){
  on<GetAllNotesEvent>((event,emit) async{
      emit(NotesLoadingState());
      try{
        List<Note> notes = await notesRepoistory.getAllNotes();
        
        emit(NotesLoadedState(notes));
      }
      catch(e){
        print(e.toString());
          emit(NotesErrorState(e.toString()));
      }
  });
  on<DeleteAllNoteEvent>((event,emit) async{
    try{
         bool deleted =  await notesRepoistory.deleteAllNote();
    if(deleted){
     emit(AllNotesDeletedState());

    }
    else{
      emit(NotesErrorState("Notes are not deleted"));
    }
    }
    catch(e){
     emit(NotesErrorState(e.toString()));
    }
   
  });
  on<ShowNotesInGridEvent>((event,emit){
   emit(ShowNotesViewState(true));
  });

  on<ShowNotesInListEvent>((event,emit){
    emit(ShowNotesViewState(false));
  });

  on<CreateNoteEvent>((event,emit) async{

      try{
         await notesRepoistory.createNote(event.note);
         List<Note> notes = await notesRepoistory.getAllNotes();
         emit(CreateNoteState(notes));
      }

      catch(e){
        emit(NotesErrorState(e.toString()));
      }
    

  });
  
  on<UpdateNoteEvent>((event,emit) async{
    try{
       bool updated = await notesRepoistory.updateNote(event.note);
       if(updated){
       List<Note> notes = await notesRepoistory.getAllNotes();

       emit(UpdateNoteState(notes));

       }
       else{
        emit(NotesErrorState("note is not updated"));
       }
    }
    catch(e){
      emit(NotesErrorState(e.toString()));
    }
    

  });

  on<DeleteNoteEvent>((event,emit) async{
    try{
          bool deleted = await notesRepoistory.deleteNote(event.id);
          if(deleted){
             List<Note> notes = await notesRepoistory.getAllNotes();
     emit(DeleteNoteState(notes));  
          }
          else{
            emit(NotesErrorState("Note is not deleted"));
          }
     
    }
    catch(e){
      emit(NotesErrorState(e.toString()));
    }
    
  });

  }
}