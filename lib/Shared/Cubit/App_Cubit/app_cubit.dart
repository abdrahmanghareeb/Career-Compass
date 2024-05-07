import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import '../../Constants/Constants.dart';
import '../local/CasheHelper.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
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
    CasheHelper.setFingerKeyBool(value : Auth_with_fingerprint ,key: AuthFinger);
    emit(SetFingerprintState());
  }

  void updateFingerPrint(value){
    FirebaseFirestore.instance.collection("users").doc(FirebaseAuth.instance.currentUser?.uid).update({"fingerprint" : value}).then((value) => emit(fingerprintState()));
  }

  static Future<String?> getCurrentCountry() async {
    try {
      Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);

      List<Placemark> placemarks = await placemarkFromCoordinates(position.latitude, position.longitude);

      return placemarks.first.country;
    } catch (e) {
      print(e);
      return 'Failed to get country';
    }
  }

}
