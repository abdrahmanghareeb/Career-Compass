import 'dart:io';

import 'package:career_compass/Layouts/Start/splashScreen.dart';
import 'package:career_compass/Shared/Constants/Constants.dart';
import 'package:career_compass/Shared/Constants/color.dart';
import 'package:career_compass/Shared/Cubit/App_Cubit/app_cubit.dart';
import 'package:career_compass/Shared/Cubit/local/CasheHelper.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';


import 'Models/UserModel.dart';
import 'Shared/Cubit/app_observer.dart';

void main() async {
  Bloc.observer = MyBlocObserver();
  WidgetsFlutterBinding.ensureInitialized();

  await CasheHelper.init();
  bool? CacheValue = await CasheHelper.getFingerKeyBool(key: "$AuthFinger");

  if(Platform.isAndroid){
  await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyA0CQJHS7EKdOhHkmnK6qIC6OsAxgrBYN4",
            appId: "1:264491915352:android:86b6d91fa95041c8f4122d",
            messagingSenderId: "264491915352",
            projectId: "carrer-compas"));
  }

  bool Dummy = false;
  if(CacheValue != null){
    Dummy = CacheValue;
  }
  runApp( MyApp(Dummy));
}

class MyApp extends StatelessWidget {
  final bool boolValue;

  const MyApp(this.boolValue,{super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        floatingActionButtonTheme: FloatingActionButtonThemeData(backgroundColor: HexColor(main_color)),
          applyElevationOverlayColor: false,
          appBarTheme: AppBarTheme(
              color: HexColor(main_color),
              systemOverlayStyle: SystemUiOverlayStyle(
                systemNavigationBarColor: Colors.white,
                statusBarIconBrightness: Brightness.dark,
              )),
          textTheme:
              TextTheme(titleLarge: TextStyle(fontWeight: FontWeight.bold)),
          scaffoldBackgroundColor: Colors.white
          // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          // useMaterial3: true,
          ),
      home: SplashScreen(),
    );
  }
}
