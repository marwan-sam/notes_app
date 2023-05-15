import 'package:flutter/material.dart';
import 'package:note_app/model/model_note.dart';

import 'widgets/body_listview_notes.dart';

class EditNoteScreen extends StatelessWidget {
  const EditNoteScreen({super.key, required this.note});

  final NoteModel note;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BodyOfListViewNotes(
        note: note,
      ),
    );
  }
}
