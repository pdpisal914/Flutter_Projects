import "package:flutter/material.dart";

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State createState() => _CartScreenState();
}

class _CartScreenState extends State {
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
