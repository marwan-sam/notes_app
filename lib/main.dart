import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:note_app/screens/notes_screen.dart';

import 'layouts/conts.dart';

void main() async {
  // stp = 1
  await Hive
      .initFlutter(); // to init. dart extentions hive flutter use import => hive_flutter.dart

  // stp = 2
  await Hive.box(boxNoteHive);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // theme: ThemeData.light(),
      theme: ThemeData(
        brightness: Brightness.dark,
        fontFamily: 'Poppins',
      ),

      home: const NotesScreen(),
    );
  }
}
