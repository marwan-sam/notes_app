import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/cubits/note_store/cubit/notes_cubit.dart';
import 'package:note_app/layouts/components.dart';
import 'package:note_app/model/model_note.dart';

class SearchResultsBody extends StatelessWidget {
  const SearchResultsBody({Key? key, required this.query}) : super(key: key);
  final String query;

  @override
  Widget build(BuildContext context) {
    List<NoteModel>? notesResult = query.isEmpty
        ? BlocProvider.of<NotesCubit>(context).notes
        : BlocProvider.of<NotesCubit>(context)
            .notes!
            .where((e) => e.title.toLowerCase().startsWith(query))
            .toList();
    return BlocConsumer<NotesCubit, NotesState>(
      listener: (context, state) {
        if (state is SuccGetNotesState) {
          notesResult = query.isEmpty
              ? BlocProvider.of<NotesCubit>(context).notes
              : BlocProvider.of<NotesCubit>(context)
                  .notes!
                  .where((e) => e.title.toLowerCase().startsWith(query))
                  .toList();
        }
      },
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 32,
              ),
              Expanded(
                  child: notesResult!.isEmpty
                      ? const Center(
                          child: Text(
                            'No Results',
                          ),
                        )
                      : ListView.builder(
                          itemCount: notesResult!.length,
                          itemBuilder: (context, index) {
                            return NoteItmeUI(item: notesResult![index]);
                          })),
            ],
          ),
        );
      },
    );
  }
}
