import "package:flutter/material.dart";
import "package:home_rent_app/view/start_screen.dart";
import "package:home_rent_app/view/home_screen.dart";
import "package:home_rent_app/view/home_detail_screen.dart";

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        "/home": (context) {
          return const HomeScreen();
        },
        "/detail": (context) {
          return const DetailScreen();
        },
      },
      debugShowCheckedModeBanner: false,
      home: const StartScreen(),
    );
  }
}
