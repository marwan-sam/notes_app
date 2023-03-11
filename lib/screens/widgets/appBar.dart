import 'package:flutter/material.dart';
import 'package:note_app/layouts/componts.dart';

class AppBarScreen extends StatelessWidget {
  AppBarScreen({super.key, required this.txtTitle, required this.icon});

  String txtTitle;
  IconData icon;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TitleAppBarUI(txt: txtTitle),
        IconAppBarUI(icon: icon),
      ],
    );
  }
}
