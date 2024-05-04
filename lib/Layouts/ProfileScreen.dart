import 'package:career_compass/Shared/Constants/color.dart';
import 'package:career_compass/Shared/Cubit/app_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../Shared/Components/components.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit(),
      child: BlocConsumer<AppCubit, AppState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          var cubit = AppCubit.get(context);
          return Scaffold(
            body: SingleChildScrollView(
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset("assets/eclipse.png"),
                      Text("User Photo",
                          style: Theme.of(context).textTheme.titleLarge),
                      Center(
                        child: Image.asset("assets/userPhoto.png",
                            height: 100, width: 100),
                      ),
                      Text("User Name",
                          style: Theme.of(context).textTheme.titleLarge),
                      Center(
                        child: defaultFormField(
                          color: Grey_color,
                            controller: cubit.fullNameController,
                            label: "Enter your full name"),

                      ),
                      Text("Job Title",
                          style: Theme.of(context).textTheme.titleLarge),
                      Center(
                        child: defaultFormField(
                            color: Grey_color,
                            controller: cubit.jobTitleController,
                            label: "Enter your job title"),
                      ),
                      Text("Job Description",
                          style: Theme.of(context).textTheme.titleLarge),
                      Center(
                        child: defaultFormField(
                            color: Grey_color,
                            controller: cubit.jobDescriptionController,
                            label: "Enter your job description"),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
