import 'package:flutter/material.dart';

import '../layouts/componts.dart';
import 'widgets/appBar.dart';

class EditNoteScreen extends StatelessWidget {
  const EditNoteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: BodyOfChilds(
          BodyOf: BodyOfWidgetUI(
            txt1: 'Will Edit Note',
            txt2: 'Content Of Note',
            txtBtn: 'Accepted Edit',
          ),
          AppBar: AppBarScreen(
            txtTitle: 'Note Edit',
            icon: Icons.check,
          ),
        ),
      ),
    );
  }
}
