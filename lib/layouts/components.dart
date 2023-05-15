import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:note_app/model/model_note.dart';

import 'conts.dart';

// * Icon Search = :
Widget IconAppBarUI(
        {required Widget icon, required void Function()? clickOn}) =>
    Container(
      // width: 38,
      // padding: const EdgeInsets.all(5.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: Colors.white.withOpacity(0.1),
      ),
      child: IconButton(
        onPressed: clickOn,
        icon: icon,
        color: Colors.white.withOpacity(0.9),
        // weight: 20,
        iconSize: 30,
      ),
    );

// * Style-txt = Word = Notes :
Widget TitleAppBarUI({required String txt}) => Text(
      txt,
      style: const TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    );

// * one of item note: =
Widget NoteItmeUI({
  void Function()? onTap,
  required final NoteModel item,
  VoidCallback? iconTrailingCilck,
}) =>
    GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Color(item.color),
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
                title: Text(
                  item.title,
                  style: const TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Padding(
                  padding: const EdgeInsets.only(
                    top: 8,
                    bottom: 8,
                  ),
                  child: Text(
                    item.subTitle,
                    style: const TextStyle(
                      fontSize: 15.0,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                trailing: IconButton(
                  onPressed: iconTrailingCilck,
                  icon: const Icon(FontAwesomeIcons.trash),
                ),
              ),
              Text(item.date),
            ],
          ),
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
  Function(String)? onChangeValue,
  Icon? suffixIconAddInLeft,
  Color? suffixColor,
  Icon? perfixIconAddInRight,
  Color? perfixColor,
  TextEditingController? controller,
  bool isPassword = false,
  int? maxLines = 1,
  void Function(String?)? onSaved,
}) =>
    TextFormField(
      onSaved: onSaved,
      maxLines: maxLines,
      style: styleTxt,
      obscureText: isPassword,
      controller: controller,
      onFieldSubmitted: onFieldSubmitted,
      validator: (data) {
        if (data!.isEmpty) {
          return "Value Can't Be Empty !";
        }
        return null;
      },
      onChanged: onChangeValue,
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

// * For Btn Add New Notes :=
Widget ButtonOrProcess({
  required String txt,
  Color btnBackground = Colors.white,
  Color txtColor = blueDarkColor,
  double txtSize = 20.0,
  double btnWidth = double.infinity,
  double btnHeight = 50.0,
  double radius = 10.0,
  VoidCallback? clicked,
  bool isLoading = false,
}) =>
    GestureDetector(
      onTap: clicked,
      child: Container(
        width: btnWidth,
        height: btnHeight,
        decoration: BoxDecoration(
          color: btnBackground,
          borderRadius: BorderRadius.circular(radius),
        ),
        child: Center(
          child: isLoading
              ? const SizedBox(
                  width: 24,
                  height: 24,
                  child: CircularProgressIndicator(
                    color: blueDarkColor,
                  ),
                )
              : Text(
                  txt,
                  style: TextStyle(
                    color: txtColor,
                    // fontFamily: 'Pacifico',
                    fontSize: txtSize,
                  ),
                ),
        ),
      ),
    );

Widget BodyOfItems({
  Widget? BodyOf,
  required Widget AppBar,
  double heigth = 700,
}) =>
    Padding(
      padding: const EdgeInsets.all(20.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 45.0,
            ),
            // * App Bar =
            AppBar,
            // * Notes :=
            // NoteItme(),
            SizedBox(
              height: heigth,
              child: BodyOf,
            ),
          ],
        ),
      ),
    );

// * after click in btn add to show in showModalBottomSheet or open stander form:=
Widget StandardUI({
  required String hint1,
  required String hint2,
  Function(String?)? onSaved1,
  Function(String?)? onSaved2,
  Function(String?)? onChangeValue1,
  Function(String?)? onChangeValue2,
}) =>
    SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(
            height: 30.0,
          ),
          InputsTextFormFeild(
            txtHint: hint1,
            onSaved: onSaved1,
            onChangeValue: onChangeValue1,
          ),
          const SizedBox(
            height: 30.0,
          ),
          InputsTextFormFeild(
            txtHint: hint2,
            onSaved: onSaved2,
            onChangeValue: onChangeValue2,
            maxLines: 4,
          ),
          const SizedBox(
            height: 20.0,
          ),
        ],
      ),
    );

Widget StandardFormUI({
  AutovalidateMode? autovalidateMode,
  Key? key,
  required Widget standardUI,
}) =>
    Form(
      key: key,
      autovalidateMode: autovalidateMode,
      child: standardUI,
    );

Widget ListOf({
  required void Function()? onTap,
  required Widget viewItem,
}) =>
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6),
      child: GestureDetector(
        onTap: onTap,
        child: viewItem,
      ),
    );
