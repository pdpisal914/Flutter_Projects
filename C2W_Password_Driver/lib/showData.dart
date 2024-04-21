import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todolist_with_sqflite/databaseConnections.dart';
import 'package:url_launcher/url_launcher.dart';

class Demo extends StatefulWidget {
  final int index;
  @override
  const Demo(this.index, {super.key});

  State createState() => _DemoState(index);
}

class _DemoState extends State<Demo> {
  int? index;
  _DemoState(this.index);
  String urlWeb = "https://www.core2web.in/";

  Future<void> launchWebsite(String urlString, BuildContext context) async {
    final Uri url = Uri.parse(urlString);
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Could not launch $urlString'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      padding: const EdgeInsets.only(
        top: 50,
        bottom: 138,
      ),
      height: double.infinity,
      width: double.infinity,
      decoration: const BoxDecoration(
          // color: Colors.indigo,
          image: DecorationImage(
        fit: BoxFit.fill,
        image: AssetImage(
          'lib/image/showdatabg.jpg',
        ),
      )),
      child: Column(
        children: [
          Row(
            // alignment: Alignment.topLeft,
            children: [
              Container(
                decoration: const BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromRGBO(137, 0, 255, 1),
                      offset: Offset(0, 0),
                      spreadRadius: 280,
                      blurRadius: 1000,
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 15),
                        alignment: Alignment.center,
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(100),
                                bottomRight: Radius.circular(100)),
                            boxShadow: [
                              BoxShadow(
                                  spreadRadius: 2,
                                  blurRadius: 10,
                                  color: Colors.black)
                            ]),
                        child: Text(
                          "Back",
                          style: GoogleFonts.quicksand(
                              color: const Color.fromRGBO(137, 0, 255, 1),
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 75,
                    ),
                    SizedBox(
                      width: 200,
                      child: Text(
                        "Details",
                        style: GoogleFonts.quicksand(
                            color: Colors.white,
                            fontSize: 38,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                    //const Spacer(),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: Container(
              //color: Colors.blue,
              margin: const EdgeInsets.symmetric(horizontal: 30),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                  color:
                      Colors.white, // const Color.fromARGB(255, 225, 224, 224),
                  borderRadius: BorderRadius.circular(25),
                  boxShadow: const [
                    BoxShadow(
                      spreadRadius: 15,
                      blurRadius: 15,
                      color: Color.fromRGBO(137, 0, 255,
                          1), //Color.fromRGBO(137, 0, 255, 1),//Colors.black38
                    )
                  ]),
              child: Column(
                //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        //width: 300,
                        width: 290,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          // boxShadow: [
                          //   BoxShadow(
                          //       spreadRadius: 0.5,
                          //       blurRadius: 15,
                          //       color: Color.fromRGBO(184, 102, 255, 1))
                          // ],
                        ),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Text(
                            //"DETAILS gfhfjkghdioug",
                            listOfCards[index!].cardTitle,
                            style: GoogleFonts.quicksand(
                                fontWeight: FontWeight.w900,
                                fontSize: 30,
                                color: const Color.fromRGBO(137, 0, 255, 1)),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Divider(
                    color: Color.fromRGBO(137, 0, 255, 1),
                    thickness: 2,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "  USER ID",
                    style: GoogleFonts.quicksand(
                        fontSize: 15,
                        color: const Color.fromRGBO(137, 0, 255, 1),
                        fontWeight: FontWeight.bold),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    height: 50,
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 1.5,
                        color: const Color.fromRGBO(137, 0, 255, 1),
                      ),
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                    ),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Text(
                        listOfCards[index!].cardUserId,
                        style: GoogleFonts.quicksand(
                            fontSize: 15, fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Text(
                    "  PASSWORD",
                    style: GoogleFonts.quicksand(
                        color: const Color.fromRGBO(137, 0, 255, 1),
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                  Container(
                    height: 50,
                    //color: Colors.black12,
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 1.5,
                        color: const Color.fromRGBO(137, 0, 255, 1),
                      ),
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                    ),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Text(
                        listOfCards[index!].cardPassword,
                        style: GoogleFonts.quicksand(
                            fontSize: 15, fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Text(
                    "  WEBSITE",
                    style: GoogleFonts.quicksand(
                        color: const Color.fromRGBO(137, 0, 255, 1),
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                  Container(
                    height: 50,
                    width: double.infinity,
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    //color: Colors.black12,
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 1.5,
                        color: const Color.fromRGBO(137, 0, 255, 1),
                      ),
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                    ),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Text(
                        listOfCards[index!].cardWebsite,
                        style: GoogleFonts.quicksand(
                            color: Colors.blue,
                            fontSize: 15,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Text(
                    "  DESCRIPTION",
                    style: GoogleFonts.quicksand(
                        color: const Color.fromRGBO(137, 0, 255, 1),
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                  Container(
                    height: 120,
                    width: double.infinity,
                    alignment: Alignment.topLeft,
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    //color: Colors.black12,
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 1.5,
                        color: const Color.fromRGBO(137, 0, 255, 1),
                      ),
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                    ),
                    child: SizedBox(
                      width: double.infinity,
                      child: Text(listOfCards[index!].cardDescription),
                    ),
                    // child: Text(urlWeb))
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
