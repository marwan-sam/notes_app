part of 'notes_cubit.dart';

@immutable
abstract class NotesState {}

class NotesInitial extends NotesState {}

class NotesLoadingState extends NotesState {}

class NotesSuccState extends NotesState {
  final List<NoteModel> notesList;
  NotesSuccState(this.notesList);
}

class NotesErrorState extends NotesState {
  final String error;

  NotesErrorState(this.error);
}
