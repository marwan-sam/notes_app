part of 'add_note_cubit.dart';

@immutable
abstract class AddNoteState {}

class AddNoteInitialState extends AddNoteState {}

class AddNoteLoadingState extends AddNoteState {}

class AddNoteSuccState extends AddNoteState {}

class AddNoteErrorState extends AddNoteState {
  final String error;

  AddNoteErrorState(this.error);
}
