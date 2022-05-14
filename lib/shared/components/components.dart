import 'package:flutter/material.dart';
import 'package:bmi/shared/styles/colors.dart';
import 'package:flutter/services.dart';

Widget textFormField({
  @required TextEditingController controller,
  @required TextInputType textType }) => TextFormField(

  controller: controller,
  inputFormatters: <TextInputFormatter> [FilteringTextInputFormatter.digitsOnly],
  keyboardType: textType,
  cursorColor: TextColors.textColorBlack,
  style: TextStyle(fontFamily: 'MISTRAL',  fontSize: 25, color: TextColors.textColorBlack),
  decoration: InputDecoration(
    border: InputBorder.none,
    disabledBorder: InputBorder.none,
    enabledBorder: InputBorder.none,
    focusedBorder: InputBorder.none,
  ),
);

Widget weightTextButton({
  Function onPressed }) => TextButton(
  onPressed: null,
  child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Kg', style: TextStyle(fontFamily: 'MISTRAL', fontSize: 25, color: TextColors.textColorBlack),),
      ]
  ),
  style: ButtonStyle(
    shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0))),
    padding: MaterialStateProperty.all(const EdgeInsets.all(10.0)),
    backgroundColor: MaterialStateProperty.all(TextColors.textColorWhite),
  ),
);

Widget heightTextButton({
  Function onPressed }) => TextButton(
  onPressed: null,
  child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Cm', style: TextStyle(fontFamily: 'MISTRAL', fontSize: 25, color: TextColors.textColorBlack),),
      ]
  ),
  style: ButtonStyle(
    shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0))),
    padding: MaterialStateProperty.all(const EdgeInsets.all(10.0)),
    backgroundColor: MaterialStateProperty.all(TextColors.textColorWhite),
  ),
);
