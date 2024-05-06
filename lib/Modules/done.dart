import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../Shared/Components/Task_Components.dart';
import '../Shared/Cubit/Task_Manager_Cubit/Task_Cubit.dart';
import '../Shared/Cubit/Task_Manager_Cubit/Task_Cubits.dart';

class done extends StatefulWidget {
  @override
  State<done> createState() => _doneState();
}

class _doneState extends State<done> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TaskCubit()..getTaskAll(),
      child: BlocConsumer<TaskCubit, TaskCubitStates>(
        listener: (context, state) {
          if(state is UpdateStatusSuccessState)
            TaskCubit.get(context).getTaskAll();
        },
        builder: (context, state) {
          var taskslist = TaskCubit
              .get(context)
              .doneTasksList;
          return taskCardBuilder(taskslist);
        },
      ),
    );
  }
}
