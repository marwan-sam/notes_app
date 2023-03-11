import 'package:flutter/material.dart';
import 'package:note_app/layouts/componts.dart';
import 'package:note_app/screens/edite_new_note_screen.dart';

class ListViewNotes extends StatelessWidget {
  const ListViewNotes({super.key});

  final colors = const [];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      // shrinkWrap: true,
      // itemCount: 5,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: NoteItmeUI(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const EditNoteScreen(),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
