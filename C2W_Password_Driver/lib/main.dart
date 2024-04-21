import 'package:flutter/material.dart';
//import 'todoapp.dart';
//import 'databaseConnections.dart';
import 'loginPage.dart';
//import 'registrationPage.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      //home: ToDoApp2(),
      home: LoginPage(),
      //home: RegistrationPage(),
    );
  }
}
