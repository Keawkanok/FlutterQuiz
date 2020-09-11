import 'package:flutter/material.dart';
import 'package:quiz/home.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      // home: MyHomePage(title: 'Flutter Demo Home Page'),
      home: AnimaQuiz(),
    ); 
  }
}


