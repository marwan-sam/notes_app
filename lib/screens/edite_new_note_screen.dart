import 'package:flutter/material.dart';

import '../layouts/components.dart';
import '../layouts/conts.dart';
import 'widgets/appBar.dart';

class EditNoteScreen extends StatefulWidget {
  const EditNoteScreen({super.key});

  @override
  State<EditNoteScreen> createState() => _EditNoteScreenState();
}

class _EditNoteScreenState extends State<EditNoteScreen> {
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  bool isLoadingState = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 50.0),
              child: AppBarScreen(
                txtTitle: 'Edit Note',
                icon: Icons.close,
              ),
            ),
            Form(
              key: formKey,
              autovalidateMode: autovalidateMode,
              child: Column(
                children: [
                  StandardFormUI(
                    hint1: 'Will Edit Note',
                    hint2: 'Content Of Note',
                  ),
                  Center(
                    child: isLoadingState
                        ? const CircularProgressIndicator(
                            color: blueDarkColor,
                          )
                        : ButtonOrProcess(
                            txt: 'Accepted Change',
                            clicked: () {},
                            btnWidth: MediaQuery.of(context).size.width,
                          ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
