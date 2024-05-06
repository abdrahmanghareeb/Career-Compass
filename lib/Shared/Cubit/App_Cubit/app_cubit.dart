import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';


part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppInitial());


  TextEditingController jobDescriptionController = TextEditingController();
  TextEditingController jobTitleController = TextEditingController();
  TextEditingController feedbackController = TextEditingController();

  List<String> most_searched = [
    "Data Analysis",
    "Data Science",
    "Mobile Application",
    "Web Development",
    "Embedded Systems",
    "Machine Learning"
  ];
  static AppCubit get(context) => BlocProvider.of(context);

  List<String> ListCountry = ['Egypt', 'Armenia', 'India', 'China'];
  List<String> listLanguage = ['English', 'Japanese', 'French', 'German'];


  File? userImage ;

  final ImagePicker image = ImagePicker();
  void changeSetDropDownState() {
    emit(SetDropDownState());
  }



}
