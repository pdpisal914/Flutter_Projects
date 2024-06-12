import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:carousel_slider/carousel_slider.dart";
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
  final listOfPopularSingles = [
    {
      "img": "assets/images/psingles1.png",
      "title": "We Are Chaos",
      "year": "2023",
      "description": "Easy Living"
    },
    {
      "img": "assets/images/psingles2.png",
      "title": "Smile",
      "year": "2023",
      "description": "Berrechid"
    },
    {
      "img": "assets/images/psingles1.png",
      "title": "We Are Chaos",
      "year": "2023",
      "description": "Easy Living"
    },
    {
      "img": "assets/images/psingles2.png",
      "title": "Smile",
      "year": "2023",
      "description": "Berrechid"
    },
    {
      "img": "assets/images/psingles1.png",
      "title": "We Are Chaos",
      "year": "2023",
      "description": "Easy Living"
    },
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

  //Dot vr Click Kelyavr Direct Tya image vr janyasathi
  void animateToSlide(int index) => controller.animateToPage(index);
  //Image Indicator Creating
  Widget getDottedIndicator() {
    return AnimatedSmoothIndicator(
      activeIndex: activeIndex,
      count: listOfSliderImages.length,
      //Dot vr click kelyavr tikde janyasathi
      onDotClicked: animateToSlide,
      effect: const ExpandingDotsEffect(
          activeDotColor: Color.fromRGBO(255, 46, 0, 1),
          dotColor: Colors.white,
          dotHeight: 8,
          dotWidth: 8),
    );
  }

  int activeIndex = 0;
  final controller = CarouselController();
  int currentIndex = 0;

  void onTabTapped(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(24, 24, 24, 1),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: CarouselSlider.builder(
              carouselController: controller,
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
                height: 390,
                onPageChanged: (index, reason) {
                  setState(() {
                    activeIndex = index;
                  });
                },
                autoPlay: true,
                viewportFraction: 1,
                enlargeCenterPage: true,
                enlargeStrategy: CenterPageEnlargeStrategy.scale,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                const SizedBox(
                  height: 15,
                ),
                getDottedIndicator(),
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
                      style: TextStyle(
                          fontSize: 16,
                          color: Color.fromRGBO(255, 46, 0, 1),
                          fontWeight: FontWeight.w600),
                    ),
                    const Spacer(),
                    GestureDetector(
                      child: const Text(
                        "See All",
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
                  height: 182,
                  child: ListView.builder(
                    itemCount: listOfDiscographyImg.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            GestureDetector(
                              onTap:(){
                                
                              },
                              child: Container(
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
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              listOfDiscographyImg[index]["title"]!,
                              style: const TextStyle(
                                  fontSize: 14,
                                  color: Color.fromRGBO(203, 200, 200, 1),
                                  fontWeight: FontWeight.w600),
                            ),
                            Text(
                              listOfDiscographyImg[index]["year"]!,
                              style: const TextStyle(
                                  fontSize: 12,
                                  color: Color.fromRGBO(132, 125, 125, 1),
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    const SizedBox(
                      width: 10,
                    ),
                    const Text(
                      "Popular Singles",
                      style: TextStyle(
                          fontSize: 14,
                          color: Color.fromRGBO(203, 200, 200, 1),
                          fontWeight: FontWeight.w600),
                    ),
                    const Spacer(),
                    GestureDetector(
                      child: const Text(
                        "See All",
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
                  height: 5,
                ),
              ],
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
              return Row(
                children: [
                  Container(
                    margin: const EdgeInsets.all(10),
                    height: 72,
                    width: 67,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        listOfPopularSingles[index]["img"]!,
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(listOfPopularSingles[index]["title"]!,
                          style: GoogleFonts.inter(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: const Color.fromRGBO(203, 200, 200, 1),
                          )),
                      Text(
                          "${listOfPopularSingles[index]["year"]!} * ${listOfPopularSingles[index]["description"]}",
                          style: GoogleFonts.inter(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: const Color.fromRGBO(203, 200, 200, 1),
                          )),
                    ],
                  ),
                  const Spacer(),
                  GestureDetector(
                    child: const Icon(
                      Icons.more_vert,
                      size: 30,
                      color: Color.fromRGBO(203, 200, 200, 1),
                    ),
                  ),
                ],
              );
            }, childCount: 5),
          ),
          // ListView.builder(
          //   shrinkWrap: true,
          //   physics: const NeverScrollableScrollPhysics(),
          //   itemCount: 10,
          //   itemBuilder: (context, index) {
          //     return Container(
          //       margin: const EdgeInsets.only(bottom: 10),
          //       height: 220,
          //       width: 200,
          //       color: Colors.red,
          //     );
          //   },
          // ),
        ],
      ),
      // bottomNavigationBar: Container(
      //   padding: const EdgeInsets.only(bottom: 5),
      //   child: BottomNavigationBar(
      //     type: BottomNavigationBarType.fixed,
      //     selectedFontSize: 12,
      //     onTap: (int index) {
      //       setState(() {
      //         currentIndex = index;
      //       });
      //     },
      //     currentIndex: currentIndex,
      //     backgroundColor: const Color.fromRGBO(19, 19, 19, 1),
      //     unselectedItemColor: Colors.white,
      //     selectedItemColor: const Color.fromRGBO(230, 154, 21, 1),
      //     items: [
      //       BottomNavigationBarItem(
      //         icon: (currentIndex == 0)
      //             ? const Icon(
      //                 Icons.favorite,
      //                 size: 22,
      //               )
      //             : const Icon(
      //                 Icons.favorite_border,
      //                 size: 22,
      //               ),
      //         label: 'Favourite',
      //       ),
      //       BottomNavigationBarItem(
      //         icon: (currentIndex == 1)
      //             ? const Icon(
      //                 Icons.search,
      //                 size: 22,
      //               )
      //             : const Icon(
      //                 Icons.search_outlined,
      //                 size: 22,
      //               ),
      //         label: 'Search',
      //       ),
      //       BottomNavigationBarItem(
      //         icon: (currentIndex == 2)
      //             ? const Icon(
      //                 Icons.home,
      //                 size: 22,
      //               )
      //             : const Icon(
      //                 Icons.home_outlined,
      //                 size: 22,
      //               ),
      //         label: 'Home',
      //       ),
      //       BottomNavigationBarItem(
      //         icon: (currentIndex == 3)
      //             ? const Icon(
      //                 Icons.shopping_basket,
      //                 size: 22,
      //               )
      //             : const Icon(
      //                 Icons.shopping_basket_outlined,
      //                 size: 22,
      //               ),
      //         label: 'Cart',
      //       ),
      //       BottomNavigationBarItem(
      //         icon: (currentIndex == 4)
      //             ? const Icon(
      //                 Icons.person_2,
      //                 size: 22,
      //               )
      //             : const Icon(
      //                 Icons.person_outline,
      //                 size: 22,
      //               ),
      //         label: 'Profile',
      //       ),
      //     ],
      //   ),
      //),
    );
  }
}
