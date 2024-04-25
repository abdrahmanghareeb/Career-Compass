import 'package:career_compass/Layouts/GetStarted.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class splashScreen extends StatefulWidget{
  @override
  State<splashScreen> createState() => _splashScreenState();
}

class _splashScreenState extends State<splashScreen> {

  void _navigateIf(context) async{
    await Future.delayed(Duration(milliseconds: 3000));
    // if signed or if not
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => GetStartedScreen(),));

  }

  @override
  void initState() {
    super.initState();
    _navigateIf(context);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(width: 300 ,height: 300,"assets/splash.png" ,fit: BoxFit.fill,),
            ],
          ),
        ),
    );
  }
}