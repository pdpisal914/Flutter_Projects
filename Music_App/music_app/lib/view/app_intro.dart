import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";
import "dart:ui";

class AppIntroScreen extends StatefulWidget {
  const AppIntroScreen({super.key});

  @override
  State createState() => _AppIntroScreen();
}

class _AppIntroScreen extends State {
  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final double screenHeight = screenSize.height;
    final double screenWidth = screenSize.width;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                height: 648,
                padding: const EdgeInsets.only(left: 30, right: 20),
                child: Image.asset(
                  "assets/images/intro.png",
                  fit: BoxFit.cover,
                ),
              ),
              //const Spacer(),
              Container(
                height: 1,
                width: 1,
                decoration: const BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 20, spreadRadius: 90, color: Colors.black),
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 40,
              right: 40,
              top: 450,
            ),
            child: Column(
              children: [
                Container(
                  child: Text(
                    "Dancing between The shadows         Of rhythm ",
                    style: GoogleFonts.inter(
                      fontSize: 36,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                    softWrap: true,
                    overflow: TextOverflow.visible,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushReplacementNamed(
                      context,
                      "/navigationBar",
                    );
                  },
                  child: Container(
                    height: 47,
                    width: 261,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(19),
                      color: const Color.fromRGBO(255, 46, 0, 1),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      "Get Started",
                      style: GoogleFonts.inder(
                        color: const Color.fromRGBO(19, 19, 19, 1),
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  child: Container(
                    height: 47,
                    width: 261,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: const Color.fromRGBO(255, 46, 0, 1),
                      ),
                      borderRadius: BorderRadius.circular(19),
                      color: Colors.black12,
                      //color: const Color.fromRGBO(255, 46, 0, 1),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      "Continue with Email",
                      style: GoogleFonts.inder(
                        color: const Color.fromRGBO(255, 46, 0, 1),
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: 255,
                  child: Text(
                    "by continuing you agree to terms        of services and  Privacy policy",
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: const Color.fromRGBO(203, 200, 200, 1),
                    ),
                    textAlign: TextAlign.center,
                    softWrap: true,
                    overflow: TextOverflow.visible,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
