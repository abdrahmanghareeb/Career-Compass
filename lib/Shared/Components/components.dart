import 'package:career_compass/Shared/Constants/color.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import 'CustomShape.dart';

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
      decoration:  BoxDecoration(
        color: HexColor(color),
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

Widget appButton({required VoidCallback function, required String text}) {
  return MaterialButton(
    minWidth: double.infinity,
      onPressed: function,
      child: Container(
          height: 60,
          decoration: BoxDecoration(
              shape: BoxShape.rectangle, color: HexColor("#50C2C9")),
          child: Center(
              child: Text(
            text,
            style: TextStyle(color: Colors.white ,fontSize: 20),
          ))));
}

Widget clickableText({required context, mainText = "", secText = "" ,required GestureTapCallback function}){
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
                color: HexColor(main_color),
                fontSize: Theme.of(context).textTheme.bodyLarge?.fontSize
            ) ,
            "$secText"
        ),
      ],
    ),
  );
}

Widget TextAppBar({required text}){
  return Text(text,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 25,
      )
  );
}

Widget cardItem({required text}){
  return Container(
    width: double.infinity,
    child: TextButton(
      onPressed: (){},
      child: Text(
        text,
        style: TextStyle(
          color: Colors.black,
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
      ),
      style: TextButton.styleFrom(
          backgroundColor: HexColor(most_searched_color),
          shape: LinearBorder(),
          alignment: Alignment.centerLeft
      ),
    ),
  );
}

Widget drawerItem({required icon,required text , required GestureTapCallback function}){
  return InkWell(
    onTap: function,
    child: Row(
      children: [
        //icon,
        Icon(icon,size: 30,),
        const SizedBox(width: 40,),
        Text(text,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
      ],
    ),
  );
}

PreferredSizeWidget AppBarComponent({@required title , isSearch}){
  return AppBar(
    backgroundColor: Colors.white,
    elevation: 0.0,
    toolbarHeight: 120,
    flexibleSpace: ClipPath(
      clipper: CustomShape(),
      child: Container(
        height: 200.0,
        color: HexColor(main_color),
      ),
    ),
    title: TextAppBar(text: '$title'),
    centerTitle: true,
    actions:  [isSearch ? IconButton(onPressed: (){}, icon: Icon(Icons.search)): Text("")],
  );
}