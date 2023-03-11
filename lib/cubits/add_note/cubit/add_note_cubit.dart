import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:note_app/layouts/conts.dart';
import 'package:note_app/model/model_note.dart';

part 'add_note_state.dart';

class AddNoteCubit extends Cubit<AddNoteState> {
  AddNoteCubit() : super(AddNoteInitial());

  // add note method :=
  addNote(NoteModel data) async {
    emit(AddNoteLoading());
    try {
      var notesBox = Hive.box<NoteModel>(boxNoteHive);
      emit(AddNoteSucc());
      await notesBox.add(data);
    } catch (e) {
      AddNoteError(e.toString());
    }
  }
}
