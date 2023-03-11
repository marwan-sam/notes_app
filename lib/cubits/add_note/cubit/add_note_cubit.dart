import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:note_app/layouts/conts.dart';
import 'package:note_app/model/model_note.dart';

part 'add_note_state.dart';

class AddNoteCubit extends Cubit<AddNoteState> {
  AddNoteCubit() : super(AddNoteInitialState());

  // add note method :=
  addNote(NoteModel data) async {
    emit(AddNoteLoadingState());
    try {
      var notesBox = Hive.box<NoteModel>(boxNoteHive);
      await notesBox.add(data);
      emit(AddNoteSuccState());
    } catch (e) {
      emit(AddNoteErrorState(e.toString()));
    }
  }
}
