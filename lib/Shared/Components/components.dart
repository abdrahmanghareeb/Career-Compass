
import 'package:career_compass/Shared/Constants/color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

void navigateTo({@required context , @required widget}) {
  Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ));
}
void navigateReplacementTo({@required context , @required widget}) {
  Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ));
}

Widget defaultFormField(
    {prefixIcon,
     suffixIcon,
      onIconTap,
    required controller,
    required label,
     validator,
      color = "#FFFFFF",
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
          focusColor: HexColor(color),
          fillColor: HexColor(color),
          hoverColor: HexColor(color),
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

//used in the login/sign_up screen
Widget ClickableText({required context, mainText = "", secText = "" ,required GestureTapCallback function}){
  return GestureDetector(
    onTap: function,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
            style: Theme.of(context).textTheme.bodyLarge ,
            "$mainText"
        ),
        Text(
            style: TextStyle(
                fontFamily: Theme.of(context).textTheme.bodyLarge?.fontFamily,
                color: HexColor("#50C2C9"),
                fontSize: Theme.of(context).textTheme.bodyLarge?.fontSize
            ) ,
            "$secText"
        ),
      ],
    ),
  );
}
