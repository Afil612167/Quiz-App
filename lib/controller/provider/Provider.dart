// ignore_for_file: file_names, non_constant_identifier_names

import 'package:flutter/material.dart';

class UpdatedApp extends ChangeNotifier {
  bool firstButton_ = false; //for checking button
  bool secondButton_ = false;
  bool thirdButton_ = false;
  bool foruthButton_ = false;
  int buttonNO = 0; //for button function and understand button index
  int quiz_list_index = 0;
  int score = 0; //for score addign
  bool forNavigation_after_index =
      false; //after 10 question this variable true then navigate to the next index
  int tempButtonIndex = 0; //for 10 question stopping
  List checkRandomIndexRepeating = [
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9,
    10,
    11,
  ];

  void repeating() {
    checkRandomIndexRepeating.shuffle();
    tempButtonIndex = 0;
    forNavigation_after_index = false;
    score = 0;
    firstButton_ = false;
    secondButton_ = false;
    thirdButton_ = false;
    foruthButton_ = false;
    notifyListeners();
  }

  void scoreIncreasingFunction() {
    score += 1;
    notifyListeners();
  }

//for change index of  quiz list

  void quiz_list_index_increasing() {
    if (tempButtonIndex <= 1) {
      checkRandomIndexRepeating.shuffle();
    }
    checkRandomIndexRepeating.length = 11;
    if (tempButtonIndex < 9) {
      quiz_list_index = checkRandomIndexRepeating[tempButtonIndex];
      tempButtonIndex++;
    } else {
      forNavigation_after_index = true;
    }

    notifyListeners();
  }

  void checkRandomRepeatingFunction(int data) {
    checkRandomIndexRepeating.add(data);
    print(quiz_list_index);
    notifyListeners();
  }

//for A button checking

  void buttonChecking1() {
    firstButton_ = true;
    secondButton_ = false;
    thirdButton_ = false;
    foruthButton_ = false;
    buttonNO = 1;
    notifyListeners();
  }

//for B button checking

  void buttonChecking2() {
    firstButton_ = false;
    secondButton_ = true;
    thirdButton_ = false;
    foruthButton_ = false;
    buttonNO = 2;
    notifyListeners();
  }

//for C button checking

  void buttonChecking3() {
    firstButton_ = false;
    secondButton_ = false;
    thirdButton_ = true;
    foruthButton_ = false;
    buttonNO = 3;
    notifyListeners();
  }

//for D button Checking

  void buttonChecking4() {
    firstButton_ = false;
    secondButton_ = false;
    thirdButton_ = false;
    foruthButton_ = true;
    buttonNO = 4;
    notifyListeners();
  }

  void buttonChecking() {
    firstButton_ = false;
    secondButton_ = false;
    thirdButton_ = false;
    foruthButton_ = false;
    buttonNO = 0;
    notifyListeners();
  }
}
