import "package:flutter/material.dart";

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.blue,
      ),
    );
  }
}
