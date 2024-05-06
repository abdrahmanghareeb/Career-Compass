import 'package:career_compass/Layouts/Login%20&%20Register/LoginScreen.dart';
import 'package:career_compass/Shared/Components/components.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class GetStartedScreen extends StatefulWidget {
  @override
  State<GetStartedScreen> createState() => _GetStartedScreenState();
}

class _GetStartedScreenState extends State<GetStartedScreen> {

  void _navigate(context) {
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => LoginScreen(),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children:[
          Image.asset("assets/background1.png")
          ,Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/getStart.png"),
              Text("Gets things done with  Career Compass", style: Theme.of(context).textTheme.titleMedium,),
              SizedBox(height: 10),
              Text(
                  style: Theme.of(context).textTheme.bodyLarge ,
                  "Introducing “Career Compass”- the ultimate job qualification app. It offers a vast up-to-date database of job listings with detailed qualification breakdowns empowering job seekers to tailor their applications. Find the perfect match for your qualifications with Career Compass today!"),
             SizedBox(height: 20,),
              appButton(function: () => navigateTo(context: context , widget: LoginScreen()), text: "Get Started"),
            ],
          ),
        ),]
      ),
    );
  }
}
