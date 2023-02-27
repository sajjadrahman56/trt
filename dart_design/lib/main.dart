import 'package:dart_design/user-form/jela.dart';
import 'package:dart_design/user-form/name_field.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'design/shelter.dart';
import 'design/volunter.dart';
import 'package:get/get.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // ignore: prefer_const_constructors
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "firebase flutter",
      // ignore: prefer_const_constructors
      home: SchoolWithData(),
    );
  }
}
