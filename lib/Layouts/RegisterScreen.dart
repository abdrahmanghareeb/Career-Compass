import 'package:career_compass/Layouts/LoginScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../Shared/Components/components.dart';
import '../Shared/Cubit/app_cubit.dart';

class RegisterScreen extends StatelessWidget {
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
                            Text("Welcome buddy!",
                                style: Theme.of(context).textTheme.titleLarge),
                            const SizedBox(
                              height: 30,
                            ),
                            defaultFormField(
                                TextInputType: TextInputType.text,
                                controller: cubit.emailController,
                                label: "Enter Your Full Name",
                                prefixIcon: Icons.email_outlined,
                                validator: "Full Name is required!!"),
                            SizedBox(
                              height: 20,
                            ),
                            defaultFormField(
                                TextInputType: TextInputType.emailAddress,
                                controller: cubit.emailController,
                                label: "Enter Your Email",
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
                            defaultFormField(
                                controller: cubit.passwordController,
                                TextInputType: TextInputType.visiblePassword,
                                label: "confirm password",
                                onIconTap: () {
                                  show = !show;
                                  print(show);
                                  cubit.changeIconState();
                                },
                                prefixIcon: Icons.password_sharp,
                                suffixIcon: show
                                    ? Icons.remove_red_eye
                                    : Icons.remove_red_eye_outlined,
                                validator: "confirm password is required!!"),
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
                                text: "Sign up"),
                            SizedBox(height: 20),
                            ClickableText(
                                context: context ,mainText: "Already have an account ? ",secText: "Sign in" , function: (){
                              navigateTo(context: context, widget: LoginScreen());
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
