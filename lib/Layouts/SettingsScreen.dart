import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';

import '../Shared/Components/components.dart';
import '../Shared/Constants/color.dart';
import '../Shared/Cubit/app_cubit.dart';

class SettingsScreen extends StatelessWidget{

  var language_init = "English";
  var country_init= "Egypt";

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => AppCubit(),
        child: BlocConsumer<AppCubit,AppState>(
          listener: (context,state){},
          builder: (context,state){
            var cubit = AppCubit.get(context);
            return Scaffold(
              appBar: AppBarComponent(title: 'Settings',isSearch: false),
              body: Padding(
                padding: const EdgeInsets.all(10.0),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Country",
                          style: Theme.of(context).textTheme.titleLarge),
                      const SizedBox(height: 15,),
                      Center(
                        child: Container(
                          color: HexColor(Grey_color),
                          child: DropdownButton(
                            padding: const EdgeInsets.only(right: 10,left: 10),
                            isExpanded: true,
                            value: language_init,
                            icon: const Icon(Icons.arrow_downward),
                            elevation: 16,
                            items: cubit.listLanguage.map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                            onChanged: (String? value) {
                              cubit.changeSetDropDownState();
                              language_init =  value!;
                              print(value);
                            },
                          ),
                        ),
                      ),
                      const SizedBox(height: 15,),
                      Text("Language",
                          style: Theme.of(context).textTheme.titleLarge),
                      const SizedBox(height: 15,),
                      Center(
                        child: Container(
                          color: HexColor(Grey_color),
                          child: DropdownButton(
                            padding: const EdgeInsets.only(right: 10,left: 10),
                            isExpanded: true,
                            value: country_init,
                            icon: const Icon(Icons.arrow_downward),
                            elevation: 16,
                            items: cubit.ListCountry.map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                            onChanged: (String? value) {
                              cubit.changeSetDropDownState();
                              country_init = value!;
                              print("$value");
                  
                            },
                          ),
                        ),
                      ),
                      const SizedBox(height: 15,),
                      Text("Feed Back",
                          style: Theme.of(context).textTheme.titleLarge
                      ),
                      const SizedBox(height: 15,),
                      defaultFormField(
                        height: 230.0,
                          color: Grey_color,
                          controller: cubit.feedBackController,
                          label: "Your feed back helps use improve our 100% free service."),
                      const SizedBox(height: 30),
                      appButton(function: (){ }, text: "Summit"),
                    ],
                  ),
                ),
              ),
            );
          },
        )
    );
  }
}
