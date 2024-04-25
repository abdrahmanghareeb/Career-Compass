import 'package:career_compass/Layouts/GetStarted.dart';
import 'package:career_compass/Layouts/splashScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';

import 'Layouts/LoginScreen.dart';
import 'Shared/Cubit/app_observer.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          textTheme: TextTheme(titleLarge: TextStyle(fontWeight: FontWeight.bold)),
          scaffoldBackgroundColor: HexColor("#FBF9F9")
          // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          // useMaterial3: true,
        ),
        home: splashScreen()
    );
  }
}
