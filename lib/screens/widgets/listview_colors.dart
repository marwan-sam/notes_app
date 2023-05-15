import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/cubits/add_note/cubit/add_note_cubit.dart';
import 'package:note_app/layouts/components.dart';
import 'package:note_app/layouts/conts.dart';
import 'package:note_app/model/model_note.dart';
import 'package:note_app/screens/widgets/item_color_ui.dart';

class ListViewColors extends StatefulWidget {
  ListViewColors({super.key});
  int? itActive;
  @override
  State<ListViewColors> createState() => _ListViewColorsState();
}

class _ListViewColorsState extends State<ListViewColors> {
  double h = 25;
  @override
  void initState() {
    widget.itActive = 0;
    BlocProvider.of<AddNoteCubit>(context).color = Color(0xff00a98f);
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
                widget.itActive = index;
                BlocProvider.of<AddNoteCubit>(context).color = colors[index];
              });
            },
            viewItem: ItemColorUI(
              isActive: index == widget.itActive,
              color: colors[index],
            ),
          );
        },
      ),
    );
  }
}
