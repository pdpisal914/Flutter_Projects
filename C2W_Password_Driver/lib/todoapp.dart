import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todolist_with_sqflite/showData.dart';
import 'databaseConnections.dart';

//import 'package:path/path.dart';
dynamic database;

class ToDoApp2 extends StatefulWidget {
  const ToDoApp2({super.key});

  @override
  State<ToDoApp2> createState() => _ToDoApp2State();
}

class _ToDoApp2State extends State<ToDoApp2> {
  TextEditingController titleCardController = TextEditingController();
  TextEditingController userCardController = TextEditingController();
  TextEditingController passwordCardController = TextEditingController();
  TextEditingController descriptionCardController = TextEditingController();
  TextEditingController websiteCardController = TextEditingController();
  int isTaskCompleted = 0;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void doNothing(BuildContext context) async {}

  CardInfo _addNewCard() {
    CardInfo card = CardInfo(
      cardTitle: titleCardController.text,
      emailId: globalEmailId!,
      cardUserId: userCardController.text,
      cardPassword: passwordCardController.text,
      cardWebsite: websiteCardController.text,
      cardDescription: descriptionCardController.text,
    );
    // listOfCards.add(card);
    return card;
  }

  Future _showModelBottomSheet(bool isEdit, [CardInfo? card]) {
    return showModalBottomSheet(
        isScrollControlled: true,
        context: this.context,
        builder: (BuildContext context) {
          return SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(
                left: 20,
                right: 20,
                top: 10,
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 45,
                      child: Text(
                        "Save Password",
                        style: GoogleFonts.quicksand(
                            color: Colors.black,
                            fontSize: 30,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                    const SizedBox(
                      height: 0,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Title",
                          style: GoogleFonts.quicksand(
                            fontSize: 15,
                            color: const Color.fromRGBO(137, 0, 255, 1),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        TextFormField(
                          statesController: MaterialStatesController(),
                          maxLines: null,
                          controller: titleCardController,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          decoration: InputDecoration(
                            labelText: "Title",
                            //hintText: "Enter Title",
                            border: const OutlineInputBorder(
                              borderSide: BorderSide(
                                width: 2,
                                color: Color.fromRGBO(137, 0, 255, 1),
                              ),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                width: 2,
                                color: Color.fromRGBO(137, 0, 255, 1),
                              ),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                width: 2,
                                color: Color.fromRGBO(137, 0, 255, 1),
                              ),
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          validator: (value) {
                            if (value!.trim().isEmpty) {
                              return "Please Enter UserID";
                            }
                            RegExp specialChars =
                                RegExp(r'[!@#\$%^&*(),.?":{}|<>]');
                            if (specialChars.hasMatch(value)) {
                              return 'Special characters are not allowed';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          "User ID",
                          style: GoogleFonts.quicksand(
                            fontSize: 15,
                            color: const Color.fromRGBO(137, 0, 255, 1),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        TextFormField(
                          statesController: MaterialStatesController(),
                          maxLines: null,
                          controller: userCardController,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          decoration: InputDecoration(
                            labelText: "User ID",
                            //hintText: "Enter Title",
                            border: const OutlineInputBorder(
                              borderSide: BorderSide(
                                width: 2,
                                color: Color.fromRGBO(137, 0, 255, 1),
                              ),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                width: 2,
                                color: Color.fromRGBO(137, 0, 255, 1),
                              ),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                width: 2,
                                color: Color.fromRGBO(137, 0, 255, 1),
                              ),
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          validator: (value) {
                            if (value!.trim().isEmpty) {
                              return "Please Enter UserID";
                            }
                            RegExp specialChars =
                                RegExp(r'[!@#\$%^&*(),.?":{}|<>]');
                            if (specialChars.hasMatch(value)) {
                              return 'Special characters are not allowed';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Password",
                          style: GoogleFonts.quicksand(
                            fontSize: 15,
                            color: const Color.fromRGBO(137, 0, 255, 1),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        TextFormField(
                          statesController: MaterialStatesController(),
                          maxLines: null,
                          controller: passwordCardController,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          decoration: InputDecoration(
                            labelText: "Password",
                            //hintText: "Enter Title",
                            border: const OutlineInputBorder(
                              borderSide: BorderSide(
                                width: 2,
                                color: Color.fromRGBO(137, 0, 255, 1),
                              ),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                width: 2,
                                color: Color.fromRGBO(137, 0, 255, 1),
                              ),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                width: 2,
                                color: Color.fromRGBO(137, 0, 255, 1),
                              ),
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          validator: (value) {
                            if (value!.trim().isEmpty) {
                              return "Please Enter Password";
                            }
                            // RegExp specialChars =
                            //     RegExp(r'[!@#\$%^&*(),.?":{}|<>]');
                            // if (specialChars.hasMatch(value)) {
                            //   return 'Special characters are not allowed';
                            // }
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Description",
                          style: GoogleFonts.quicksand(
                            fontSize: 15,
                            color: const Color.fromRGBO(137, 0, 255, 1),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        TextFormField(
                          maxLines: null,
                          controller: descriptionCardController,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          decoration: InputDecoration(
                            labelText: "Description",
                            //hintText: "Enter Password",

                            border: const OutlineInputBorder(
                              borderSide: BorderSide(
                                width: 2,
                                color: Color.fromRGBO(137, 0, 255, 1),
                              ),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                width: 2,
                                color: Color.fromRGBO(137, 0, 255, 1),
                              ),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                width: 2,
                                color: Color.fromRGBO(137, 0, 255, 1),
                              ),
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          "WebSite",
                          style: GoogleFonts.quicksand(
                            fontSize: 15,
                            color: const Color.fromRGBO(137, 0, 255, 1),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        TextFormField(
                          maxLines: null,
                          controller: websiteCardController,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          decoration: InputDecoration(
                            labelText: "WebSite",
                            border: const OutlineInputBorder(
                              borderSide: BorderSide(
                                width: 3,
                                color: Color.fromRGBO(137, 0, 255, 1),
                              ),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                width: 2,
                                color: Color.fromRGBO(137, 0, 255, 1),
                              ),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                width: 2,
                                color: Color.fromRGBO(137, 0, 255, 1),
                              ),
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    GestureDetector(
                      onTap: () async {
                        bool allTextFieldsArValidated =
                            _formKey.currentState!.validate();

                        if (allTextFieldsArValidated) {
                          if (isEdit) {
                            print(titleCardController.text);
                            print(passwordCardController.text);
                            print(userCardController.text);
                            //UPDATE THE DATA IN LISTOFCARDS

                            // //UPDATE THE DATA IN LISTOFCARDS
                            card!.cardTitle = titleCardController.text;
                            card.cardUserId = userCardController.text;
                            card.cardPassword = passwordCardController.text;
                            card.cardDescription =
                                descriptionCardController.text;
                            card.cardWebsite = websiteCardController.text;
                            //UPDATE THE DATA IN DATABASE
                            print("INDEX IN BUILDER - - -  ");
                            await updateCardInDatabase(card);
                            //Navigator.pop(context);
                          } else {
                            //ADD NEW ENTRY IN DATABASE
                            //_addNewCard() ADD NEW ENTRY IN THE LISTOFCARDS
                            await insertCardData(await _addNewCard());

                            print(listOfCards);
                          }

                          setState(() {
                            Navigator.of(context).pop();
                          });
                          titleCardController.clear();
                          userCardController.clear();
                          passwordCardController.clear();
                          descriptionCardController.clear();
                          websiteCardController.clear();
                        }
                      },
                      child: Container(
                        height: 50,
                        width: 380,
                        decoration: const BoxDecoration(
                          color: Color.fromRGBO(137, 0, 255, 1),
                          borderRadius: BorderRadius.all(
                            Radius.circular(15),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            "Save",
                            style: GoogleFonts.quicksand(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }

  Widget row1(BuildContext context, int index) {
    var screensize = MediaQuery.of(context).size;

    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Slidable(
          closeOnScroll: true,
          startActionPane: ActionPane(
            extentRatio: 0.3,
            motion: const DrawerMotion(),
            children: [
              Expanded(
                child: Container(
                  // height: 50,
                  //width: 50,
                  margin: const EdgeInsets.all(10),
                  alignment: Alignment.center,
                  // decoration: const BoxDecoration(
                  //     shape: BoxShape.circle, color: Colors.red),
                  child: GestureDetector(
                    onTap: () async {
                      await deleteCardFromDatabase(listOfCards[index]);
                      setState(() {});
                    },
                    child: const CircleAvatar(
                      backgroundColor: Colors.red,
                      child: Icon(
                        Icons.delete,
                        color: Colors.white,
                        size: 18,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          child: GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: ((context) => Demo(index))));
            },
            onLongPress: () {
              titleCardController.text = listOfCards[index].cardTitle;
              userCardController.text = listOfCards[index].cardUserId;
              passwordCardController.text = listOfCards[index].cardPassword;
              descriptionCardController.text =
                  listOfCards[index].cardDescription!;
              websiteCardController.text = listOfCards[index].cardWebsite!;
              _showModelBottomSheet(true, listOfCards[index]);
            },
            child: Container(
              margin: const EdgeInsets.only(bottom: 10, top: 10),
              padding: const EdgeInsets.all(15),
              //height: 60,
              width: screensize.width / 2,
              //color: Colors.red,
              decoration: const BoxDecoration(
                  color: Color.fromRGBO(137, 0, 255, 1),
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(50),
                      bottomRight: Radius.circular(50)),
                  boxShadow: [
                    BoxShadow(
                      spreadRadius: 2,
                      blurRadius: 10,
                      color: Colors.black12,
                    )
                  ]),
              child: Row(
                children: [
                  SizedBox(
                    width: 115,
                    child: Text(listOfCards[index].cardTitle,
                        style: GoogleFonts.quicksand(
                          fontSize: 22,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        )),
                  ),
                  const Spacer(),
                  Container(
                    height: 50,
                    width: 50,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.blue,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Image.asset("lib/image/shild2.jpg"),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        //const Text("- - - -")
      ],
    );
  }

  Widget row2(BuildContext context, int index) {
    var screensize = MediaQuery.of(context).size;

    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Slidable(
          endActionPane: ActionPane(
            extentRatio: 0.3,
            motion: const DrawerMotion(),
            children: [
              Expanded(
                child: Container(
                  height: 57,
                  width: 57,

                  margin: const EdgeInsets.all(10),
                  alignment: Alignment.center,
                  // decoration: const BoxDecoration(
                  //     shape: BoxShape.circle, color: Colors.red),
                  child: GestureDetector(
                    onTap: () async {
                      await deleteCardFromDatabase(listOfCards[index]);
                      setState(() {});
                    },
                    child: const CircleAvatar(
                      backgroundColor: Colors.red,
                      child: Icon(
                        Icons.delete,
                        color: Colors.white,
                        size: 18,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          child: GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: ((context) => Demo(index))));
            },
            onLongPress: () {
              titleCardController.text = listOfCards[index].cardTitle;
              userCardController.text = listOfCards[index].cardUserId;
              passwordCardController.text = listOfCards[index].cardPassword;
              descriptionCardController.text =
                  listOfCards[index].cardDescription!;
              websiteCardController.text = listOfCards[index].cardWebsite!;
              _showModelBottomSheet(true, listOfCards[index]);
            },
            child: Container(
              margin: const EdgeInsets.only(bottom: 8, top: 8),
              padding: const EdgeInsets.all(15),
              //height: 60,
              width: screensize.width / 2,
              //color: Colors.red,
              decoration: const BoxDecoration(
                  color: Colors.white, //Color.fromRGBO(137, 0, 255, 1),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      bottomLeft: Radius.circular(50)),
                  boxShadow: [
                    BoxShadow(
                      spreadRadius: 2,
                      blurRadius: 10,
                      color: Colors.black12,
                    )
                  ]),
              child: Row(
                children: [
                  Container(
                    // height: 57,
                    // width: 57,
                    height: 50,
                    width: 50,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.blue,
                      boxShadow: [
                        BoxShadow(
                            offset: Offset(0, 0),
                            spreadRadius: 2,
                            blurRadius: 20,
                            color: Colors
                                .black12 //Color.fromRGBO(137, 0, 255, 1), // Color.fromRGBO(195, 0, 255, 1),
                            ),
                      ],
                    ),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Image.asset("lib/image/shild2.jpg")),
                  ),
                  const SizedBox(
                    //width: 10,
                    width: 8,
                  ),
                  SizedBox(
                    width: 108,
                    child: Text(listOfCards[index].cardTitle,
                        style: GoogleFonts.quicksand(
                          fontSize: 22,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        )),
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }

  Future initializeData() async {
    await getCardDetailsList();
  }

  @override
  void initState() {
    print("IN INITSTATE");
    super.initState();
    initializeData();
  }

  bool isListEmpty() {
    if (listOfCards.length == 0) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    var screensize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor:
          Color.fromRGBO(137, 0, 255, 1), //Color.fromARGB(255, 30, 94, 43),
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Container(
          margin: const EdgeInsets.only(
            top: 32,
            left: 20,
          ),
          child: Row(
            children: [
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                SizedBox(
                  // height: 29,
                  child: Text(
                    // "Unlock ease with",
                    "Password",
                    style: GoogleFonts.quicksand(
                      fontStyle: FontStyle.normal,
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 37,
                    ),
                  ),
                ),
                SizedBox(
                  //height: 38,
                  child: Text(
                    //"Password Driver",
                    "Driver",
                    style: GoogleFonts.quicksand(
                      fontStyle: FontStyle.normal,
                      color: Colors.white,
                      fontWeight: FontWeight.w800,
                      fontSize: 37,
                    ),
                  ),
                ),
              ]),
              const Spacer(),
              GestureDetector(
                onTap: () {
                  titleCardController.clear();
                  userCardController.clear();
                  passwordCardController.clear();
                  descriptionCardController.clear();
                  websiteCardController.clear();
                  _showModelBottomSheet(false);
                },
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(100),
                          bottomLeft: Radius.circular(100)),
                      boxShadow: [
                        BoxShadow(
                            spreadRadius: 2,
                            blurRadius: 10,
                            color: Colors.black)
                      ]),
                  child: Text(
                    "+ ADD",
                    style: GoogleFonts.quicksand(
                        color: const Color.fromRGBO(137, 0, 255, 1),
                        fontWeight: FontWeight.bold,
                        fontSize: 15),
                  ),
                ),
              )
            ],
          ),
        ),
        const SizedBox(
          height: 33,
        ),
        Expanded(
          child: Container(
            padding: const EdgeInsets.only(top: 30),
            decoration: const BoxDecoration(
              color: Color.fromRGBO(195, 0, 255, 1),
              boxShadow: [
                BoxShadow(
                    color: Color.fromRGBO(1, 0, 2, 1),
                    offset: Offset(0, 0),
                    spreadRadius: 2,
                    blurRadius: 45),
              ],
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(125),
                //topRight: Radius.circular(40),
                //bottomRight: Radius.circular(100),
              ),
            ),
            //color: Colors.black,
            child: Column(
              children: [
                Container(
                  //height: screensize.height / 1.319,
                  height: screensize.height / 1.315,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(100),
                      // topRight: Radius.circular(30),
                    ),
                  ),
                  // padding: const EdgeInsets.only(
                  //   top: 70,
                  // ),

                  // Container(
                  //   height: 70,
                  //   width: double.infinity,
                  //   child: Text(
                  //     "Let us handle the keys",
                  //     style: GoogleFonts.quicksand(
                  //       fontSize: 20,
                  //       fontWeight: FontWeight.w700,
                  //       fontStyle: FontStyle.normal,
                  //       color: const Color.fromRGBO(137, 0, 255, 1),
                  //     ),
                  //   ),
                  // ),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(100),
                    ),
                    child: ListView.builder(
                      itemCount: listOfCards.length,
                      itemBuilder: (context, index) {
                        print("INDEX IN BUILDER - - -  $index");
                        return (index % 2 == 0)
                            ? row1(context, index)
                            : row2(context, index);
                      },
                    ),
                  ),

                  // child: Column(
                  //   crossAxisAlignment: CrossAxisAlignment.center,
                  //   children: [
                  //     // SizedBox(
                  //     //   height: 17,
                  //     //   child: Text(
                  //     //     "CREATE TO DO LIST",
                  //     //     style: GoogleFonts.quicksand(
                  //     //       color: const Color.fromRGBO(0, 0, 0, 1),
                  //     //       fontWeight: FontWeight.w600,
                  //     //       fontSize: 16,
                  //     //     ),
                  //     //   ),
                  //     // ),
                  //     const SizedBox(
                  //       height: 20,
                  //     ),
                  //     // Expanded(
                  //     //   child: Container(
                  //     //     //height: 590,
                  //     //     padding: const EdgeInsets.only(
                  //     //       top: 35,
                  //     //       left: 10,
                  //     //       right: 10,
                  //     //     ),
                  //     //     decoration: const BoxDecoration(
                  //     //       color: Color.fromRGBO(255, 255, 255, 1),
                  //     //       borderRadius: BorderRadius.only(
                  //     //         topLeft: Radius.circular(40),
                  //     //         topRight: Radius.circular(40),
                  //     //       ),
                  //     //     ),
                  //     //     child: isListEmpty()
                  //     //         ? Image.asset('lib/image/person.jpg')
                  //     //         : ListView.builder(
                  //     //             itemCount: listOfCards.length,
                  //     //             itemBuilder: (BuildContext context, int index) {
                  //     //               return _card(index);
                  //     //             }),
                  //     //   ),
                  //     // ),
                  //   ],
                  // ),
                ),
              ],
            ),
          ),
        ),
      ]),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     _showModelBottomSheet(false);
      //   },
      //   backgroundColor: const Color.fromRGBO(137, 0, 255, 1),
      //   shape: const CircleBorder(
      //       side: BorderSide(
      //     color: Colors.white,
      //     width: 0.5,
      //   )),
      //   child: const Icon(
      //     Icons.add,
      //     color: Colors.white,
      //     size: 45,
      //   ),
      // ),
    );
  }
}
