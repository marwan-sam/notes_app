import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:note_app/cubits/add_note/cubit/add_note_cubit.dart';
import 'package:note_app/cubits/note_store/cubit/notes_cubit.dart';
import 'package:note_app/layouts/components.dart';
import 'package:note_app/model/model_note.dart';

class ModelSheetAddNewNote extends StatefulWidget {
  const ModelSheetAddNewNote({super.key});

  @override
  State<ModelSheetAddNewNote> createState() => _ModelSheetAddNewNoteState();
}

class _ModelSheetAddNewNoteState extends State<ModelSheetAddNewNote> {
  final GlobalKey<FormState> formKey = GlobalKey();

  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  String? title, subTitle;

  bool isloadingState = false;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddNoteCubit(),
      child:
          BlocConsumer<AddNoteCubit, AddNoteState>(listener: (context, state) {
        // TODO: implement listener
        if (state is AddNoteLoadingState) {
          isloadingState = true;
        } else {
          isloadingState = false;
        }

        if (state is AddNoteSuccState) {
          Navigator.pop(context);
          BlocProvider.of<NotesCubit>(context).fetchNotes();
        } else if (state is AddNoteErrorState) {
          print('error from state add note :]= ${state.error}');
        }
      }, builder: (context, state) {
        return AbsorbPointer(
          absorbing: state is AddNoteLoadingState ? true : false,
          child: Form(
            key: formKey,
            autovalidateMode: autovalidateMode,
            child: Padding(
              padding: EdgeInsets.only(
                left: 16.0,
                right: 16.0,
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      StandardFormUI(
                        hint1: 'Add A New Note',
                        hint2: 'Content Of Note',
                        onSaved1: (value) {
                          title = value;
                        },
                        onSaved2: (value) {
                          subTitle = value;
                        },
                      ),
                      BlocBuilder<AddNoteCubit, AddNoteState>(
                          builder: (context, state) {
                        return ButtonOrProcess(
                          isLoading:
                              state is AddNoteLoadingState ? true : false,
                          txt: 'Add',
                          clicked: () {
                            if (formKey.currentState!.validate()) {
                              formKey.currentState!.save();
                              var time =
                                  DateFormat.yMd().format(DateTime.now());
                              // DateFormat('dd/mm/yyyy  :  HH:MM').format(DateTime.now());
                              var data = NoteModel(
                                title: title!,
                                subTitle: subTitle!,
                                date: time,
                                color: Colors.blue.value,
                              );
                              BlocProvider.of<AddNoteCubit>(context)
                                  .addNote(data);
                            } else {
                              setState(() {
                                // make validate live
                                autovalidateMode = AutovalidateMode.always;
                              });
                            }
                          },
                          btnWidth: MediaQuery.of(context).size.width,
                        );
                      }),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
