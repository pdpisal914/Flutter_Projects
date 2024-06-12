import "package:flutter/material.dart";
import "view/app_intro.dart";
import "view/app_gallery2.dart";
import "package:music_app/view/bottom_navigation_bar.dart";


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        "/gallery": (context) {
          return const AppGalleryScreen();
        },
         "/navigationBar": (context) {
          return const BottomNavigationApp();
        },
      },
      debugShowCheckedModeBanner: false,
      home: AppIntroScreen(),
      // home: AppGalleryScreen(),
      //home:const BottomNavigationApp(),

    );
  }
}
