import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';

import '../Auth_Cubit/auth_cubit.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppInitial());

  List<String> most_searched = [
    "Data Analysis",
    "Data Science",
    "Mobile Application",
    "Web Development",
    "Embedded Systems",
    "Machine Learning"
  ];

  File? userImage ;

  final ImagePicker image = ImagePicker();


}
