import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:note_app/cubits/add_note/cubit/add_note_cubit.dart';
import 'package:note_app/cubits/note_store/cubit/notes_cubit.dart';
import 'package:note_app/model/model_note.dart';
import 'package:note_app/screens/notes_screen.dart';

import 'BlocObserver.dart';
import 'layouts/conts.dart';

void main() async {
  // stp = 1
  await Hive
      .initFlutter(); // to init. dart extentions hive flutter use import => hive_flutter.dart

  // stp = 2 : register typeAdaptor :=
  Hive.registerAdapter(NoteModelAdapter());

  // stp = 3
  await Hive.openBox<NoteModel>(boxNoteHive);

  // check for observer this bloc :
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NotesCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        // theme: ThemeData.light(),
        theme: ThemeData(
          brightness: Brightness.dark,
          fontFamily: 'Poppins',
        ),

        home: const NotesScreen(),
      ),
    );
  }
}
