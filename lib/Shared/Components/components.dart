import 'package:career_compass/Layouts/Home%20&%20Profile%20&%20Settings/SettingsScreen.dart';
import 'package:career_compass/Layouts/Room/RoomsScreen.dart';
import 'package:career_compass/Layouts/Task%20Manager/TaskManagerScreen.dart';
import 'package:career_compass/Shared/Constants/Constants.dart';
import 'package:career_compass/Shared/Constants/color.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../Layouts/Home & Profile & Settings/ProfileScreen.dart';
import 'CustomShape.dart';

void navigateTo({@required context, @required widget}) {
  Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ));
}

void navigateReplacementTo({@required context, @required widget}) {
  Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ));
}

Widget defaultFormField(
    {
       height ,
      prefixIcon,
    suffixIcon,
    onIconTap,
    obsecure = false,
    required controller,
    required label,
    validator,
    color = "#FFFFFF",
    TextInputType = TextInputType.text}) {
  return Container(
    height: height,
      decoration: BoxDecoration(
        color: HexColor(color),
        border: null,
        borderRadius: const BorderRadius.horizontal(
            left: Radius.circular(15), right: Radius.circular(15)),
      ),
      child: TextFormField(
        obscureText: obsecure,
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
          suffixIcon:
              GestureDetector(onTap: onIconTap, child: Icon(suffixIcon)),
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
            style: TextStyle(color: Colors.white, fontSize: 20),
          ))));
}

Widget clickableText(
    {required context,
    mainText = "",
    secText = "",
    required GestureTapCallback function}) {
  return GestureDetector(
    onTap: function,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(style: Theme.of(context).textTheme.bodyLarge, "$mainText"),
        Text(
            style: TextStyle(
                fontFamily: Theme.of(context).textTheme.bodyLarge?.fontFamily,
                color: HexColor(main_color),
                fontSize: Theme.of(context).textTheme.bodyLarge?.fontSize),
            "$secText"),
      ],
    ),
  );
}

Widget TextAppBar({required text}) {
  return Text(text,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        color: Colors.black54,
        fontSize: 23,
      ));
}

Widget cardItem({required text}) {
  return Container(
    width: double.infinity,
    child: TextButton(
      onPressed: () {},
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
          alignment: Alignment.centerLeft),
    ),
  );
}

Widget drawerItem(
    {required icon, required text, required GestureTapCallback function}) {
  return InkWell(
    onTap: function,
    child: Row(
      children: [
        //icon,
        Icon(
          icon,
          size: 30,
        ),
        const SizedBox(
          width: 40,
        ),
        Text(
          text,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ],
    ),
  );
}

PreferredSizeWidget AppBarComponent({@required title, isSearch}) {
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
    actions: [
      isSearch
          ? IconButton(onPressed: () {}, icon: Icon(Icons.search))
          : Text("")
    ],
  );
}

Future<bool?> showToast({required msg}){
  return Fluttertoast.showToast(
      msg: "$msg",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: HexColor(main_color),
      textColor: Colors.white,
      fontSize: 16.0
  );
}

Widget appDrawer ({required cubit , required context}){
  return Drawer(
    child: Center(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 70,
                ),
                CircleAvatar(
                  radius: 70,
                  backgroundImage: NetworkImage(
                      user_profile_photo),
                ),
                SizedBox(
                  height: 20,
                ),
                ConditionalBuilder(
                  condition: cubit.user == null,
                  builder:(context) => Text('user name',
                    style: TextStyle(
                        fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  fallback:(context) => Text(
                    '${cubit.user.fullName.toString()}',
                    style: TextStyle(
                        fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.star),
                    Icon(Icons.star),
                    Icon(Icons.star),
                    Icon(Icons.star),
                    Icon(Icons.star_half_sharp),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                const Text('Rate the App'),
                SizedBox(
                  height: 30,
                ),
                drawerItem(
                    icon: Icons.person,
                    text: 'Profile',
                    function: () {
                      navigateTo(context: context, widget: ProfileScreen());
                    }),
                SizedBox(
                  height: 30,
                ),
                drawerItem(
                    icon: Icons.menu_open,
                    text: 'Task Manager',
                    function: () {
                      navigateTo(context: context, widget: TaskManagerScreen());
                    }),
                SizedBox(
                  height: 30,
                ),
                drawerItem(
                    icon: Icons.chat,
                    text: 'Chat Rooms',
                    function: () {
                      navigateTo(context: context, widget: RoomsScreen());
                    }),
                SizedBox(
                  height: 30,
                ),
                // drawerItem(
                //     icon: Icons.dashboard_customize_outlined,
                //     text: 'Chatbot',
                //     function: () {
                //     }),
                // SizedBox(
                //   height: 30,
                // ),
                drawerItem(
                    icon: Icons.settings,
                    text: 'Settings',
                    function: () {
                      navigateTo(context: context, widget: SettingsScreen());
                    }),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 1,
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: TextButton(
                    child: const Text(
                      'Sign Out',
                      style: TextStyle(
                          color: Colors.redAccent,
                          fontWeight: FontWeight.bold,
                          fontSize: 19),
                    ),
                    onPressed: () {
                      FirebaseAuth.instance.signOut();
                      cubit.changeSignOutState();
                    },
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    ),
  );
}
