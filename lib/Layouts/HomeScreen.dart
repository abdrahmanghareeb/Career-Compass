import 'package:career_compass/Layouts/LoginScreen.dart';
import 'package:career_compass/Modules/ProfileScreen.dart';
import 'package:career_compass/Shared/Components/components.dart';
import 'package:career_compass/Shared/Constants/color.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';

import '../Shared/Components/CustomShape.dart';
import '../Shared/Cubit/Auth_Cubit/auth_cubit.dart';

class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit()..getUserState(),
      child: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if(state is SignOutSuccessState)
            navigateReplacementTo(context: context, widget: LoginScreen());
        },
        builder: (context, state) {
          var cubit = AuthCubit.get(context);
          // cubit.getUserState();
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBarComponent(title: "Home Screen", isSearch: true),
            drawer: appDrawer(cubit: cubit, context: context),
            body: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Most Searched',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const Text(
                      'The results based on real data \nfrom Job search sites.',
                      overflow:  TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 20),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    cardItem(text: 'Data Analysis'),
                    const SizedBox(
                      height: 20,
                    ),
                    cardItem(text: 'Data Science'),
                    const SizedBox(
                      height: 20,
                    ),
                    cardItem(text: 'Mobile Application'),
                    const SizedBox(
                      height: 20,
                    ),
                    cardItem(text: 'Web Development'),
                    const SizedBox(
                      height: 20,
                    ),
                    cardItem(text: 'Embedded  Systems'),
                    const SizedBox(
                      height: 20,
                    ),
                    cardItem(text: 'Machine Learning'),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
