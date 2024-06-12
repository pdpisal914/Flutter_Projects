import "dart:ui";

import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:flutter/widgets.dart";
import "package:google_fonts/google_fonts.dart";

class PlayMusic extends StatefulWidget {
  const PlayMusic({super.key});

  @override
  State createState() => _PlayMusicState();
}

class _PlayMusicState extends State {
  bool isPlaying = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(19, 19, 19, 1),
      body: Column(
        children: [
          Container(
            height: 570,
            child: Stack(
              fit: StackFit.expand,
              children: [
                Image.asset(
                  "assets/images/playMusic.png",
                  fit: BoxFit.cover,
                ),
                Positioned.fill(
                  child: Container(
                    height: 555,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color.fromRGBO(19, 19, 19, 0.8),
                          Colors.transparent
                        ],
                        begin: Alignment.bottomCenter,
                        end: Alignment.center,
                        // end: Alignment(
                        //     0.0, 0.1), // Adjust to control the gradient spread
                        stops: [
                          0,
                          0.99
                        ], // Adjust to control the gradient intensity
                      ),
                    ),
                  ),
                ),
                Column(
                  children: [
                    const Spacer(),
                    Text(
                      "Alone in the Abyss",
                      style: GoogleFonts.inder(
                        color: const Color.fromRGBO(230, 154, 21, 1),
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(
                      height: 0,
                    ),
                    Text(
                      "Youlakou",
                      style: GoogleFonts.inder(
                        color: const Color.fromRGBO(255, 255, 255, 1),
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Icon(
                          Icons.ios_share_outlined,
                          size: 28,
                          weight: 400,
                          color: const Color.fromRGBO(230, 154, 21, 1),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ],
            ),
          ),
          Row(
            children: [
              const SizedBox(
                width: 15,
              ),
              Text(
                "Dynamic Warmup | ",
                style: GoogleFonts.inder(
                  color: const Color.fromRGBO(255, 255, 255, 1),
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const Spacer(),
              Text(
                "4 min",
                style: GoogleFonts.inder(
                  color: const Color.fromRGBO(255, 255, 255, 1),
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(
                width: 15,
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 15),
            child: SliderTheme(
              data: SliderTheme.of(context).copyWith(
                thumbShape:
                    SliderComponentShape.noThumb, // Make thumb invisible
                activeTrackColor: Colors.orange,
                inactiveTrackColor: const Color.fromRGBO(217, 217, 217, 0.19),
                overlayShape:
                    SliderComponentShape.noOverlay, // Remove overlay as well
              ),
              child: Slider(
                value: 0.3,
                autofocus: true,
                onChanged: (value) {},
              ),
            ),
          ),
          const SizedBox(
            height: 35,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () {},
                child: const Icon(
                  Icons.repeat_one_rounded,
                  size: 25,
                  weight: 200,
                  color: Colors.white,
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: const Icon(
                  Icons.skip_previous,
                  size: 30,
                  color: Colors.white,
                ),
              ),
              GestureDetector(
                onTap: () {
                  isPlaying = !isPlaying;
                  setState(() {});
                },
                child: CircleAvatar(
                  radius: 25,
                  backgroundColor: Colors.white,
                  child: Icon(
                    isPlaying ? Icons.pause : Icons.play_arrow,
                    color: Colors.black,
                    size: 40, // Icon color
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: const Icon(
                  Icons.skip_next,
                  size: 30,
                  color: Colors.white,
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: const Icon(
                  Icons.volume_up_rounded,
                  size: 25,
                  weight: 200,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
