//=====================================Task Components==================================================

import 'package:career_compass/Shared/Constants/color.dart';
import 'package:career_compass/Shared/Cubit/Task_Manager_Cubit/Task_Cubit.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../Models/TaskModel.dart';

Widget taskFormField(
    {required TextEditingController controller,
      TextInputType = TextInputType.text,
      required String label,
      required Icon icon,
      required FormFieldValidator validator,
      required GestureTapCallback ontap}) {
  return TextFormField(
    validator: validator,
    controller: controller,
    keyboardType: TextInputType,
    onTap: ontap,
    decoration: InputDecoration(
      prefixIcon: icon,
      labelText: label,
    ),
  );
}

Widget taskCard({ required TaskModel tasksItem , required context}){
  bool isDone =false;
  bool isArchive =false;
  if(tasksItem.status == "done"){
    isDone = true;
  }
  if(tasksItem.status == "archive"){
    isArchive = true;
  }
  return  Container(
    color: Colors.grey[50],
    child: Padding(
      padding:  EdgeInsets.all(8.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(backgroundColor: HexColor(main_color), radius: 40,child:
          Text("${tasksItem.time}" , style:TextStyle(color: Colors.white),),),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("${tasksItem.name}" ,style: TextStyle(fontSize: 18,fontWeight: FontWeight.w700),),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Text("Due to " , style: TextStyle(fontWeight: FontWeight.w500)),
                      Text("${tasksItem.date}"),
                    ],
                  ),
                ],
              ),
            ),
          ),
          IconButton(onPressed: (){
            if(isDone == false){
              isDone = !isDone;
              print(isDone);
              TaskCubit.get(context).UpdateTaskStatus(id:tasksItem.task_id ,status:  "done" );
            }else{
              isDone = !isDone;
              print(isDone);
              if(isArchive == false) {
                TaskCubit.get(context).UpdateTaskStatus(id:tasksItem.task_id ,status:  "new" );
              }
            }
          },
              icon: isDone ? Icon(Icons.check_box) : Icon(Icons.check_box_outline_blank) ),
          IconButton(onPressed: (){
            if(isArchive == false){
              isArchive = !isArchive;
              print(isArchive);
              TaskCubit.get(context).UpdateTaskStatus(id:tasksItem.task_id ,status:  "archive" );
            }else{
              isArchive = !isArchive;
              print(isArchive);
              if(isDone == false) {
                TaskCubit.get(context).UpdateTaskStatus(id:tasksItem.task_id ,status:  "new" );
              }
            }
          },
              icon: isArchive ? Icon(Icons.archive) : Icon(Icons.archive_outlined) ),
        ],
      ),
    ),
  );
}

void showTheBottomSheet(
    {required BuildContext context, required WidgetBuilder builder}) {
  showModalBottomSheet(context: context, builder: builder);
}

Widget taskCardBuilder(taskslist){
  return ConditionalBuilder(
    condition: taskslist.isNotEmpty,
    builder: (BuildContext context) =>Container(
      color: Colors.grey[100],
      child: ListView.separated(
          itemBuilder: (context, index) =>  taskCard(tasksItem: taskslist[index] , context: context),
          separatorBuilder: (context, index) => Container(
            color: Colors.grey,
            width: double.infinity,
            height: 1,
          ),
          itemCount: taskslist.length),
    ),
    fallback: (BuildContext context) {
      return const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.menu , size: 100,),
            SizedBox(height: 10,),
            Text("no tasks added, add a new tasks" ,style: TextStyle(fontSize: 15 , color: Colors.black54),),
            Text("OR your may be having a bad connection" ,style: TextStyle(fontSize: 15 , color: Colors.black54),)
          ],
        ),
      );
    },
  );
}