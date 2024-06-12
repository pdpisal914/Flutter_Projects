import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";
import "package:home_rent_app/view/home_screen.dart";

class StartScreen extends StatefulWidget {
  const StartScreen({super.key});

  @override
  State createState() {
    return _StartScreenState();
  }
}

class _StartScreenState extends State {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: double.infinity,
            height: 631,
            child: ClipRRect(
              child: Image.asset("assets/images/Rectangle 1.png",
                  fit: BoxFit.cover),
            ),
          ),
          const SizedBox(
            height: 22,
          ),
          Text(
            "Lets find your Paradise",
            style: GoogleFonts.poppins(
              fontSize: 22,
              color: const Color.fromRGBO(0, 0, 0, 1),
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          SizedBox(
            width: 232,
            child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: "Find your perfect dream space with just a few clicks",
                  style: GoogleFonts.poppins(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    color: const Color.fromRGBO(101, 101, 101, 1),
                  ),
                )),
          ),
          const SizedBox(
            height: 20,
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushReplacementNamed(context, "/home");
            },
            child: Container(
              width: 220,
              height: 55,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                color: const Color.fromRGBO(32, 169, 247, 1),
              ),
              child: Text(
                "Get Started",
                style: GoogleFonts.poppins(
                  fontSize: 22,
                  color: const Color.fromRGBO(255, 255, 255, 1),
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
