import 'package:flutter/material.dart';
import 'package:note_app/screens/notes_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // theme: ThemeData.light(),
      theme: ThemeData.dark(),
      home: const NotesScreen(),
    );
  }
}
