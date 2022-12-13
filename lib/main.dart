import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz_app/view/first_page.dart';
import 'package:quiz_app/controller/provider/Provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: ((context) => UpdatedApp()),
    child:  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Question_page(),
    ),
  ));
}
