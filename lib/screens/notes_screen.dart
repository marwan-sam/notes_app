import 'package:flutter/material.dart';
import 'package:note_app/screens/widgets/appBar.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:note_app/screens/widgets/listview_notes.dart';

import '../layouts/components.dart';
import 'widgets/add_note_by_model_sheet.dart';

class NotesScreen extends StatelessWidget {
  const NotesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            isScrollControlled: true,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.0),
            ),
            context: context,
            builder: (context) => ModelSheetAddNewNote(),
          );
        },
        child: const Icon(Icons.add),
      ),
      body: BodyOfItems(
        BodyOf: const ListViewNotes(),
        AppBar: AppBarScreen(
          txtTitle: 'Note',
          icon: Icons.search,
        ),
      ),
    );
  }
}
