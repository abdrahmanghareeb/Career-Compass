import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hexcolor/hexcolor.dart';

Widget defaultFormField(
    {prefixIcon,
     suffixIcon,
      onIconTap,
    required controller,
    required label,
    required validator,
    TextInputType = TextInputType.text}) {
  return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        border: null,
        borderRadius: BorderRadius.horizontal(
            left: Radius.circular(15), right: Radius.circular(15)),
      ),
      child: TextFormField(
        controller: controller,
        maxLines: 1,
        validator: (value) {
          if (value!.isEmpty) return "$validator";
        },
        keyboardType: TextInputType,
        decoration: InputDecoration(
          prefixIcon: Icon(prefixIcon),
          suffixIcon: GestureDetector(onTap : onIconTap ,child: Icon(suffixIcon)),
          label: Text("$label"),
          border: InputBorder.none,
        ),
      ));
}

Widget TheAppButton({required VoidCallback function, required String text}) {
  return MaterialButton(
    minWidth: double.infinity,
      onPressed: function,
      child: Container(
          height: 50,
          decoration: BoxDecoration(
              shape: BoxShape.rectangle, color: HexColor("#50C2C9")),
          child: Center(
              child: Text(
            text,
            style: TextStyle(color: Colors.white),
          ))));
}
