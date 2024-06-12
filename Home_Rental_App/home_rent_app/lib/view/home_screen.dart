import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";
import "home_detail_screen.dart";

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State createState() => _HomeScreenState();
}

class _HomeScreenState extends State {
  final listOfHome = [
    {
      "img": "assets/images/home1.png",
      "type": "Night Hill Villa",
      "location": "London,Night Hill",
      "price": "5900",
      "rating": "4.9"
    },
    {
      "img": "assets/images/home2.png",
      "type": "Night Villa",
      "location": "London,New Park",
      "price": "4900",
      "rating": "4.5",
    },
    {
      "img": "assets/images/home1.png",
      "type": "Night Hill Villa",
      "location": "London,Night Hill",
      "price": "5900",
      "rating": "4.9"
    },
    {
      "img": "assets/images/home2.png",
      "type": "Night Villa",
      "location": "London,New Park",
      "price": "4900",
      "rating": "4.5"
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(237, 237, 237, 1),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 50,
              bottom: 0,
              left: 18,
              right: 18,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      "Hey Dravid,",
                      style: GoogleFonts.poppins(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: const Color.fromRGBO(101, 101, 101, 1),
                      ),
                    ),
                    const Spacer(),
                    GestureDetector(
                      child: CircleAvatar(
                        radius: 24,
                        child: Image.asset("assets/images/profilePic.png"),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 60,
                  width: 188,
                  child: RichText(
                      textAlign: TextAlign.start,
                      text: TextSpan(
                        text: "Let's find your best residence ",
                        style: GoogleFonts.poppins(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: const Color.fromRGBO(0, 0, 0, 1),
                        ),
                      )),
                ),
                const SizedBox(
                  height: 23,
                ),
                Container(
                  alignment: Alignment.center,
                  height: 46,
                  width: 376,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: const Color.fromRGBO(255, 255, 255, 1),
                  ),
                  child: TextField(
                    cursorColor: const Color.fromRGBO(33, 33, 33, 1),
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.only(
                        bottom: 7,
                      ),
                      hintText: "Search your favourite paradise",
                      hintStyle: GoogleFonts.poppins(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: const Color.fromRGBO(33, 33, 33, 1),
                      ),
                      icon: Container(
                        margin: const EdgeInsets.only(left: 15, right: 0),
                        child: const Icon(
                          Icons.search,
                          size: 28,
                          color: Color.fromRGBO(33, 33, 33, 1),
                        ),
                      ),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                Row(
                  children: [
                    Text(
                      "Most popular",
                      style: GoogleFonts.poppins(
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                        color: const Color.fromRGBO(0, 0, 0, 1),
                      ),
                    ),
                    const Spacer(),
                    GestureDetector(
                      child: Text(
                        "See All",
                        style: GoogleFonts.poppins(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: const Color.fromRGBO(32, 169, 247, 1),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          SizedBox(
            height: 310,
            child: ListView.builder(
              itemCount: listOfHome.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, "/detail");
                  },
                  child: Container(
                    height: 306,
                    width: 211,
                    margin: const EdgeInsets.all(10),
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 196,
                          width: 189,
                          child: Stack(
                            fit: StackFit.expand,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: Image.asset(
                                  listOfHome[index]["img"]!,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Positioned(
                                top: 8,
                                right: 8,
                                child: Container(
                                  height: 22,
                                  width: 45,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color:
                                        const Color.fromRGBO(112, 200, 250, 1),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Icon(
                                        Icons.star_rate,
                                        size: 18,
                                        color: Color.fromRGBO(251, 227, 12, 1),
                                      ),
                                      Text(
                                        listOfHome[index]["rating"]!,
                                        style: GoogleFonts.poppins(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500,
                                          color: const Color.fromRGBO(
                                              255, 255, 255, 1),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Text(
                          listOfHome[index]["type"]!,
                          style: GoogleFonts.poppins(
                            fontSize: 17,
                            fontWeight: FontWeight.w600,
                            color: const Color.fromRGBO(0, 0, 0, 1),
                          ),
                        ),
                        Text(
                          //listOfHome[index]["location"]!,
                          listOfHome[index]["location"]!,
                          style: GoogleFonts.poppins(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: const Color.fromRGBO(101, 101, 101, 1),
                          ),
                        ),
                        RichText(
                          text: TextSpan(
                            text: "₹ ${listOfHome[index]["price"]!}",
                            style: GoogleFonts.poppins(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: const Color.fromRGBO(32, 169, 247, 1),
                            ),
                            children: [
                              TextSpan(
                                text: "/month",
                                style: GoogleFonts.poppins(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: const Color.fromRGBO(101, 101, 101, 1),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 10,
              left: 18,
              right: 18,
              bottom: 30,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  children: [
                    Text(
                      "Nearby your location",
                      style: GoogleFonts.poppins(
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                        color: const Color.fromRGBO(0, 0, 0, 1),
                      ),
                    ),
                    const Spacer(),
                    GestureDetector(
                      child: Text(
                        "More",
                        style: GoogleFonts.poppins(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: const Color.fromRGBO(32, 169, 247, 1),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 25,
                ),
                Container(
                  height: 108,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                  ),
                  child: Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(right: 0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.asset(
                            "assets/images/near.png",
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      Column(
                        children: [
                          Text(
                            "Jumeriah Golf Estates Villa        ",
                            style: GoogleFonts.poppins(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: const Color.fromRGBO(0, 0, 0, 1),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const Icon(
                                Icons.location_on,
                                size: 20,
                              ),
                              Text(
                                "London,Area Plam Jumeriah",
                                style: GoogleFonts.poppins(
                                  fontSize: 11,
                                  fontWeight: FontWeight.w600,
                                  color: const Color.fromRGBO(90, 90, 90, 1),
                                ),
                              ),
                              const SizedBox(
                                width: 50,
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const Icon(
                                Icons.bed,
                                size: 20,
                              ),
                              Text(
                                "4 Bedrooms",
                                style: GoogleFonts.poppins(
                                  fontSize: 9,
                                  fontWeight: FontWeight.w600,
                                  color: const Color.fromRGBO(90, 90, 90, 1),
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              const Icon(
                                Icons.bathtub_rounded,
                                size: 20,
                              ),
                              Text(
                                "5 Bathrooms",
                                style: GoogleFonts.poppins(
                                  fontSize: 9,
                                  fontWeight: FontWeight.w600,
                                  color: const Color.fromRGBO(90, 90, 90, 1),
                                ),
                              ),
                              const SizedBox(
                                width: 60,
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 7,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              const SizedBox(
                                width: 165,
                              ),
                              RichText(
                                text: TextSpan(
                                  text: "₹ 4500",
                                  style: GoogleFonts.poppins(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color:
                                        const Color.fromRGBO(32, 169, 247, 1),
                                  ),
                                  children: [
                                    TextSpan(
                                      text: "/month",
                                      style: GoogleFonts.poppins(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                        color: const Color.fromRGBO(
                                            101, 101, 101, 1),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
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
