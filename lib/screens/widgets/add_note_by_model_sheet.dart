import 'package:flutter/material.dart';
import 'package:note_app/layouts/componts.dart';

class ModelSheetAddNewNote extends StatefulWidget {
  const ModelSheetAddNewNote({super.key});

  @override
  State<ModelSheetAddNewNote> createState() => _ModelSheetAddNewNoteState();
}

class _ModelSheetAddNewNoteState extends State<ModelSheetAddNewNote> {
  final double h = 600;
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? title, subTitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: h,
      child: StandardFormUI(
          key: formKey,
          autovalidateMode: autovalidateMode,
          hint1: 'Add A New Note',
          hint2: 'Content Of Note',
          txtBtn: 'Add',
          widthBtn: MediaQuery.of(context).size.width,
          onSaved1: (value) {
            title = value;
          },
          onSaved2: (value) {
            subTitle = value;
          },
          onClickBtn: () {
            if (formKey.currentState!.validate()) {
              formKey.currentState!.save();
            } else {
              setState(() {
                // make validate live
                autovalidateMode = AutovalidateMode.always;
              });
            }
          }),
    );
  }
}
