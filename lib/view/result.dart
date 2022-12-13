// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
// import 'first_page.dart';
import 'package:quiz_app/view/first_page.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:quiz_app/controller/provider/Provider.dart';

// ignore: camel_case_types
class Result_page extends StatefulWidget {
  const Result_page({super.key});

  @override
  State<Result_page> createState() => _Result_pageState();
}

// ignore: camel_case_types
class _Result_pageState extends State<Result_page> {
  @override
  Widget build(BuildContext context) {
    UpdatedApp secondProvider = Provider.of<UpdatedApp>(context);
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            shadowColor: Colors.white,
            leading: IconButton(
              onPressed: () {
                secondProvider.repeating();
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Question_page()));
              },
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.black,
              ),
            ),
            title: const Text(
              "Result",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                  fontSize: 20),
            ),
            centerTitle: true,
          ),
          body: Stack(
            children: [
              secondProvider.score <= 4
                  ? SizedBox(
                      height: 450,
                      width: 450,
                      child: Padding(
                          padding: const EdgeInsets.only(top: 200),
                          child: Lottie.network(
                              'https://assets5.lottiefiles.com/packages/lf20_9xRnlw.json')),
                    )
                  : SizedBox(
                      height: 450,
                      width: 450,
                      child: Padding(
                          padding: const EdgeInsets.only(top: 200),
                          child: Lottie.network(
                              'https://assets7.lottiefiles.com/packages/lf20_nxsyeqbd.json')),
                    ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 21),
                    child: Center(
                      child: SizedBox(
                        height: 151,
                        width: 151,
                        child: CircularPercentIndicator(
                          radius: 75.0,
                          lineWidth: 16,
                          percent: secondProvider.score / 10,
                          center: Text("${secondProvider.score}/10"),
                          progressColor: secondProvider.score <=4
                              ?const  Color(0xFFFF6E07)
                              : Colors.green,
                          circularStrokeCap: CircularStrokeCap.round,
                          animation: true,
                        ),
                      ),
                    ),
                  ),
                  secondProvider.score <=4
                      ? Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 298.67, bottom: 23),
                              child: Container(
                                height: 40,
                                width: 160,
                                decoration: BoxDecoration(
                                    color: const Color(0xFFFF6E07),
                                    borderRadius: BorderRadius.circular(15)),
                                child: const Center(
                                    child: Text(
                                  "Oops !",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w800,
                                      fontSize: 15),
                                )),
                              ),
                            ),
                            Center(
                                child: SizedBox(
                              height: 34,
                              width: 147,
                              child: TextButton(
                                  onPressed: () {
                                    secondProvider.repeating();
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              Question_page()),
                                    );
                                  },
                                  child: const Text(
                                    "Try Again.",
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w700),
                                  )),
                            )),
                          ],
                        )
                      : Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 300.67, bottom: 23),
                              child: SizedBox(
                                height: 44,
                                width: 160,
                                child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(15)),
                                        // backgroundColor: const Color(0xfff52ba00),
                                        backgroundColor: Colors.green,
                                        shadowColor: Colors.black,
                                        elevation: 5),
                                    onPressed: () {
                                      secondProvider.repeating();
                                      Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                Question_page()),
                                      );
                                    },
                                    child: const Text(
                                      "Awesome!",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w700),
                                    )),
                              ),
                            ),
                            const Center(
                              child: SizedBox(
                                  height: 34,
                                  width: 147,
                                  child: Text(
                                    "     Congratulations\nYou Passed the exam",
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w700),
                                  )),
                            ),
                          ],
                        ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
