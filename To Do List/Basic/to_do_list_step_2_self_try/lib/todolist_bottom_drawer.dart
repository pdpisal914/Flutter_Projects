import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ToDoListApp extends StatefulWidget {
  const ToDoListApp({super.key});

  @override
  State createState() => _ToDoListAppState();
}

class Card {
  final String? titleName;
  final String? description;
  final Color? color;
  final String? date;

  const Card({this.titleName, this.description, this.color, this.date});
}

class _ToDoListAppState extends State {
  List colors = const [
    Color.fromRGBO(250, 232, 232, 1),
    Color.fromRGBO(232, 237, 250, 1),
    Color.fromRGBO(250, 249, 232, 1),
    Color.fromRGBO(250, 232, 250, 1),
    Color.fromRGBO(250, 232, 232, 1),
  ];
  int tempIndex = 0;
  List card = [
    const Card(
      titleName: "Lorem Ipsum is simply setting industry",
      description:
          "Simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s",
      color: Color.fromRGBO(250, 232, 232, 1),
      date: "2 July 2023",
    ),
    const Card(
      titleName: "Lorem Ipsum is simply setting industry",
      description:
          "Simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s",
      color: Color.fromRGBO(232, 237, 250, 1),
      date: "2 July 2023",
    ),
    const Card(
      titleName: "Lorem Ipsum is simply setting industry",
      description:
          "Simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s",
      color: Color.fromRGBO(250, 249, 232, 1),
      date: "2 July 2023",
    ),
    const Card(
      titleName: "Lorem Ipsum is simply setting industry",
      description:
          "Simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s",
      color: Color.fromRGBO(250, 232, 250, 1),
      date: "2 July 2023",
    ),
    const Card(
      titleName: "Lorem Ipsum is simply setting industry",
      description:
          "Simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s",
      color: Color.fromRGBO(250, 232, 232, 1),
      date: "2 July 2023",
    ),
  ];

  TextEditingController title = TextEditingController();
  TextEditingController description = TextEditingController();
  TextEditingController date = TextEditingController();
/*
  Widget _textField(String? label) {
    return SizedBox(
      // height: 120,
      width: 380,
      child: TextField(
        maxLines: null,
        //key: Key("Name"),
        decoration: InputDecoration(
          labelText: label,
          hintText: label,
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              width: 2,
              color: Color.fromRGBO(0, 139, 148, 1),
            ),
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              width: 2,
              color: Color.fromRGBO(2, 167, 177, 1),
            ),
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ),
      ),
    );
  }*/

  Row _textFieldName(String name) {
    return Row(
      children: [
        Text(
          name,
          style: GoogleFonts.quicksand(
            color: const Color.fromRGBO(0, 139, 148, 1),
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w800,
            fontSize: 15,
          ),
        ),
      ],
    );
  }

