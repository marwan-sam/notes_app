// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/cubits/note_store/cubit/notes_cubit.dart';
import 'package:note_app/layouts/components.dart';
import 'package:note_app/model/model_note.dart';
import 'package:note_app/screens/widgets/appBar.dart';
import 'package:note_app/screens/widgets/listview_edit_colors.dart';
// import 'package:note_app/screens/widgets/listview_edit_colors.dart';

class BodyOfListViewNotes extends StatefulWidget {
  const BodyOfListViewNotes({
    Key? key,
    required this.note,
  }) : super(key: key);

  final NoteModel note;

  @override
  State<BodyOfListViewNotes> createState() => _BodyOfListViewNotesState();
}

class _BodyOfListViewNotesState extends State<BodyOfListViewNotes> {
  String? title, subTitle;

  void initState() {
    // TODO: implement initState
    widget.note.color = 0xff00a98f;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 50.0),
              child: AppBarScreen(
                txtTitle: 'Edit Note',
                icon: const Icon(Icons.close),
                clickOnIcon: () {
                  Navigator.pop(context);
                  //TODO -  Add Message To "No Change"
                },
              ),
            ),
            Column(
              children: [
                StandardUI(
                  hint1: widget.note.title,
                  hint2: widget.note.subTitle,
                  onChangeValue1: (value) {
                    title = value;
                  },
                  onChangeValue2: (value) {
                    subTitle = value;
                  },
                ),
                EditListViewColors(
                  note: widget.note,
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Center(
                  child: ButtonOrProcess(
                    txt: 'Accepted Change',
                    clicked: () {
                      widget.note.title = title ?? widget.note.title;
                      widget.note.subTitle = subTitle ?? widget.note.subTitle;
                      widget.note.save();
                      BlocProvider.of<NotesCubit>(context).fetchNotes();
                      Navigator.pop(context);
                    },
                    btnWidth: MediaQuery.of(context).size.width,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
