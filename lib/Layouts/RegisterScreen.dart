import 'package:career_compass/Layouts/LoginScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';


import '../Shared/Components/components.dart';
import '../Shared/Cubit/Auth_Cubit/auth_cubit.dart';

class RegisterScreen extends StatelessWidget {

  // final ref = FirebaseDatabase.instance.ref("items");

  var formKey = GlobalKey<FormState>();

  // to toggle eye icon
  bool show = true;
  bool confirmShow = true;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is RegisterErrorState) {
            Fluttertoast.showToast(
                msg: "Error registering your account",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.CENTER,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.red,
                textColor: Colors.white,
                fontSize: 16.0);
          }
        },
        builder: (context, state) {
          var cubit = AuthCubit.get(context);
          return Form(
            key: formKey,
            child: Scaffold(
              body: SingleChildScrollView(
                child: Stack(
                  children: [
                    Image.asset("assets/background1.png", width: double.infinity,),
                    Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(height: 120),
                          Text("Welcome buddy!",
                              style: Theme.of(context).textTheme.titleLarge),
                          const SizedBox(
                            height: 30,
                          ),
                          defaultFormField(
                              TextInputType: TextInputType.text,
                              controller: cubit.fullNameController,
                              label: "Enter Your Full Name",
                              prefixIcon: Icons.person,
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
                              TextInputType: TextInputType.phone,
                              controller: cubit.phoneController,
                              label: "Phone Number ",
                              prefixIcon: Icons.phone,
                              validator: "Phone Number is required!!"),
                          SizedBox(
                            height: 20,
                          ),
                          defaultFormField(
                              controller: cubit.passwordController,
                              obsecure: show ,
                              TextInputType: TextInputType.visiblePassword,
                              label: "Enter password",
                              onIconTap: () {
                                show = !show;
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
                          appButton(
                              function: () {
                                formKey.currentState?.validate();
                                cubit.changeRegisterState(
                                    email: cubit.emailController.text,
                                    password: cubit.passwordController.text,
                                    fullName: cubit.fullNameController.text,
                                phone: cubit.phoneController.text);
                                navigateTo(context: context, widget: LoginScreen());
                              },
                              text: "Sign up"),
                          SizedBox(height: 20),
                          clickableText(
                              context: context,
                              mainText: "Already have an account ? ",
                              secText: "Sign in",
                              function: () {
                                navigateTo(
                                    context: context, widget: LoginScreen());
                              }),
                        ],
                      ),
                    ),
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
