import 'package:flutter/material.dart';

class QuizApp extends StatefulWidget {
  const QuizApp({super.key});

  @override
  State createState() => _QuizAppState();
}

class _QuizAppState extends State {
  bool questionPage = true;
  int selectedQuestionIndex = 0;
  int selectedOptionIndex = -1;
  int correctQuestion = 0;

  List<Map> allQuestions = [
    {
      "question": "Who is the founder of Microsoft?",
      "options": ["Steve Jobs", "Elon Musk", "Bill Gates", "Jeff Bezos"],
      "answer": 2,
    },
    {
      "question": "Who is the founder of Apple?",
      "options": ["Steve Jobs", "Elon Musk", "Bill Gates", "Jeff Bezos"],
      "answer": 0,
    },
    {
      "question": "Who is the founder of Amezon?",
      "options": ["Steve Jobs", "Elon Musk", "Bill Gates", "Jeff Bezos"],
      "answer": 3,
    },
    {
      "question": "Who is the founder of Tesla?",
      "options": ["Steve Jobs", "Elon Musk", "Bill Gates", "Jeff Bezos"],
      "answer": 1,
    },
    {
      "question": "Who is the founder of Google?",
      "options": ["Steve Jobs", "Lary Page", "Bill Gates", "Jeff Bezos"],
      "answer": 1,
    },
  ];

  MaterialStateProperty<Color>? _optionColor(int btnIndex) {
    if (selectedOptionIndex != -1) {
      if (btnIndex == allQuestions[selectedQuestionIndex]["answer"]) {
        correctQuestion++;
        return const MaterialStatePropertyAll(Colors.green);
      } else if (selectedOptionIndex == btnIndex) {
        correctQuestion--;
        return const MaterialStatePropertyAll(Colors.red);
      }
    }
    return const MaterialStatePropertyAll(Colors.white);
  }

  ElevatedButton _button(int btnIndex) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: _optionColor(btnIndex),
      ),
      onPressed: () {
        if (selectedOptionIndex == -1) {
          setState(() {
            selectedOptionIndex = btnIndex;
          });
        }
      },
      child: Text(
        "${allQuestions[selectedQuestionIndex]["options"][btnIndex]}",
        style: const TextStyle(
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.w600,
          fontSize: 18,
          color: Color.fromARGB(255, 5, 5, 5),
        ),
      ),
    );
  }

  Scaffold _scaffoldPages() {
    return questionPage
        ? Scaffold(
            appBar: AppBar(
              centerTitle: true,
              backgroundColor: Colors.deepOrange,
              title: const Text(
                "QuizApp",
                style: TextStyle(
                  fontSize: 34,
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w800,
                  color: Colors.white,
                ),
              ),
            ),
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    const Text(
                      "Question : ",
                      style: TextStyle(
                        fontSize: 25,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      "${selectedQuestionIndex + 1} / ${allQuestions.length}",
                      style: const TextStyle(
                        fontSize: 25,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Text(
                      "Score : ",
                      style: TextStyle(
                        fontSize: 25,
                        color: Colors.green,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      "${correctQuestion * 2} / ${allQuestions.length * 2}",
                      style: const TextStyle(
                        fontSize: 25,
                        color: Colors.green,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                const Text(
                  "- - - - - - - - - - - - - - - - - - - - - - - - ",
                  style: TextStyle(
                    color: Colors.deepOrange,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.normal,
                  ),
                ),
                Text(
                  "${allQuestions[selectedQuestionIndex]["question"]}",
                  style: const TextStyle(
                    color: Colors.deepPurple,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.normal,
                  ),
                ),
                const SizedBox(height: 30),
                SizedBox(
                  height: 50,
                  width: 380,
                  child: _button(0),
                ),
                const SizedBox(height: 30),
                SizedBox(
                  height: 50,
                  width: 380,
                  child: _button(1),
                ),
                const SizedBox(height: 30),
                SizedBox(
                  height: 50,
                  width: 380,
                  child: _button(2),
                ),
                const SizedBox(height: 30),
                SizedBox(
                  height: 50,
                  width: 380,
                  child: _button(3),
                ),
              ],
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                if (selectedOptionIndex != -1) {
                  selectedQuestionIndex++;
                  selectedOptionIndex = -1;
                  if (selectedQuestionIndex == allQuestions.length) {
                    questionPage = false;
                  }
                  setState(() {});
                }
              },
              backgroundColor: Colors.deepOrange,
              child: const Icon(
                Icons.forward,
                color: Colors.white,
              ),
            ),
          )
        : Scaffold(
            appBar: AppBar(
              centerTitle: true,
              backgroundColor: Colors.deepOrange,
              title: const Text(
                "QuizApp",
                style: TextStyle(
                  fontSize: 34,
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w800,
                  color: Colors.white,
                ),
              ),
            ),
            body: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 50),
                  SizedBox(
                    height: 300,
                    width: 380,
                    child: Image.network(
                      "https://img.freepik.com/premium-vector/winner-trophy-cup-with-ribbon-confetti_51486-122.jpg",
                      fit: BoxFit.fill,
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "Congratulations!!!",
                    style: TextStyle(
                      fontSize: 35,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w800,
                      color: Colors.green,
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "You Have Successfully Completed The Quiz.",
                    style: TextStyle(
                      fontSize: 15,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w800,
                      color: Colors.red,
                    ),
                  ),
                  const SizedBox(height: 30),
                  Text(
                    "Score : ${correctQuestion * 2} / ${allQuestions.length * 2}",
                    style: const TextStyle(
                      fontSize: 35,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w800,
                      color: Colors.green,
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  SizedBox(
                    height: 50,
                    width: 200,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepOrange,
                      ),
                      onPressed: () {
                        questionPage = true;
                        selectedOptionIndex = -1;
                        selectedQuestionIndex = 0;
                        correctQuestion = 0;
                        setState(() {});
                      },
                      child: const Text(
                        "Restart",
                        style: TextStyle(
                          fontSize: 25,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
  }

  @override
  Widget build(BuildContext context) {
    return _scaffoldPages();
  }
}
