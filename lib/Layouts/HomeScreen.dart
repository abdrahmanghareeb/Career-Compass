import 'package:career_compass/Shared/Components/components.dart';
import 'package:career_compass/Shared/Constants/color.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import '../Shared/Components/CustomShape.dart';

class HomeScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: Drawer(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Flexible(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: 70,)
                      ,Image.asset("assets/userPhoto.png" , width: 150 ,height: 150),
                      SizedBox(height: 20,),
                      const Text('user2213456',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                      const SizedBox(height: 10,),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.star),Icon(Icons.star),Icon(Icons.star),Icon(Icons.star),Icon(Icons.star_half_sharp),
                        ],
                      ),
                      SizedBox(height: 15,),
                      const Text('Rate the App'),
                      SizedBox(height: 30,),
                      drawerItem(icon: Icons.person, text: 'Profile' , function: (){}),
                      SizedBox(height: 30,),
                      drawerItem(icon: Icons.chat, text: 'Chat Rooms' , function: (){}),
                      SizedBox(height: 30,),
                      drawerItem(icon: Icons.dashboard_customize_outlined, text: 'Chatbot',function: (){}),
                      SizedBox(height: 30,),
                      drawerItem(icon: Icons.settings, text: 'Settings',function: (){}),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(width: 1,),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Text('Sign Out',style: TextStyle(color: Colors.redAccent,fontWeight: FontWeight.bold,fontSize: 19),),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
      appBar: AppBarComponent(title: "Home Screen" ,isSearch: true),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Most Searched',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 15,),
            const Text('The results based on real data \nfrom Job search sites.',style: TextStyle(fontSize: 20),),
            const SizedBox(height: 30,),
            cardItem(text: 'Data Analysis'),
            const SizedBox(height: 20,),
            cardItem(text: 'Data Science'),
            const SizedBox(height: 20,),
            cardItem(text: 'Mobile Application'),
            const SizedBox(height: 20,),
            cardItem(text: 'Web Development'),
            const SizedBox(height: 20,),
            cardItem(text: 'Embedded  Systems'),
            const SizedBox(height: 20,),
            cardItem(text: 'Machine Learning'),
          ],
        ),
      ),
    );
  }
}

