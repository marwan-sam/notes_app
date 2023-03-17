import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/cubits/note_store/cubit/notes_cubit.dart';
import 'package:note_app/layouts/components.dart';
import 'package:note_app/model/model_note.dart';
import 'package:note_app/screens/edite_new_note_screen.dart';

class ListViewNotes extends StatefulWidget {
  const ListViewNotes({super.key});

  @override
  State<ListViewNotes> createState() => _ListViewNotesState();
}

class _ListViewNotesState extends State<ListViewNotes> {
  final colors = const [];

  @override
  void initState() {
    BlocProvider.of<NotesCubit>(context).fetchNotes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotesCubit, NotesState>(
      builder: (context, state) {
        List<NoteModel> notes =
            BlocProvider.of<NotesCubit>(context).notes ?? [];
        print(notes);
        return ListView.builder(
          padding: EdgeInsets.zero,
          itemCount: notes.length,
          // itemCount: 4,

          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 6),
              child: NoteItmeUI(
                iconTrailingCilck: () {
                  notes[index].delete();
                  BlocProvider.of<NotesCubit>(context).fetchNotes();
                },
                item: notes[index],
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
      },
    );
  }
}
