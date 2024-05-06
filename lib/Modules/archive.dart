import 'package:career_compass/Shared/Cubit/Task_Manager_Cubit/Task_Cubit.dart';
import 'package:career_compass/Shared/Cubit/Task_Manager_Cubit/Task_Cubits.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../Shared/Components/Task_Components.dart';


class archive extends StatefulWidget{
  @override
  State<archive> createState() => _archiveState();
}

class _archiveState extends State<archive> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TaskCubit, TaskCubitStates>(
      listener: (context, state) {

      },
      builder: (context, state) {
        var taskslist = TaskCubit.get(context).archiveTasksList;
        return taskCardBuilder(taskslist);
      },
    );

  }
}
