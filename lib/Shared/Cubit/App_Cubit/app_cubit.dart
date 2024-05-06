import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:career_compass/Shared/Cubit/Auth_Cubit/auth_cubit.dart';
import 'package:firebase_storage/firebase_storage.dart';

// import 'package:firebase_storage/firebase_storage.dart' as fire_storage;
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';

import '../../Constants/Constants.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppInitial());


  static AppCubit get(context) => BlocProvider.of(context);
  List<String> most_searched = [
    "Data Analysis",
    "Data Science",
    "Mobile Application",
    "Web Development",
    "Embedded Systems",
    "Machine Learning"
  ];

  List<String> ListCountry = ['Egypt', 'Armenia', 'India', 'China'];
  List<String> listLanguage = ['English', 'Japanese', 'French', 'German'];

  void changeSetDropDownState() {
    emit(SetDropDownState());
  }


//=========================== controllers====================================

  TextEditingController jobDescriptionController = TextEditingController();
  TextEditingController jobTitleController = TextEditingController();
  TextEditingController feedbackController = TextEditingController();

//=========================== controllers====================================
  static var profilePhotoPath;
  static var profilePhotoFile;

  void ChangeLocalPhotoSuccessState() {
    emit(GetLocalPhotoLoadingState());
    if(profilePhotoFile != null) {
      FirebaseStorage.instanceFor(bucket: "gs://carrer-compas.appspot.com")
          .ref("${Uri.file("$profilePhotoPath").pathSegments.last}")
          .putFile(profilePhotoFile)
          .then((p0) {
        p0.ref.getDownloadURL().then((value) {
          user_profile_photo = value;
        });
        emit(GetLocalPhotoSuccessState());
      }).onError((error, stackTrace) {
        print("error : ${error.toString()}");
        emit(GetLocalPhotoErrorState());
      });
    }
    else{
      emit(GetLocalPhotoErrorState());
    }
  }

  void ChangeSetFingerprintState(){
    emit(SetFingerprintState());
  }

}
