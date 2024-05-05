import 'package:career_compass/Models/UserModel.dart';

import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppInitial());

  TextEditingController emailController = TextEditingController();
  TextEditingController fullNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController jobDescriptionController = TextEditingController();
  TextEditingController jobTitleController = TextEditingController();
  TextEditingController feedbackController = TextEditingController();


  static AppCubit get(context) => BlocProvider.of(context);

  void changeRegisterState({required email , required password , required fullName}){
    emit(LoginLoadingtate());
    FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password)
        .then((value) {
          print(value.user?.email);
          print(value.user?.phoneNumber);
          print(value.user?.uid);

          emit(LoginSuccessState());
    }).onError((error, stackTrace) {
      emit(LoginErrorState());
    });
  }
  void changeLoginState({required email , required password , fullName = ""}){
    emit(LoginLoadingtate());
    FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password)
        .then((value) {
          print(value.user?.email);
          print(value.user?.phoneNumber);
          print(value.user?.uid);

          emit(LoginSuccessState());
    }).onError((error, stackTrace) {
      emit(LoginErrorState());
    });
  }


  void changeIconState(){
    emit(LoginIconState());
  }

}
