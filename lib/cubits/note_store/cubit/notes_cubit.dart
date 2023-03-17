import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:note_app/model/model_note.dart';

import '../../../layouts/conts.dart';

part 'notes_state.dart';

class NotesCubit extends Cubit<NotesState> {
  NotesCubit() : super(NotesInitial());

  List<NoteModel>? notes;
  // fetch all notes method :=
  fetchNotes() {
    var notesBox = Hive.box<NoteModel>(boxNoteHive);
    notes = notesBox.values.toList();

    emit(SuccGetNotesState());
  }
}
