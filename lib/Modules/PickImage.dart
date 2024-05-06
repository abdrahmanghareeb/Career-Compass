import 'dart:io';

import 'package:career_compass/Shared/Cubit/App_Cubit/app_cubit.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../Shared/Constants/Constants.dart';

class PickImage extends StatefulWidget {
  const PickImage({super.key});

  @override
  State<PickImage> createState() => _PickImageState();
}

class _PickImageState extends State<PickImage> {
  Uint8List? _image ;
  String networkImage = user_profile_photo;
  // File? selectedIMage;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
          children: [
            _image != null
                ? CircleAvatar(
                radius: 70, backgroundImage: MemoryImage(_image!))
                :  CircleAvatar(
              radius: 70,
              backgroundImage: NetworkImage(
                  networkImage),
            ),
            Positioned(
                bottom: 0,
                right: 0,
                child: IconButton(
                    onPressed: () {
                      showImagePickerOption(context);
                    },
                    icon: const Icon(Icons.add_a_photo)))
          ],
        ),
    );
  }

  void showImagePickerOption(BuildContext context) {
    showModalBottomSheet(
        // backgroundColor: Colors.blue[100],
        context: context,
        builder: (builder) {
          return Padding(
            padding: const EdgeInsets.all(18.0),
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 4.5,
              child: Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        _pickImageFromGallery();
                      },
                      child: const SizedBox(
                        child: Column(
                          children: [
                            Icon(
                              Icons.image,
                              size: 70,
                            ),
                            Text("Gallery")
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        _pickImageFromCamera();
                      },
                      child: const SizedBox(
                        child: Column(
                          children: [
                            Icon(
                              Icons.camera_alt,
                              size: 70,
                            ),
                            Text("Camera")
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

//Gallery
  Future _pickImageFromGallery() async {
    final returnImage = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (returnImage == null) return;
    setState(() {
      // selectedIMage = File(returnImage.path);
      _image = File(returnImage.path).readAsBytesSync();
      AppCubit.profilePhotoPath = returnImage.path;
      AppCubit.profilePhotoFile = File(returnImage.path);
      print("profile photo path ${AppCubit.profilePhotoPath}");
    });
    Navigator.of(context).pop(); //close the model sheet
  }

//Camera
  Future _pickImageFromCamera() async {
    final returnImage =
    await ImagePicker().pickImage(source: ImageSource.camera);
    if (returnImage == null) return;
    setState(() {
      // selectedIMage = File(returnImage.path);
      _image = File(returnImage.path).readAsBytesSync();
      AppCubit.profilePhotoPath = returnImage.path;
      AppCubit.profilePhotoFile = File(returnImage.path);
      print("profile photo path ${AppCubit.profilePhotoPath}");
    });
    Navigator.of(context).pop();
  }
}