  void _bottomSheet() {
    showModalBottomSheet(
        useSafeArea: true,
        context: context,
        //scrollControlDisabledMaxHeightRatio: 1.2,
        isScrollControlled: true,
        //showDragHandle: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(50.0)),
        ),
        builder: (BuildContext context) {
          return SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.only(
                  top: 10, left: 15, right: 15, bottom: 20),
              height: 450,
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 28,
                    child: Text(
                      "Create Task",
                      style: GoogleFonts.quicksand(
                        color: Colors.black,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w800,
                        fontSize: 25,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  _textFieldName("Title"),
                  // _textField("Enter Title"),
                  SizedBox(
                    // height: 120,
                    width: 380,
                    child: TextField(
                      controller: title,
                      maxLines: null,
                      //key: Key("Name"),
                      decoration: const InputDecoration(
                        labelText: "Title",
                        hintText: "Enter Title",
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 2,
                            color: Color.fromRGBO(0, 139, 148, 1),
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 2,
                            color: Color.fromRGBO(2, 167, 177, 1),
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  _textFieldName("Description"),
                  //_textField("Enter Description"),
                  SizedBox(
                    // height: 120,
                    width: 380,
                    child: TextField(
                      controller: description,
                      maxLines: null,
                      //key: Key("Name"),
                      decoration: const InputDecoration(
                        labelText: "Description",
                        hintText: "Enter Description",
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 2,
                            color: Color.fromRGBO(0, 139, 148, 1),
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 2,
                            color: Color.fromRGBO(2, 167, 177, 1),
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  _textFieldName("Date"),
                  // _textField("Enter Date"),
                  SizedBox(
                    // height: 120,
                    width: 380,
                    child: TextField(
                      controller: date,
                      maxLines: null,
                      //key: Key("Name"),
                      decoration: InputDecoration(
                        labelText: "Date",
                        hintText: "Enter Date",
                        enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 2,
                            color: Color.fromRGBO(0, 139, 148, 1),
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 2,
                            color: Color.fromRGBO(2, 167, 177, 1),
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        suffixIcon: IconButton(
                          icon: const Icon(Icons.calendar_today),
                          onPressed: () {},
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  SizedBox(
                    height: 50,
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        elevation: 12,
                        shadowColor: Colors.grey,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              8), // Adjust the border radius as needed
                        ),
                        maximumSize: const Size(380, 40),
                        backgroundColor: const Color.fromRGBO(2, 167, 177, 1),
                      ),
                      onPressed: () {
                        setState(() {
                          card.add(Card(
                            titleName: title.text,
                            description: description.text,
                            date: date.text,
                            color: colors[tempIndex++],
                          ));
                          if (tempIndex == colors.length) {
                            tempIndex = 0;
                          }
                          title.clear();
                          description.clear();
                          date.clear();

                          Navigator.pop(context);
                        });
                      },
                      child: Text(
                        "Submit",
                        style: GoogleFonts.quicksand(
                          color: Colors.white,
                          //backgroundColor: const Color.fromRGBO(2, 167, 177, 1),
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w800,
                          fontSize: 25,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: _bottomSheet,
        shape: const CircleBorder(),
        backgroundColor: const Color.fromRGBO(2, 167, 177, 1),
        child: const Icon(
          Icons.add,
          weight: 60,
          size: 50,
          color: Colors.white,
        ),
      ),
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(2, 167, 177, 1),
        title: Text(
          "To-do List",
          style: GoogleFonts.quicksand(
            color: Colors.white,
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w900,
            fontSize: 25,
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: card.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            height: 138,
            margin:
                const EdgeInsets.only(left: 15, top: 20, right: 15, bottom: 15),
            width: 330,
            padding: const EdgeInsets.only(top: 10, left: 10, right: 8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: card[index].color,
              boxShadow: const [
                BoxShadow(
                  color: Colors.grey,
                  offset: Offset(0, 10),
                  spreadRadius: 1,
                  blurRadius: 10,
                ),
              ],
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(
                          left: 10, bottom: 10, top: 15, right: 25),
                      height: 55,
                      width: 55,
                      decoration: BoxDecoration(
                        image: const DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                            "https://cdn.iconscout.com/icon/free/png-256/free-image-resize-1575087-1331422.png",
                          ),
                        ),
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(100),
                        boxShadow: const [
                          BoxShadow(
                            blurRadius: 3,
                            color: Color.fromRGBO(0, 0, 0, 0.07),
                          ),
                        ],
                      ),
                      /*child: SizedBox(
                        child: Image.network(
                          "https://cdn.iconscout.com/icon/free/png-256/free-image-resize-1575087-1331422.png",
                          fit: BoxFit.fill,
                        ),
                      ),
                      */
                    ),
                    //const SizedBox(width: 25),
                    Column(
                      //mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 253,
                          height: 16,
                          child: Text(
                            card[index].titleName,
                            style: GoogleFonts.quicksand(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                              fontSize: 13,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 13,
                        ),
                        SizedBox(
                          width: 253,
                          height: 44,
                          child: Text(
                            card[index].description,
                            style: GoogleFonts.quicksand(
                              color: const Color.fromRGBO(84, 84, 84, 1),
                              fontWeight: FontWeight.w500,
                              fontSize: 10,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const Spacer(),
                Row(
                  children: [
                    const SizedBox(
                      width: 13,
                    ),
                    SizedBox(
                      height: 20,
                      width: 65,
                      child: Text(
                        card[index].date,
                        style: GoogleFonts.quicksand(
                          fontSize: 10,
                          fontWeight: FontWeight.w700,
                          color: const Color.fromRGBO(132, 132, 132, 1),
                        ),
                      ),
                    ),
                    const Spacer(),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        size: 20,
                        Icons.edit_outlined,
                        color: Color.fromRGBO(0, 139, 148, 1),
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          card.remove(card[index]);
                        });
                      },
                      icon: const Icon(
                        size: 20,
                        Icons.delete_outline_outlined,
                        color: Color.fromRGBO(0, 139, 148, 1),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
