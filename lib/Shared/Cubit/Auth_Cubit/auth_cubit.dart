import 'package:career_compass/Models/UserModel.dart';

import 'package:bloc/bloc.dart';
import 'package:career_compass/Shared/Components/components.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  TextEditingController emailController = TextEditingController();
  TextEditingController fullNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController jobDescriptionController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController jobTitleController = TextEditingController();
  TextEditingController feedbackController = TextEditingController();
  TextEditingController feedBackController = TextEditingController();

  List<String> ListCountry = ['Egypt', 'Armenia', 'India', 'China'];
  List<String> listLanguage = ['English', 'Japanese', 'French', 'German'];

  var user;

  var uid = FirebaseAuth.instance.currentUser?.uid;

  static AuthCubit get(context) => BlocProvider.of(context);

  void changeRegisterState(
      {required email, required password, required fullName, required phone}) {
    emit(RegisterLoadingState());
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) {
      print(value.user?.email);
      print(value.user?.phoneNumber);
      print(value.user?.uid);
      emit(RegisterSuccessState());
      ChangeCreateUserState(
          phone: phone,
          email: value.user?.email,
          name: fullName,
          uid: value.user?.uid);
      fullNameController.text = "";
      emailController.text = "";
      phoneController.text = "";
      passwordController.text = "";
      showToast(msg: "Registering done successfully");
    }).onError((error, stackTrace) {
      showToast(msg: error.toString());
      emit(RegisterErrorState());
    });
  }

  void changeLoginState({required email, required password, fullName = ""}) {
    emit(LoginLoadingtate());
    FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value) {
      print(value.user?.email);
      print(value.user?.phoneNumber);
      print(value.user?.uid);
      emit(LoginSuccessState());
      emailController.text = "";
      passwordController.text = "";
      getUserState();
    }).onError((error, stackTrace) {
      showToast(msg: error.toString());
      emit(LoginErrorState());
    });
  }

  void ChangeCreateUserState(
      {required name, required uid, required email, required phone}) {
    emit(createUserLoadingState());
    var model = userModel(uid: uid, email: AutofillHints.email, phone: phone, fullName: name);
    FirebaseFirestore.instance
        .collection("users")
        .doc(uid)
        .set(model.toMap())
        .then((value) {
      emit(createUserSuccessState());
    }).onError((error, stackTrace) {
      print("Error is :       ${error.toString()}");
      emit(createUserErrorState());
    });
  }

  void getUserState() {
    emit(GetUserLoadingState());
    FirebaseFirestore.instance.collection("users").doc(uid).get().then((value) {
      value.data();
      print("value.data() :  ${value.data()}");
      emit(GetUserSuccessState());
      user = userModel.fromJson(value.data());
      print("user :  ${user}");
    }).onError((error, stackTrace) {
      print(error.toString());
      emit(GetUserErrorState());
    });
  }

  void changeSignOutState() {
    if (FirebaseAuth.instance.currentUser == null)
      emit(SignOutSuccessState());
    else
      emit(SignOutErrorState());
  }

  void changeIconState() {
    emit(LoginIconState());
  }

  void changeSetDropDownState() {
    emit(SetDropDownState());
  }


}
