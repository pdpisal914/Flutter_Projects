import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'databaseConnections.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() {
    return _RegistrationPageState();
  }
}

class _RegistrationPageState extends State<RegistrationPage> {
  bool forgotClick = false;
  bool registerClick = false;
  final GlobalKey<FormState> _registrationKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController pwdController = TextEditingController();
  TextEditingController userController = TextEditingController();

  bool isValidEmail(String email) {
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return emailRegex.hasMatch(email);
  }

  bool isValidUser(String name) {
    if (name.trim().isEmpty) {
      return false;
    } else {
      return true;
    }
  }

  bool isValidPassword(String value) {
    // Password should have at least 4 characters
    if (value.length < 4) return false;

    // Password should contain at least one alphabet and one digit
    if (!RegExp(r'^(?=.*?[a-zA-Z])(?=.*?[0-9])').hasMatch(value)) return false;

    // Password should contain at least one special character
    if (!RegExp(r'^(?=.*?[!@#$%^&*()_+}{:;"?><,./\[\]\\\\-])').hasMatch(value))
      return false;

    return true;
  }

  // Future<void> startingSetup() async {
  //   await createDatabase();
  //   // await getCardDetailsList();
  // }

  void _showErrorSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: GoogleFonts.quicksand(
            color: const Color.fromRGBO(137, 0, 255, 1),
            fontSize: 15,
            fontWeight: FontWeight.w500,
          ),
        ),
        backgroundColor: //const Color.fromRGBO(137, 0, 255, 1),
            Colors.white,
        duration: const Duration(seconds: 5),
        behavior: SnackBarBehavior.floating,
        elevation: 200,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: const BorderSide(color: Colors.white, width: 2),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      // appBar: AppBar(
      //   backgroundColor: ,
      //   leading: IconButton(
      //     onPressed: () {},
      //     icon: const Icon(
      //       Icons.arrow_back,
      //       weight: 20,
      //       size: 20,
      //       color: Colors.white,
      //     ),
      //   ),
      // ),
      body: SingleChildScrollView(
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            SizedBox(
              //height: double.infinity,
              height: screenSize.height,
              width: screenSize.width,
              child: Image.asset(
                'lib/image/loginbg.jpg',
                fit: BoxFit.fill,
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: screenSize.height / 8,
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  margin: const EdgeInsets.only(
                    left: 30,
                    bottom: 30,
                  ),
                  decoration: const BoxDecoration(
                    color: Color.fromRGBO(137, 0, 255, 1),
                    boxShadow: [
                      BoxShadow(
                          spreadRadius: 250,
                          blurRadius: 1000,
                          color: Color.fromRGBO(137, 0, 255, 1),
                          offset: Offset(0, 0)),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Let's Begin!",
                        style: GoogleFonts.quicksand(
                            color: Colors.white,
                            fontSize: 35,
                            fontWeight: FontWeight.w700),
                      ),
                      Text(
                        "Register Now",
                        style: GoogleFonts.quicksand(
                            color: Colors.white,
                            fontSize: 45,
                            fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 480,
                  //width: double.maxFinite,
                  margin: const EdgeInsets.only(
                    left: 30,
                    right: 30,
                  ),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    boxShadow: [
                      BoxShadow(
                          spreadRadius: 0,
                          blurRadius: 20,
                          color: Color.fromRGBO(137, 0, 255, 1),
                          offset: Offset(0, 0)),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 7,
                    ),
                    child: Form(
                      key: _registrationKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                child: Text(
                                  "Create Your Account",
                                  style: GoogleFonts.quicksand(
                                      fontWeight: FontWeight.w800,
                                      fontSize: 25,
                                      color:
                                          const Color.fromRGBO(137, 0, 255, 1)),
                                ),
                              ),
                            ],
                          ),
                          Text(
                            "User Name",
                            style: GoogleFonts.quicksand(
                              fontSize: 15,
                              color: const Color.fromRGBO(137, 0, 255, 1),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          TextFormField(
                            statesController: MaterialStatesController(),
                            maxLines: null,
                            controller: userController,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(
                                horizontal: 10,
                              ),
                              labelText: "User Name",
                              labelStyle: GoogleFonts.quicksand(),
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
                            // validator: (value) {
                            //   if (value!.trim().isEmpty) {
                            //     return "Please Enter Title";
                            //   }
                            //   RegExp specialChars =
                            //       RegExp(r'[!@#\$%^&*(),.?":{}|<>]');
                            //   if (specialChars.hasMatch(value)) {
                            //     return 'Special characters are not allowed';
                            //   }
                            //   return null;
                            // },
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter user name ';
                              } else if (!isValidUser(value)) {
                                return 'Please enter a valid user name';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Email Id",
                            style: GoogleFonts.quicksand(
                              fontSize: 15,
                              color: const Color.fromRGBO(137, 0, 255, 1),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          TextFormField(
                            statesController: MaterialStatesController(),
                            maxLines: null,
                            controller: emailController,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(
                                horizontal: 10,
                              ),
                              labelText: "Email Id",
                              labelStyle: GoogleFonts.quicksand(),
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
                            // validator: (value) {
                            //   if (value!.trim().isEmpty) {
                            //     return "Please Enter Title";
                            //   }
                            //   RegExp specialChars =
                            //       RegExp(r'[!@#\$%^&*(),.?":{}|<>]');
                            //   if (specialChars.hasMatch(value)) {
                            //     return 'Special characters are not allowed';
                            //   }
                            //   return null;
                            // },
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter an email id';
                              } else if (!isValidEmail(value)) {
                                return 'Please enter a valid email';
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
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          TextFormField(
                            statesController: MaterialStatesController(),
                            maxLines: null,
                            controller: pwdController,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(
                                horizontal: 10,
                              ),
                              labelText: "Passord",
                              labelStyle: GoogleFonts.quicksand(),
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
                            // validator: (value) {
                            //   if (value!.trim().isEmpty) {
                            //     return "Please Enter Title";
                            //   }
                            //   RegExp specialChars =
                            //       RegExp(r'[!@#\$%^&*(),.?":{}|<>]');
                            //   if (specialChars.hasMatch(value)) {
                            //     return 'Special characters are not allowed';
                            //   }
                            //   return null;
                            // },
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter a password';
                              }
                              if (!isValidPassword(value)) {
                                return 'Enter at least 4 , one alphabet,\n one digit, and one special character';
                              }
                              return null;
                            },
                          ),
                          const Spacer(),
                          GestureDetector(
                            // onTap: () async {
                            //   await insertUserData(
                            //     UserInfo(
                            //         emailId: emailController.text.trim(),
                            //         userName: userController.text.trim(),
                            //         userPassword: pwdController.text.trim()),
                            //   );
                            //   _showErrorSnackBar(
                            //       "Account Created Successfully.");
                            //   emailController.clear();
                            //   userController.clear();
                            //   pwdController.clear();
                            //   Navigator.pop(context);
                            // },
                            //INSERT NEW LOGIN USER
                            onTap: () async {
                              await insertLoginData(
                                LoginInfo(
                                  emailId: emailController.text.trim(),
                                  userName: userController.text.trim(),
                                  userPassword: pwdController.text.trim(),
                                ),
                              );

                              setState(() async {
 //GLOBAL EMAIL ID IS INITIALIZED
                               // globalEmailId = emailController.text.trim();
                                // await insertCardData(
                                //   CardInfo(
                                //     cardUserId: userController.text.trim(),
                                //     emailId: emailController.text.trim(),
                                //     cardTitle: "Password Driver",
                                //     cardPassword: pwdController.text.trim(),
                                //   ),
                                // );
                                emailController.clear();
                                userController.clear();
                                pwdController.clear();
                                Navigator.pop(context);
                              });
                            },
                            child: Container(
                              height: 44,
                              //width: 380,
                              margin: const EdgeInsets.only(
                                bottom: 5,
                              ),
                              decoration: const BoxDecoration(
                                color: Color.fromRGBO(137, 0, 255, 1),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(15),
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  "Create Account",
                                  style: GoogleFonts.quicksand(
                                    color: Colors.white,
                                    fontSize: 25,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const Spacer(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Expanded(
                                child: Divider(
                                  thickness: 1.5,
                                  color: Color.fromRGBO(137, 0, 255, 1),
                                ),
                              ),
                              Text(
                                " with ",
                                style: GoogleFonts.quicksand(
                                  fontWeight: FontWeight.w600,
                                  color: const Color.fromRGBO(137, 0, 255, 1),
                                ),
                              ),
                              const Expanded(
                                child: Divider(
                                  thickness: 1.5,
                                  color: Color.fromRGBO(137, 0, 255, 1),
                                ),
                              ),
                            ],
                          ),
                          const Spacer(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: 40,
                                width: 40,
                                margin: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Color.fromRGBO(137, 0, 255, 1),
                                      offset: Offset(0, 0),
                                      spreadRadius: 0.5,
                                      blurRadius: 5,
                                    ),
                                  ],
                                  // border: Border.all(
                                  //     color:
                                  //         const Color.fromRGBO(137, 0, 255, 1),
                                  //     width: 1),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Image.asset(
                                    'lib/image/fc.jpg',
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Container(
                                height: 40,
                                width: 40,
                                margin: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Color.fromRGBO(137, 0, 255, 1),
                                      offset: Offset(0, 0),
                                      spreadRadius: 0.5,
                                      blurRadius: 5,
                                    ),
                                  ],
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Image.asset(
                                    'lib/image/google.jpg',
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      if (registerClick == false) {
                        registerClick = true;
                      } else {
                        registerClick = false;
                      }
                      Navigator.pop(context);
                    });
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Login Now",
                        style: GoogleFonts.quicksand(
                          fontWeight: FontWeight.w700,
                          fontSize: 18,
                          color: (registerClick)
                              ? Colors.green
                              : const Color.fromRGBO(76, 3, 150, 1),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
