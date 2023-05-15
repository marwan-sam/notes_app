import 'package:flutter/material.dart';

class ItemColorUI extends StatefulWidget {
  const ItemColorUI({super.key, required this.isActive, required this.color});

  final bool isActive;
  final Color color;
  @override
  State<ItemColorUI> createState() => _ItemColorUIState();
}

class _ItemColorUIState extends State<ItemColorUI> {
  double h = 30;

  @override
  Widget build(BuildContext context) {
    return widget.isActive
        ? CircleAvatar(
            radius: h,
            backgroundColor: Colors.white,
            child: CircleAvatar(
              radius: h - 8,
              backgroundColor: widget.color,
            ),
          )
        : CircleAvatar(
            radius: h - 10,
            backgroundColor: widget.color,
          );
  }
}
