import 'package:career_compass/Layouts/HomeScreen.dart';
import 'package:career_compass/Layouts/RegisterScreen.dart';
import 'package:career_compass/Shared/Constants/color.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';

import '../Shared/Components/components.dart';
import '../Shared/Cubit/Auth_Cubit/auth_cubit.dart';

class LoginScreen extends StatelessWidget {
  var formKey = GlobalKey<FormState>();

  // to toggle eye icon
  bool show = true;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if(state is LoginSuccessState || state is GetUserSuccessState )
            if(state is LoginSuccessState || state is GetUserSuccessState ) {
              navigateReplacementTo(context: context, widget: HomeScreen());
            }

        },
        builder: (context, state) {
          var cubit = AuthCubit.get(context);
          return Form(
            key: formKey,
            child: Scaffold(
              body: Center(
                child: SingleChildScrollView(
                  child: Stack(
                    children: [
                      Image.asset("assets/background1.png",),
                      Padding(
                        padding: const EdgeInsets.all(30.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(height: 100),
                            Text("Welcome Back!",
                                style: Theme.of(context).textTheme.titleLarge),
                            const SizedBox(
                              height: 30,
                            ),
                            Image.asset("assets/login.png"),
                            defaultFormField(
                                TextInputType: TextInputType.emailAddress,
                                controller: cubit.emailController,
                                label: "Enter your email",
                                prefixIcon: Icons.email_outlined,
                                validator: "Email is required!!"),
                            SizedBox(
                              height: 20,
                            ),
                            defaultFormField(
                                controller: cubit.passwordController,
                                TextInputType: TextInputType.visiblePassword,
                                label: "Enter password",
                                onIconTap: () {
                                  show = !show;
                                  print(show);
                                  cubit.changeIconState();
                                },
                                obsecure: show ,
                                prefixIcon: Icons.password_sharp,
                                suffixIcon: show
                                    ? Icons.remove_red_eye
                                    : Icons.remove_red_eye_outlined,
                                validator: "password is required!!"),
                            SizedBox(
                              height: 30,
                            ),
                            appButton(
                                function: () {
                                  formKey.currentState?.validate();
                                  cubit.changeLoginState(
                                      email: cubit.emailController.text,
                                      password: cubit.passwordController.text,);

                                },
                                text: "Sign in"),
                            SizedBox(height: 20),
                            clickableText(
                              context: context ,mainText: "Don’t have an account ? ",secText: "Sign Up" , function: (){
                                navigateTo(context: context, widget: RegisterScreen());
                              }
                            ),
                            SizedBox(height: 20),
                            clickableText(
                              context: context , secText: "Forgot Password" , function: (){

                              }
                            ),
                          ],
                        ),
                      ),
                    ],
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