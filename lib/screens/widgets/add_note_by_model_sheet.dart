import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:note_app/cubits/add_note/cubit/add_note_cubit.dart';
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
    return BlocConsumer<AddNoteCubit, AddNoteState>(
      listener: (context, state) {
        // TODO: implement listener
        if (state is AddNoteError) {
          print('is error :==> ${state.error}');
        }

        if (state is AddNoteSucc) {
          Navigator.pop(context);
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state is AddNoteLoading ? true : false,
          child: Container(
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
          ),
        );
      },
    );
  }
}
