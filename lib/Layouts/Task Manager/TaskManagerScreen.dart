import 'package:career_compass/Shared/Components/components.dart';
import 'package:career_compass/Shared/Constants/color.dart';
import 'package:career_compass/Shared/Cubit/Task_Manager_Cubit/Task_Cubit.dart';
import 'package:career_compass/Shared/Cubit/Task_Manager_Cubit/Task_Cubits.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';

class TaskManagerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TaskCubit(),
      child: BlocConsumer<TaskCubit, TaskCubitStates>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          var cubit = TaskCubit.get(context);
          return DefaultTabController(
            length: 3,
            child: Scaffold(
              appBar: AppBar(
                bottom:  TabBar(
                  labelColor: Colors.white,
                  // unselectedLabelColor: Colors.white70,
                  indicatorColor: HexColor(main_color),
                  tabs: [
                    Tab(icon: Icon(Icons.menu , color: Colors.black26,), text: "Tasks"),
                    Tab(icon: Icon(Icons.done, color: Colors.black26,), text: "Done"),
                    Tab(icon: Icon(Icons.archive_outlined , color: Colors.black26,), text: "Archive"),
                  ],
                ),
                title: Center(child: TextAppBar(text: "Task Manager")),
              ),
              body: TabBarView(children: [
                cubit.modules[0],
                cubit.modules[1],
                cubit.modules[2],
              ]),
            ),
          );
        },
      ),
    );
  }
}
