import 'package:flutter/material.dart';
import 'package:note_app/components/componts.dart';

class ListViewNotes extends StatelessWidget {
  const ListViewNotes({super.key});

  final colors = const [];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 5,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: NoteItmeUI(),
        );
      },
    );
  }
}
