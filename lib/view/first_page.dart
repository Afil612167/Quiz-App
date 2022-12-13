// ignore_for_file: must_be_immutable, non_constant_identifier_names

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz_app/view/result.dart';
import 'package:quiz_app/model/modelCalss.dart';
import 'package:quiz_app/controller/provider/Provider.dart';
import 'package:http/http.dart' as http;

// ignore: camel_case_types
class Question_page extends StatelessWidget {
  Question_page({super.key});
  List<QuizQuestions> questionList = [];

// var list = ['a','b','c','d','e'];

// generates a new Random object

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Consumer<UpdatedApp>(builder: (context, firstProivder, child) {
        return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: Colors.white,
              elevation: 0,
              shadowColor: Colors.white,
              leading: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                ),
              ),
              title: const Text(
                "Quiz",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                    fontSize: 20),
              ),
              centerTitle: true,
            ),
            body: FutureBuilder(
                future: getData(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    
                    return ListView.builder(
                      itemCount: 1,
                      itemBuilder: (context,index) {
                        
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                const SizedBox(
                                  width: 35,
                                ),
                                Container(
                                  height: 35.8,
                                  width: 68,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                      boxShadow: const [
                                        BoxShadow(
                                            color: Colors.black12,
                                            blurRadius: 2,
                                            offset: Offset(0, 7))
                                      ]),
                                  child: Center(
                                    child: Text(
                                      '${firstProivder.tempButtonIndex + 1}/10',
                                      style: const TextStyle(
                                          color: Color(0xFF212121),
                                          fontWeight: FontWeight.w700,
                                          fontSize: 15),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 17 + 17.92,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(
                                  width: 35,
                                ),
                                SizedBox(
                                  height: 53,
                                  width: 233,
                                  child: Text(
                                    questionList[0]
                                        .questions[firstProivder.quiz_list_index]
                                        .question,
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 15),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                            const Divider(
                              height: 10,
                              thickness: 1.2,
                              indent: 25,
                              endIndent: 7,
                              color: Color(0xFFC9C9C9),
                            ),
                            const SizedBox(
                              height: 27,
                            ),
                            Center(
                              child: Container(
                                height: 39,
                                width: 39,
                                decoration: const BoxDecoration(boxShadow: [
                                  BoxShadow(
                                      color: Colors.black12,
                                      blurRadius: 2,
                                      offset: Offset(0, 4))
                                ], shape: BoxShape.circle, color: Colors.white),
                                child: const Icon(Icons.question_mark_outlined),
                              ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            const SizedBox(
                              height: 23,
                              width: 128,
                              child: Text(
                                "Choose an answer",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w700,
                                    color: Color(0xFF656363)),
                              ),
                            ),
                            const SizedBox(
                              height: 17,
                            ),

                            //Option Buttons are in the method

                            Option_buttons(firstProivder),
                            const SizedBox(
                              height: 26,
                            ),

                            //Next button

                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(
                                  width: 258,
                                ),
                                SizedBox(
                                  width: 89 + 2,
                                  height: 45,
                                  child: firstProivder.buttonNO > 0
                                      ? ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(10)),
                                              backgroundColor: Colors.white,
                                              shadowColor: Colors.black,
                                              elevation: 5),
                                          onPressed: () {

                                            
                                            firstProivder.checkRandomRepeatingFunction(firstProivder.quiz_list_index);
                                            (firstProivder
                                                    .checkRandomIndexRepeating[
                                                firstProivder.tempButtonIndex]);
                                            if (firstProivder.buttonNO ==
                                                questionList[0]
                                                        .questions[firstProivder
                                                            .quiz_list_index]
                                                        .correctIndex +
                                                    1) {
                                              firstProivder
                                                  .scoreIncreasingFunction();
                                            }
                                            firstProivder
                                                .quiz_list_index_increasing();
                                            firstProivder.buttonChecking();

                                            if (firstProivder
                                                    .forNavigation_after_index ==
                                                true) {
                                              Navigator.pushReplacement(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          const Result_page()));
                                            }
                                          },
                                          child: Row(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: const [
                                              Text(
                                                "Next",
                                                style: TextStyle(
                                                    color: Color(0xFF4282F1),
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.w700),
                                              ),
                                              SizedBox(
                                                width: 3,
                                              ),
                                              SizedBox(
                                                  height: 24,
                                                  width: 24,
                                                  child: Icon(
                                                    Icons.arrow_forward_outlined,
                                                    color: Color(0xFF4282F1),
                                                  ))
                                            ],
                                          ))
                                      : const SizedBox(),
                                ),
                              ],
                            )
                          ],
                        );
                      }
                    );
                  } else if (snapshot.hasError) {
                    return const Center(child: Text("Error"));
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                }));
      }),
    );
  }

  Column Option_buttons(UpdatedApp firstProivder) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        //A Option button

        SizedBox(
          height: 45,
          width: 322,
          child: ElevatedButton(
            style: ButtonStyle(
                backgroundColor: MaterialStateColor.resolveWith((states) =>
                    firstProivder.firstButton_ ? Colors.black : Colors.blue),
                shape: MaterialStatePropertyAll<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)))),
            onPressed: () {
              firstProivder.buttonChecking1();
              // firstProivder.checkwhichOptionButtonIsPressed_A();
            },
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "A.",
                  style: TextStyle(
                      color: Color(0xFFD4D4D4),
                      fontWeight: FontWeight.w700,
                      fontSize: 15),
                ),
                const SizedBox(
                  width: 31,
                ),
                Text(
                  questionList[0]
                      .questions[firstProivder.quiz_list_index]
                      .answers[0],
                  style: const TextStyle(
                      color: Color(0xFFFFF8FF),
                      fontWeight: FontWeight.w800,
                      fontSize: 15),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 17,
        ),

        //B option button

        SizedBox(
          height: 45,
          width: 322,
          child: ElevatedButton(
            style: ButtonStyle(
                backgroundColor: MaterialStateColor.resolveWith((states) =>
                    firstProivder.secondButton_ ? Colors.black : Colors.blue),
                shape: MaterialStatePropertyAll<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)))),
            onPressed: () {
              firstProivder.buttonChecking2();
              // firstProivder.checkwhichOptionButtonIsPressed_B();
            },
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "B.",
                  style: TextStyle(
                      color: Color(0xFFFFF8FF),
                      fontWeight: FontWeight.w700,
                      fontSize: 15),
                ),
                const SizedBox(
                  width: 31,
                ),
                Text(
                  questionList[0]
                      .questions[firstProivder.quiz_list_index]
                      .answers[1]
                      .toString(),
                  style: const TextStyle(
                      color: Color(0xFFFFF8FF),
                      fontWeight: FontWeight.w800,
                      fontSize: 15),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 17,
        ),

        //C option button

        SizedBox(
          height: 45,
          width: 322,
          child: ElevatedButton(
            style: ButtonStyle(
                backgroundColor: MaterialStateColor.resolveWith((states) =>
                    firstProivder.thirdButton_ ? Colors.black : Colors.blue),
                shape: MaterialStatePropertyAll<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)))),
            onPressed: () {
              // firstProivder.checkwhichOptionButtonIsPressed_C();
              firstProivder.buttonChecking3();
            },
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "C.",
                  style: TextStyle(
                      color: Color(0xFFFFF8FF),
                      fontWeight: FontWeight.w700,
                      fontSize: 15),
                ),
                const SizedBox(
                  width: 31,
                ),
                Text(
                  questionList[0]
                      .questions[firstProivder.quiz_list_index]
                      .answers[2],
                  style: const TextStyle(
                      color: Color(0xFFFFF8FF),
                      fontWeight: FontWeight.w800,
                      fontSize: 15),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 17,
        ),

        //D option Button

        SizedBox(
          height: 45,
          width: 322,
          child: ElevatedButton(
            style: ButtonStyle(
                backgroundColor: MaterialStateColor.resolveWith((states) =>
                    firstProivder.foruthButton_ ? Colors.black : Colors.blue),
                shape: MaterialStatePropertyAll<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)))),
            onPressed: () {
              // firstProivder.checkwhichOptionButtonIsPressed_D();
              firstProivder.buttonChecking4();
            },
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "D.",
                  style: TextStyle(
                      color: Color(0xFFD4D4D4),
                      fontWeight: FontWeight.w700,
                      fontSize: 15),
                ),
                const SizedBox(
                  width: 31,
                ),
                Text(
                  questionList[0]
                      .questions[firstProivder.quiz_list_index]
                      .answers[3],
                  style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w800,
                      fontSize: 15),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Future<List<QuizQuestions>> getData() async {
    final Response = await http
        .get(Uri.parse('https://637dbfffcfdbfd9a639bba1e.mockapi.io/sample'));
    var data = jsonDecode(Response.body.toString());
    if (Response.statusCode == 200) {
      for (Map<String, dynamic> index in data) {
        questionList.add(QuizQuestions.fromJson(index));
      }
    }
    return questionList;
  }
}
