import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// * Icon Search = :
Widget IconSreachUI() => Container(
      width: 38,
      padding: const EdgeInsets.all(5.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: Colors.white.withOpacity(0.1),
      ),
      child: Icon(
        Icons.search,
        color: Colors.white.withOpacity(0.9),
        // weight: 20,
        size: 30,
      ),
    );

// * Style-txt = Word = Notes :
Widget TitleUI() => const Text(
      "Notes",
      style: TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    );

// * one of item note: =
Widget NoteItmeUI() => Container(
      decoration: BoxDecoration(
        color: Colors.blueGrey,
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Padding(
        padding: const EdgeInsets.only(
          top: 32.0,
          left: 16.0,
          bottom: 32.0,
          right: 16.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ListTile(
              title: const Text(
                'Title Task',
                style: TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: const Padding(
                padding: EdgeInsets.only(
                  top: 8,
                  bottom: 8,
                ),
                child: Text(
                  'Descriptions Of Task',
                  style: TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              trailing: IconButton(
                onPressed: () {},
                icon: const Icon(FontAwesomeIcons.trash),
              ),
            ),
            const Text('20/2/2001'),
          ],
        ),
      ),
    );

// *LINK - Input text feild :=
Widget InputsTextFormFeild({
  TextStyle? styleTxt,
  void Function(String)? onFieldSubmitted,
  required String txtHint,
  TextStyle? hintStyle,
  Color colorBorderGeneral = Colors.black,
  Color colorBorderFoucsedOn = Colors.blue,
  Color colorBorderShowing = Colors.white,
  Color colorBorderError = Colors.red,
  Function(String)? savedValue,
  Icon? suffixIconAddInLeft,
  Color? suffixColor,
  Icon? perfixIconAddInRight,
  Color? perfixColor,
  TextEditingController? controller,
  bool isPassword = false,
}) =>
    TextFormField(
      style: styleTxt,
      obscureText: isPassword,
      controller: controller,
      onFieldSubmitted: onFieldSubmitted,
      validator: (data) {
        if (data!.isEmpty) {
          return 'Value Not Must Empty !';
        }
        return null;
      },
      onChanged: savedValue,
      decoration: InputDecoration(
        prefixIcon: perfixIconAddInRight,
        prefixIconColor: perfixColor,
        suffixIconColor: suffixColor,
        suffixIcon: suffixIconAddInLeft,
        hintText: txtHint,
        hintStyle: hintStyle,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: colorBorderShowing,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: colorBorderFoucsedOn,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: colorBorderError,
          ),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: colorBorderGeneral,
          ),
        ),
      ),
    );

// * after click in btn add to show in showModalBottomSheet :=
Widget BodyOfNewNoteUI() => Container(
      child: Column(
        children: [
          InputsTextFormFeild(
            txtHint: 'Add A New Note',
          ),
        ],
      ),
    );
