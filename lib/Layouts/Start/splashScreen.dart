import 'package:career_compass/Layouts/Start/GetStarted.dart';
import 'package:career_compass/Layouts/Home%20&%20Profile%20&%20Settings/HomeScreen.dart';
import 'package:career_compass/Shared/Constants/Constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../Shared/Components/components.dart';
import 'FingerprintScreen.dart';

class SplashScreen extends StatefulWidget{
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {


  Future delay(context) async{
    await Future.delayed(Duration(milliseconds: 3000));
    // if signed or if not
  }

  @override
  void initState()  {
    super.initState();
    delay(context).then((value) {
      if(FirebaseAuth.instance.currentUser == null) {
        navigateReplacementTo(context: context, widget: GetStartedScreen());
      } else {
        //navigate to fingerprint screen if Auth_with_fingerprint = true
          navigateReplacementTo(context: context, widget: FingerprintScreen());

      }
    });

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