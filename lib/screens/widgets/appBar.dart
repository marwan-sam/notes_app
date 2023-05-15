import 'package:flutter/material.dart';
import 'package:note_app/layouts/components.dart';

class AppBarScreen extends StatelessWidget {
  AppBarScreen({
    super.key,
    required this.txtTitle,
    required this.icon,
    required this.clickOnIcon,
  });

  String txtTitle;
  Widget icon;
  void Function()? clickOnIcon;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.max,
      children: [
        TitleAppBarUI(txt: txtTitle),
        IconAppBarUI(icon: icon, clickOn: clickOnIcon),
      ],
    );
  }
}
