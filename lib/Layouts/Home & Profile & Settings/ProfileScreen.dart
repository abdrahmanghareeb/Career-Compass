import 'dart:typed_data';

import 'package:career_compass/Layouts/Home%20&%20Profile%20&%20Settings/HomeScreen.dart';
import 'package:career_compass/Shared/Constants/Constants.dart';
import 'package:career_compass/Shared/Constants/color.dart';
import 'package:career_compass/Shared/Cubit/Auth_Cubit/auth_cubit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../Shared/Cubit/App_Cubit/app_cubit.dart';
import '../../Modules/PickImage.dart';
import '../../Shared/Components/components.dart';

class ProfileScreen extends StatelessWidget {
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AppCubit(),
        ),
        BlocProvider(
          create: (context) => AuthCubit(),
        ),
      ],
      child: BlocConsumer<AppCubit, AppState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          var cubit = AppCubit.get(context);
          var cubitAuth = AuthCubit.get(context);
          return Form(
            key: formKey,
            child: Scaffold(
              appBar: AppBarComponent(title: "Edit Profile", isSearch: false),
              body: SingleChildScrollView(
                child: SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("User Photo",
                            style: Theme.of(context).textTheme.titleLarge),
                        SizedBox(
                          height: 15,
                        ),
                        PickImage(),
                        SizedBox(
                          height: 15,
                        ),
                        Text("User Name",
                            style: Theme.of(context).textTheme.titleLarge),
                        SizedBox(
                          height: 15,
                        ),
                        Center(
                          child: defaultFormField(
                              validator: "required!!",
                              color: Grey_color,
                              controller: cubitAuth.fullNameController,
                              label: "Enter your full name"),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text("Phone Number",
                            style: Theme.of(context).textTheme.titleLarge),
                        SizedBox(
                          height: 15,
                        ),
                        Center(
                          child: defaultFormField(
                              validator: "required!!",
                              color: Grey_color,
                              TextInputType: TextInputType.phone,
                              controller: cubitAuth.phoneController,
                              label: "Update Your Phone Number"),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text("Job Title",
                            style: Theme.of(context).textTheme.titleLarge),
                        SizedBox(
                          height: 15,
                        ),
                        Center(
                          child: defaultFormField(
                              validator: "required!!",
                              color: Grey_color,
                              controller: cubit.jobTitleController,
                              label: "Enter your job title"),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text("Job Description",
                            style: Theme.of(context).textTheme.titleLarge),
                        SizedBox(
                          height: 15,
                        ),
                        Center(
                          child: defaultFormField(
                              validator: "required!!",
                              color: Grey_color,
                              controller: cubit.jobDescriptionController,
                              label: "Enter your job description"),
                        ),
                        SizedBox(height: 30),
                        appButton(
                            function: () {
                              bool? formIsValid = formKey.currentState?.validate();
                              if (formIsValid!) {
                                cubit.ChangeLocalPhotoSuccessState();
                                cubitAuth.Update_User(
                                    context: context,
                                    name: cubitAuth.fullNameController.text,
                                    uid: FirebaseAuth.instance.currentUser?.uid
                                        .toString(),
                                    email:
                                    FirebaseAuth.instance.currentUser?.email,
                                    phone: cubitAuth.phoneController.text,
                                    photo: user_profile_photo,
                                    jobDis: cubit.jobDescriptionController.text,
                                    jobTitle: cubit.jobTitleController.text);
                              }

                            },
                            text: "Summit"),
                        SizedBox(height: 30),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
