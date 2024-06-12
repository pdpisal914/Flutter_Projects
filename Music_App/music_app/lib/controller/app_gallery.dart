import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:carousel_slider/carousel_slider.dart";
import "package:flutter/rendering.dart";
import "package:flutter/widgets.dart";
import "package:google_fonts/google_fonts.dart";
import "package:smooth_page_indicator/smooth_page_indicator.dart";

class AppGalleryScreen extends StatefulWidget {
  const AppGalleryScreen({super.key});

  @override
  State createState() => _AppGalleryScreen();
}

class _AppGalleryScreen extends State {
  final listOfSliderImages = [
    "assets/images/slider.png",
    "assets/images/slider.png",
    "assets/images/slider.png",
    "assets/images/slider.png",
    "assets/images/slider.png",
  ];
  final listOfSliderImgText1 = [
    "A.L.O.N.E",
    "A.L.O.N.E",
    "A.L.O.N.E",
    "A.L.O.N.E",
    "A.L.O.N.E"
  ];

  final listOfDiscographyImg = [
    {
      "img": "assets/images/Rectangle1.png",
      "title": "Dead Inside",
      "year": "2023"
    },
    {"img": "assets/images/Rectangle2.png", "title": "Alone", "year": "2023"},
    {
      "img": "assets/images/Rectangle3.png",
      "title": "Heartless",
      "year": "2023"
    },
    {
      "img": "assets/images/Rectangle1.png",
      "title": "Dead Inside",
      "year": "2023"
    },
    {"img": "assets/images/Rectangle2.png", "title": "Alone", "year": "2023"},
    {
      "img": "assets/images/Rectangle3.png",
      "title": "Heartless",
      "year": "2023"
    }
  ];
  Widget getSubscribeButton() {
    return GestureDetector(
      child: Container(
        height: 37,
        width: 127,
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          color: Color.fromRGBO(255, 46, 0, 1),
          borderRadius: BorderRadius.all(
            Radius.circular(19),
          ),
        ),
        child: const Text("Subscribe",
            // style: GoogleFonts.inter(
            //   fontSize: 16,
            //   fontWeight: FontWeight.w600,
            //   color: const Color.fromRGBO(19, 19, 19, 0),
            // )
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Colors.black)),
      ),
    );
  }

  //Image Indicator Creating
  Widget getDottedIndicator() {
    return AnimatedSmoothIndicator(
      activeIndex: activeIndex,
      count: listOfSliderImages.length,
      effect: const ExpandingDotsEffect(
          activeDotColor: Color.fromRGBO(255, 46, 0, 1),
          dotColor: Colors.white,
          dotHeight: 8,
          dotWidth: 8),
    );
  }

  int activeIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(24, 24, 24, 1),
      body: ListView(
        children: [
          CarouselSlider.builder(
            itemCount: listOfSliderImages.length,
            itemBuilder: (context, index, realIndex) {
              final url = listOfSliderImages[index];
              return Stack(
                fit: StackFit.expand,
                children: [
                  Image.asset(url, fit: BoxFit.cover),

                  //It Makes Image Dark black at botton and form the Shadow
                  // of black colour from bottom to top on image
                  Positioned.fill(
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          colors: [
                            const Color.fromRGBO(24, 24, 24, 1)
                                .withOpacity(1), // Adjust opacity as needed
                            Colors.transparent, // Transparent at the top
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 20,
                    bottom: 30,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          listOfSliderImgText1[index],
                          //   style: GoogleFonts.inter(
                          //     fontSize: 16,
                          //     fontWeight: FontWeight.w600,
                          //     color: Color.fromARGB(0, 87, 10, 242),
                          //   )
                          style: const TextStyle(
                              fontSize: 36,
                              color: Colors.white,
                              fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        getSubscribeButton(),
                      ],
                    ),
                  ),
                ],
              );
            },
            options: CarouselOptions(
              //Images chi height define krnyasathi
              height: 390,
              onPageChanged: (index, reason) {
                setState(() {
                  activeIndex = index;
                });
              },

              //Auo Image Slide
              autoPlay: true,
              //autoPlayInterval: const Duration(seconds: 2),

              //Image Show Krtana kiti disli phije
              viewportFraction: 1,
              //Front Image Hi Mothi Disli Phije Bakichya Image Peksha
              enlargeCenterPage: true,
              enlargeStrategy: CenterPageEnlargeStrategy.scale,
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              getDottedIndicator(),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              const SizedBox(
                width: 10,
              ),
              const Text(
                "Discography",
                //   style: GoogleFonts.inter(
                //     fontSize: 16,
                //     fontWeight: FontWeight.w600,
                //     color: Color.fromARGB(0, 87, 10, 242),
                //   )
                style: TextStyle(
                    fontSize: 16,
                    color: Color.fromRGBO(255, 46, 0, 1),
                    fontWeight: FontWeight.w600),
              ),
              const Spacer(),
              GestureDetector(
                child: const Text(
                  "See All",
                  //   style: GoogleFonts.inter(
                  //     fontSize: 16,
                  //     fontWeight: FontWeight.w600,
                  //     color: Color.fromARGB(0, 87, 10, 242),
                  //   )
                  style: TextStyle(
                      fontSize: 16,
                      color: Color.fromRGBO(248, 162, 69, 1),
                      fontWeight: FontWeight.w600),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          SizedBox(
            height: 180,
            child: ListView.builder(
              itemCount: listOfDiscographyImg.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 140,
                        width: 119,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            listOfDiscographyImg[index]["img"]!,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        listOfDiscographyImg[index]["title"]!,
                        //   style: GoogleFonts.inter(
                        //     fontSize: 16,
                        //     fontWeight: FontWeight.w600,
                        //     color: Color.fromARGB(0, 87, 10, 242),
                        //   )
                        style: const TextStyle(
                            fontSize: 12,
                            color: Color.fromRGBO(203, 200, 200, 1),
                            fontWeight: FontWeight.w600),
                      ),
                      Text(
                        listOfDiscographyImg[index]["year"]!,
                        //   style: GoogleFonts.inter(
                        //     fontSize: 16,
                        //     fontWeight: FontWeight.w600,
                        //     color: Color.fromARGB(0, 87, 10, 242),
                        //   )
                        style: const TextStyle(
                            fontSize: 10,
                            color: Color.fromRGBO(132, 125, 125, 1),
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                );
              },
              scrollDirection: Axis.horizontal,
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 10,
            itemBuilder: (context, index) {
              return Container(
                margin: const EdgeInsets.only(bottom: 10),
                height: 220,
                width: 200,
                color: Colors.red,
              );
            },
          ),
        ],
      ),
    );
  }
}
