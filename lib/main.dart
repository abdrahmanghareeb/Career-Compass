import 'package:career_compass/Layouts/GetStarted.dart';
import 'package:career_compass/Layouts/HomeScreen.dart';
import 'package:career_compass/Layouts/RegisterScreen.dart';
import 'package:career_compass/Layouts/splashScreen.dart';
import 'package:career_compass/Shared/Constants/color.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';

import 'Layouts/LoginScreen.dart';
import 'Layouts/ProfileScreen.dart';
import 'Shared/Cubit/app_observer.dart';

void main() async {
  Bloc.observer = MyBlocObserver();
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

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
      home: LoginScreen(),
    );
  }
}
