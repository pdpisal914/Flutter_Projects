import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key});

  @override
  State createState() => _DetailScreenState();
}

class _DetailScreenState extends State {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(237, 237, 237, 1),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 18,
              right: 18,
              //top: 60,
            ),
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Container(
                    margin: const EdgeInsets.only(top: 60),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: const Icon(
                            Icons.chevron_left,
                            size: 40,
                            weight: 600,
                          ),
                        ),
                        const SizedBox(
                          width: 107,
                        ),
                        Text(
                          "Details",
                          style: GoogleFonts.poppins(
                            fontSize: 22,
                            fontWeight: FontWeight.w500,
                            color: const Color.fromRGBO(0, 0, 0, 1),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 20),
                    height: 244,
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Image.asset(
                            "assets/images/Rectangle 6.png",
                            fit: BoxFit.cover,
                          ),
                        ),
                        Positioned(
                          top: 8,
                          left: 8,
                          child: Container(
                            height: 22,
                            width: 48,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: const Color.fromRGBO(112, 200, 250, 1),
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
                                  "4.9",
                                  style: GoogleFonts.poppins(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                    color:
                                        const Color.fromRGBO(255, 255, 255, 1),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Night Hill Villa",
                            style: GoogleFonts.poppins(
                              fontSize: 22,
                              fontWeight: FontWeight.w600,
                              color: const Color.fromRGBO(0, 0, 0, 1),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            "London,Night Hill",
                            style: GoogleFonts.poppins(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: const Color.fromRGBO(72, 72, 72, 1),
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      RichText(
                        text: TextSpan(
                          text: "₹ 4500",
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: const Color.fromRGBO(32, 169, 247, 1),
                          ),
                          children: [
                            TextSpan(
                              text: "/month",
                              style: GoogleFonts.poppins(
                                fontSize: 16,
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
                SliverToBoxAdapter(
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                      vertical: 22,
                    ),
                    child: Row(
                      children: [
                        Container(
                          height: 141,
                          width: 112,
                          padding: const EdgeInsets.only(
                              left: 14, top: 20, bottom: 20, right: 16),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(13),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Icon(
                                Icons.bed,
                                size: 30,
                                color: Color.fromRGBO(0, 0, 0, 1),
                              ),
                              Text(
                                "Bedrooms",
                                style: GoogleFonts.poppins(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: const Color.fromRGBO(90, 90, 90, 1),
                                ),
                              ),
                              Text(
                                "5",
                                style: GoogleFonts.poppins(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: const Color.fromRGBO(0, 0, 0, 1),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Spacer(),
                        Container(
                          height: 141,
                          width: 112,
                          padding: const EdgeInsets.only(
                              left: 14, top: 20, bottom: 20, right: 16),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(13),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Icon(
                                Icons.bathtub_rounded,
                                size: 30,
                                color: Color.fromRGBO(0, 0, 0, 1),
                              ),
                              Text(
                                "Bathrooms",
                                style: GoogleFonts.poppins(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: const Color.fromRGBO(90, 90, 90, 1),
                                ),
                              ),
                              Text(
                                "6",
                                style: GoogleFonts.poppins(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: const Color.fromRGBO(0, 0, 0, 1),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Spacer(),
                        Container(
                          height: 141,
                          width: 112,
                          padding: const EdgeInsets.only(
                              left: 14, top: 20, bottom: 20, right: 16),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(13),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Icon(
                                Icons.crop_square_rounded,
                                size: 30,
                                color: Color.fromRGBO(0, 0, 0, 1),
                              ),
                              const Spacer(),
                              Text(
                                "Square ft",
                                style: GoogleFonts.poppins(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: const Color.fromRGBO(90, 90, 90, 1),
                                ),
                              ),
                              const Spacer(),
                              Text(
                                "7,000 sqft",
                                style: GoogleFonts.poppins(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: const Color.fromRGBO(0, 0, 0, 1),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: RichText(
                    text: TextSpan(
                      text:
                          '''Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit. Exercitation veniam consequat sunt nostrud amet. Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit. Exercitation veniam consequat sunt nostrud amet
                          

                          
                          
                          
                          ''',
                      style: GoogleFonts.poppins(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        color: const Color.fromRGBO(0, 0, 0, 1),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                height: 114,
                width: double.infinity,
                alignment: Alignment.center,
                decoration: const BoxDecoration(boxShadow: [
                  BoxShadow(
                    spreadRadius: 10,
                    blurRadius: 20,
                    color: Colors.white,
                  ),
                ]),
                child: GestureDetector(
                  onTap: () {
                    // Navigator.pushReplacementNamed(context, "/home");
                  },
                  child: Container(
                    height: 55,
                    width: 220,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      color: const Color.fromRGBO(32, 169, 247, 1),
                    ),
                    child: Text(
                      "Rent Now",
                      style: GoogleFonts.poppins(
                        fontSize: 22,
                        color: const Color.fromRGBO(255, 255, 255, 1),
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
