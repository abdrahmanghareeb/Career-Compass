import 'dart:ffi';

import 'package:bloc/bloc.dart';
import 'package:career_compass/Models/TaskModel.dart';
import 'package:career_compass/Shared/Components/components.dart';
import 'package:career_compass/Shared/Cubit/Task_Manager_Cubit/Task_Cubits.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../Modules/archive.dart';
import '../../../Modules/done.dart';
import '../../../Modules/tasks.dart';
import '../../Constants/Constants.dart';

class TaskCubit extends Cubit<TaskCubitStates> {
  TaskCubit() : super(appIntialState());

  static TaskCubit get(context) => BlocProvider.of(context);

  List<TaskModel> newTasksList = [];
  List<TaskModel> doneTasksList = [];
  List<TaskModel> archiveTasksList = [];

  var model;

  // list of modules
  List<Widget> modules = [tasks(), done(), archive()];

  // used for the validation of the TextFormFields in the bottom sheet/Tasks
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  //Text editing controllers to carry the values of the TextFormFields in the bottom sheet/Tasks
  TextEditingController nameController = TextEditingController();
  TextEditingController timeController = TextEditingController();
  TextEditingController dateController = TextEditingController();

  //create task

  // void createTask({required name , required time , required date }){
  //   var model = TaskModel(name: name, time: time, date: date, status: "new" , task_id:  "" );
  //   emit(CreateTaskLoadingState());
  //   FirebaseFirestore.instance.collection("tasks").doc().set(model.toMap()).then(( value) {
  //     // model.task_id = value.id;
  //     showToast(msg: "Task added");
  //     nameController.text =  "";
  //     timeController.text = "";
  //     emit(CreateTaskSuccessState());
  //     getTaskAll();
  //   }).onError((error, stackTrace) {
  //     print("error ${error.toString()}");
  //     showToast(msg: "FAILED");
  //     emit(CreateTaskErrorState());
  //   });
  // }
  void addTask({required name, required time, required date}) {
    var model = TaskModel(
        name: name, time: time, date: date, status: "new", task_id: "" , uid: FirebaseAuth.instance.currentUser?.uid);
    emit(CreateTaskLoadingState());
    FirebaseFirestore.instance
        .collection("tasks")
        .add(model.toMap())
        .then((DocumentReference value) {
      UpdateTaskID(id: value.id);
      showToast(msg: "Task added");
      nameController.text = "";
      timeController.text = "";
      emit(CreateTaskSuccessState());
      getTaskAll();
    }).onError((error, stackTrace) {
      print("error ${error.toString()}");
      showToast(msg: "FAILED");
      emit(CreateTaskErrorState());
    });
  }

  void getTaskAll() {
    emit(GetAllTasksLoadingState());
    FirebaseFirestore.instance.collection("tasks").get().then((value) {
      newTasksList = [];
      doneTasksList = [];
      archiveTasksList = [];
      value.docs.forEach((element) {
        model = TaskModel.fromJson(element.data());
        // model.task_id  =  ;
        if(  model.uid ==FirebaseAuth.instance.currentUser?.uid) {
          if (model.status == "new")
            newTasksList.add(model);
          else if (model.status == "done")
            doneTasksList.add(model);
          else if (model.status == "archive") archiveTasksList.add(model);
        }
      });
      emit(GetAllTasksSuccessState());
    }).onError((error, stackTrace) {
      print("error ${error.toString()}");
      showToast(msg: "Fetching Tasks FAILED");
      emit(GetAllTasksErrorState());
    });
  }

  void UpdateTaskID({required id}) {
    emit(UpdateIDLoadingState());
    //get the task id uppdated
    FirebaseFirestore.instance
        .collection("tasks")
        .doc(id)
        .update({"task_id": "$id"})
        .then((value) => emit(UpdateIDSuccessState()))
        .onError((error, stackTrace) => emit(UpdateIDErrorState()));
  }

  void UpdateTaskStatus({required id, required status}) {
    emit((UpdateStatusLoadingState()));
    //get the task id uppdated
    FirebaseFirestore.instance
        .collection("tasks")
        .doc(id)
        .update({"status": "$status"}).then((value) {
      emit(UpdateStatusSuccessState());
    });
  }

  void DeleteTask({required id , required context}) {
    emit(DeleteLoadingState());
    FirebaseFirestore.instance
        .collection("tasks")
        .doc("$id")
        .delete()
        .then((value) {
          emit(DeleteSuccessState());
    });
  }
}
