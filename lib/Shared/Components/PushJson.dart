import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart'; // For accessing JSON file
//
// Future<void> pushDataToFirestore() async {
//   // Read JSON file
//   String jsonString = await rootBundle.loadString('assets/data.json');
//   // Parse JSON string
//   List<Map<String, dynamic>> jsonData = jsonDecode(jsonString).cast<Map<String, dynamic>>();
//
//   // Loop through data and push to Firestore
//   for (var data in jsonData) {
//     try {
//       await FirebaseFirestore.instance.collection('data').add(data);
//       print('Data pushed to Firestore: $data');
//     } catch (e) {
//       print('Error pushing data to Firestore: $e');
//     }
//   }
// }
