import 'package:flutter/material.dart';

import '../layouts/componts.dart';
import 'widgets/appBar.dart';

class EditNoteScreen extends StatefulWidget {
  const EditNoteScreen({super.key});

  @override
  State<EditNoteScreen> createState() => _EditNoteScreenState();
}

class _EditNoteScreenState extends State<EditNoteScreen> {
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: BodyOfChilds(
          BodyOf: StandardFormUI(
            key: formKey,
            autovalidateMode: autovalidateMode,
            hint1: 'Will Edit Note',
            hint2: 'Content Of Note',
            txtBtn: 'Accepted Edit',
          ),
          AppBar: AppBarScreen(
            txtTitle: 'Edit Note',
            icon: Icons.close,
          ),
        ),
      ),
    );
  }
}
