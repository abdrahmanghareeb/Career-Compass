import 'package:career_compass/Shared/Components/components.dart';
import 'package:career_compass/Shared/Constants/color.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';
import '../Shared/Components/Task_Components.dart';
import '../Shared/Cubit/Task_Manager_Cubit/Task_Cubit.dart';
import '../Shared/Cubit/Task_Manager_Cubit/Task_Cubits.dart';

class tasks extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
  create: (context) => TaskCubit()..getTaskAll(),
  child: BlocConsumer<TaskCubit, TaskCubitStates>(
      listener: (context, state) {
        if(state is UpdateStatusSuccessState || state is DeleteSuccessState)
          TaskCubit.get(context).getTaskAll();

      },
      builder: (context, state) {
        var cubit = TaskCubit.get(context);
        var taskslist = TaskCubit.get(context).newTasksList;
        return Scaffold(
            body: taskCardBuilder(taskslist) ,
            floatingActionButton: FloatingActionButton(
                onPressed: () {
                  showTheBottomSheet(
                      context: context,
                      builder: (context) => SingleChildScrollView(
                            reverse: true,
                            scrollDirection: Axis.vertical,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                width: double.infinity,
                                // height: 900,
                                child: Form(
                                  key: cubit.formKey,
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      taskFormField(
                                          controller: cubit.nameController,
                                          label: 'What is your task?',
                                          icon: Icon(Icons.task_outlined),
                                          ontap: () {},
                                          validator: (value) {
                                            if (value.toString().isEmpty) {
                                              return "required!!";
                                            }
                                          }),
                                      taskFormField(
                                          controller: cubit.timeController,
                                          label: 'Enter Time',
                                          icon: Icon(Icons.timer_outlined),
                                          validator: (value) {
                                            if (value.toString().isEmpty) {
                                              return "required!!";
                                            }
                                          },
                                          ontap: () {
                                            showTimePicker(
                                                    context: context,
                                                    initialTime:
                                                        TimeOfDay.now())
                                                .then((value) {
                                              cubit.timeController.text = value!
                                                  .format(context)
                                                  .toString();
                                              print(cubit.timeController.text);
                                            });
                                          },
                                          TextInputType: TextInputType.none),
                                      taskFormField(
                                          controller: cubit.dateController,
                                          validator: (value) {
                                            if (value.toString().isEmpty) {
                                              return "required!!";
                                            }
                                          },
                                          ontap: () {
                                            showDatePicker(
                                                    context: context,
                                                    initialDate: DateTime.now(),
                                                    firstDate: DateTime.now(),
                                                    lastDate: DateTime.parse(
                                                        "2030-01-01"))
                                                .then((value) {
                                              if (value != null) {
                                                cubit.dateController.text =
                                                    DateFormat('yyyy-MM-dd')
                                                        .format(value);
                                                print(
                                                    cubit.dateController.text);
                                              }
                                            });
                                          },
                                          label: 'Enter due date',
                                          TextInputType: TextInputType.none,
                                          icon: Icon(
                                              Icons.calendar_month_outlined)),
                                      Padding(
                                        padding: const EdgeInsets.all(25.0),
                                        child: Container(
                                          color: HexColor(main_color),
                                            child: TextButton(
                                                onPressed: () {
                                                  if (cubit
                                                      .formKey.currentState!
                                                      .validate()) {
                                                    cubit.addTask(name: cubit.nameController.text, time: cubit.timeController.text,
                                                        date: cubit.dateController.text);
                                                    Navigator.pop(context);
                                                  }
                                                },
                                                child: Text(
                                                  "summit task",
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ))),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ));
                },
                child: Icon(
                  Icons.add,
                  color: Colors.white,
                ))
        );
      },
    ),
);
  }
}
