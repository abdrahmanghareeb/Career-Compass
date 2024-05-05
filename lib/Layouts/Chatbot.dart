import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import '../Shared/Components/components.dart';
import '../Shared/Constants/color.dart';

class ChatBotScreen extends StatelessWidget {
  const ChatBotScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> messages = ['please i am a new student learning flutter how can you help me ?',
    'please i am a new student learning flutter how can you help me ?'];
    TextEditingController controller = TextEditingController();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Career Chat bot'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: messages.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Image.asset("assets/userPhoto.png",width: 50,height: 50,),
                  title: Container(
                    color: HexColor(main_color),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(messages[index]),
                    ),
                  ),
                );
              },
            ),
          ),
          Container(
            height: 50,
            color: HexColor(main_color),
            child: defaultFormField(
              controller: controller,
              label: 'How can Career compass help?',
              validator: '',

            ),
            /*child: TextFormField(
              decoration: const InputDecoration.collapsed(hintText: 'How can Career compass help?'),
              keyboardType: TextInputType.text,
              style: TextStyle(backgroundColor: Colors.white),
              controller: controller,
              onChanged: (value) => (value),
            ),

             */
          ),
          /*Container(
            height: 150,
            color: HexColor(main_color),
            child: Row(
              children: [
                TextFormField(
                  controller: controller,
                ),
                const Icon(Icons.navigate_next_sharp),
              ],
            ),
          ),

           */

          /*Row(
            children: [
              Image.asset("assets/userPhoto.png",width: 50,height: 50,),
              Container(
                color: Colors.grey[300],
                child: Text('please i am a new student learning flutter how can you help me ?',),
              ),
            ],
          ),
          SizedBox(height: 20,),
          Row(
            children: [
              Icon(Icons.dashboard_customize_outlined),
              Container(
                color: Colors.grey[300],
                child: Text('please i am a new student learning flutter how can you help me ?',),
              ),
            ],
          ),

           */
        ],
      ),
    );
  }
}
