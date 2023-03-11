import 'package:flutter/material.dart';
import 'package:note_app/layouts/componts.dart';

class ModelSheetAddNewNote extends StatelessWidget {
  const ModelSheetAddNewNote({super.key});
  final double h = 600;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: h,
      child: BodyOfWidgetUI(
        txt1: 'Add A New Note',
        txt2: 'Content Of Note',
        txtBtn: 'Add',
        widthBtn: MediaQuery.of(context).size.width,
      ),
    );
  }
}
