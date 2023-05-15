import 'package:flutter/material.dart';
import 'package:note_app/layouts/components.dart';
import 'package:note_app/layouts/conts.dart';
import 'package:note_app/model/model_note.dart';
import 'package:note_app/screens/widgets/item_color_ui.dart';

class EditListViewColors extends StatefulWidget {
  EditListViewColors({super.key, required this.note});
  final NoteModel note;
  @override
  State<EditListViewColors> createState() => _EditListViewColorsState();
}

class _EditListViewColorsState extends State<EditListViewColors> {
  double h = 25;
  int? itActive;
  @override
  void initState() {
    // TODO: implement initState
    itActive = 0;
    widget.note.color = 0xff00a98f;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: h * 2,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: colors.length,
        itemBuilder: (context, index) {
          return ListOf(
            onTap: () {
              setState(() {
                itActive = index;
                widget.note.color = colors[index].value;
              });
            },
            viewItem: ItemColorUI(
              isActive: index == itActive,
              color: colors[index],
            ),
          );
        },
      ),
    );
  }
}
