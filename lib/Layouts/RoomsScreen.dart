import 'package:career_compass/Shared/Constants/color.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class RoomsScreen extends StatefulWidget {
  RoomsScreen({Key? key}) : super(key: key);

  @override
  State<RoomsScreen> createState() => _RoomsScreenState();
}

class _RoomsScreenState extends State<RoomsScreen> {
  final TextEditingController _roomNameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _categoryController = TextEditingController();

  // Define your items here or load them from a database
  List<Map<String, String>> item = [
    {'image': 'assets/login.png', 'name': 'Data Analysis', 'des': 'Data Analysis is the process of \nsystematically applying statistical'},
    {'image': 'assets/login.png', 'name': 'Data Science', 'des': ''},
    {'image': 'assets/login.png', 'name': 'Mobile Application', 'des': ''},
    {'image': 'assets/login.png', 'name': 'Web Development', 'des': ''},
    {'image': 'assets/login.png', 'name': 'Embedded System', 'des': ''},
    {'image': 'assets/login.png', 'name': 'Machine Learning', 'des': ''},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rooms'),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showRegistrationDialog,
        backgroundColor: HexColor(main_color), // Example color, replace with your desired color
        child: const Icon(Icons.add, color: Colors.white,),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView.builder(
          itemCount: item.length,
          itemBuilder: (context, index) {
            return Row(
              children: [
                Image(image: AssetImage(item[index]['image']!), width: 100, height: 150,),
                SizedBox(width: 15,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(item[index]['name']!, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                    Text(item[index]['des']!, maxLines: 2, overflow: TextOverflow.ellipsis,),
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  void _showRegistrationDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Register Room"),
          content: SingleChildScrollView(
            child: Column(
              children: [
                TextField(
                  controller: _roomNameController,
                  decoration: InputDecoration(labelText: 'Room Name'),
                ),
                TextField(
                  controller: _descriptionController,
                  decoration: InputDecoration(labelText: 'Description'),
                ),
                TextField(
                  controller: _categoryController,
                  decoration: InputDecoration(labelText: 'Category'),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                // Handle registration logic here
                print("Room Name: ${_roomNameController.text}");
                print("Description: ${_descriptionController.text}");
                print("Category: ${_categoryController.text}");
                Navigator.of(context).pop();
              },
              child: Text("Register"),
            ),
          ],
        );
      },
    );
  }
}
