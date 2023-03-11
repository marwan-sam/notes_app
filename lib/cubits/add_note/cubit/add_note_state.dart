part of 'add_note_cubit.dart';

@immutable
abstract class AddNoteState {}

class AddNoteInitial extends AddNoteState {}

class AddNoteLoading extends AddNoteState {}

class AddNoteSucc extends AddNoteState {}

class AddNoteError extends AddNoteState {
  final String error;

  AddNoteError(this.error);
}
