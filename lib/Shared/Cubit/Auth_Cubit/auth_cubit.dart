import 'package:career_compass/Models/UserModel.dart';

import 'package:bloc/bloc.dart';
import 'package:career_compass/Shared/Components/components.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../Layouts/Home & Profile & Settings/HomeScreen.dart';
import '../../Constants/Constants.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  TextEditingController emailController = TextEditingController();
  TextEditingController fullNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  var user;

  var uid = FirebaseAuth.instance.currentUser?.uid;

  static AuthCubit get(context) => BlocProvider.of(context);

//================================    Sign out    ===============================================
  void changeRegisterState(
      {required email, required password, required fullName, required phone}) {
    emit(RegisterLoadingState());
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) {
      emit(RegisterSuccessState());
      Create_User(
          photo: user_profile_photo,
          phone: phone,
          email: email,
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

//================================      Login     ===============================================
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
      Get_User();
    }).onError((error, stackTrace) {
      showToast(msg: error.toString());
      emit(LoginErrorState());
    });
  }

//================================ get & create & update user ============================================

  void Create_User(
      {required name, required uid, required email, required phone, photo}) {
    emit(CreateUserLoadingState());
    var model = UserModel(
        uid: uid,
        email: AutofillHints.email,
        phone: phone,
        fullName: name,
        photo: photo);
    FirebaseFirestore.instance
        .collection("users")
        .doc(uid)
        .set(model.toMap())
        .then((value) {
      emit(CreateUserSuccessState());
    }).onError((error, stackTrace) {
      print("Error is :       ${error.toString()}");
      emit(CreateUserErrorState());
    });
  }

  void Update_User(
      {required uid, name, email, phone, photo, jobDis, jobTitle, required context}) {
    emit((UpdateUserLoadingState()));
    var model = UserModel(uid: uid, email: email, job_title: jobTitle, job_description: jobDis, phone: phone, fullName: name, photo: photo);
    FirebaseFirestore.instance
        .collection("users")
        .doc(uid)
        .update(model.toMap())
        .then((value) {
      emit(UpdateUserSuccessState());
      showToast(msg: "Summitted Successfully");
      navigateTo(context: context, widget: HomeScreen());
    }).onError((error, stackTrace) {
      print("Error is :       ${error.toString()}");
      emit(UpdateUserErrorState());
    });
  }



  void Get_User() {
    emit(GetUserLoadingState());
    FirebaseFirestore.instance.collection("users").doc(uid).get().then((value) {
      emit(GetUserSuccessState());
      user = UserModel.fromJson(value.data());
      Auth_with_fingerprint  = user.fingerprint;
    }).onError((error, stackTrace) {
      print(error.toString());
      emit(GetUserErrorState());
    });
  }

//=========================================== sign out ===============================================
  void changeSignOutState() {
    if (FirebaseAuth.instance.currentUser == null)
      emit(SignOutSuccessState());
    else
      emit(SignOutErrorState());
  }

//=========================================== password icon ==========================================

  void changeIconState() {
    emit(LoginIconState());
  }
}
