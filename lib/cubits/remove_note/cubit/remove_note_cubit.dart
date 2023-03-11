import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'remove_note_state.dart';

class RemoveNoteCubit extends Cubit<RemoveNoteState> {
  RemoveNoteCubit() : super(RemoveNoteInitial());
}
