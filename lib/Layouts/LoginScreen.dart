import 'package:career_compass/Layouts/RegisterScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';

import '../Shared/Components/components.dart';
import '../Shared/Cubit/app_cubit.dart';

class LoginScreen extends StatelessWidget {
  var formKey = GlobalKey<FormState>();

  // to toggle eye icon
  bool show = true;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit(),
      child: BlocConsumer<AppCubit, AppState>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = AppCubit.get(context);
          return Form(
            key: formKey,
            child: Scaffold(
              body: Stack(
                children: [
                  Image.asset("assets/background1.png"),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(height: 20),
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
                                prefixIcon: Icons.password_sharp,
                                suffixIcon: show
                                    ? Icons.remove_red_eye
                                    : Icons.remove_red_eye_outlined,
                                validator: "password is required!!"),
                            SizedBox(
                              height: 30,
                            ),
                            TheAppButton(
                                function: () {
                                  formKey.currentState?.validate();
                                  print(
                                      "Email : ${cubit.emailController.text.toString()}");
                                  print(
                                      "password : ${cubit.passwordController.text.toString()}");
                                  cubit.changeLoginState();
                                },
                                text: "Sign in"),
                            SizedBox(height: 20),
                            ClickableText(
                              context: context ,mainText: "Don’t have an account ? ",secText: "Sign Up" , function: (){
                                navigateTo(context: context, widget: RegisterScreen());
                              }
                            ),
                            SizedBox(height: 20),
                            ClickableText(
                              context: context , secText: "Forgot Password" , function: (){

                              }
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}