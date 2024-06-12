import "package:flutter/material.dart";

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State createState() => _SearchScreenState();
}

class _SearchScreenState extends State {
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
