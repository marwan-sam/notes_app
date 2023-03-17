part of 'notes_cubit.dart';

@immutable
abstract class NotesState {}

class NotesInitial extends NotesState {}

// class NotesLoadingState extends NotesState {}

class SuccGetNotesState extends NotesState {}

// class NotesErrorState extends NotesState {
//   final String error;

//   NotesErrorState(this.error);
// }
