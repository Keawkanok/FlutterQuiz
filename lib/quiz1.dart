import 'package:flutter/material.dart';
import 'package:quiz/home.dart';
import 'package:flutter/services.dart';

// import 'package:quiz/resultpage.dart';
// import 'dart:async'; // Timer
// import 'dart:convert';


var finalScore = 0;
// var scores = 0;
var questionNumber = 0;
var quiz = new AnimalQuiz();
String message;
String image;

class AnimalQuiz{
  var images = [
     "cat","crocodile","dog","elephant","giraffe","lion","monkey","snake","tiger","zebra"
  ];


  var questions = [
    "1.What animal is this picture?.",
    "2.What animal is this picture?.",
    "3.What animal is this picture?.",
    "4.What animal is this picture?.",
    "5.What animal is this picture?.",
    "6.What animal is this picture?.",
    "7.What animal is this picture?.",
    "8.What animal is this picture?.",
    "9.What animal is this picture?.",
    "10.What animal is this picture?.",
  ];


  var choices = [
    ["cat", "sheep", "alligator", "cow"],
    ["cat", "crocodile", "slug", "horse"],
    ["mouse", "dog", "elephant", "donkey"],
    ["spider", "dog", "elephant", "owl"],
    ["spider", "snake", "giraffe", "owl"],
    ["spider", "snake", "lion", "owl"],
    ["spider", "snake", "monkey", "owl"],
    ["spider", "snake", "hawk", "owl"],
    ["spider", "snake", "tiger", "owl"],
    ["spider", "snake", "zebra", "owl"],

  ];


  var correctAnswers = [
    "cat","crocodile","dog","elephant","giraffe","lion","monkey","snake","tiger","zebra"
  ];
}

class Quiz1 extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return new Quiz1State();
  }
}

class Quiz1State extends State<Quiz1> {

  Color colortoshow = Colors.indigoAccent;
  Color rigth = Colors.green;
  Color wrong = Colors.red;
  // int finalScore = 0;
  // int timer = 30;
  // String showtimer = "30";
  // bool canceltimer = false;
  // int score;
  // String message;
  // String image;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,DeviceOrientation.portraitUp
    ]);
    return new WillPopScope(
        onWillPop: (){
          return showDialog(context: context,builder: (context) => AlertDialog(
            title: Text(
              "Quiz",
            ),
            content: Text(
              "You can't go back to this step."
            ),
              actions: <Widget>[
              FlatButton(
                onPressed: (){
                    Navigator.of(context).pop();
                },
                child: Text(
                  "OK",
                ),
              ),
            ],
            ));
        },
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              "Quiz Test",
            ),
          ),
          body: new Container(
            margin: const EdgeInsets.all(10.0),
            alignment: Alignment.topCenter,
            child: new Column(
              children: <Widget>[
                new Padding(padding: EdgeInsets.all(20.0)),

                new Container(
                  alignment: Alignment.centerRight,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      // new Padding(padding: EdgeInsets.all(10.0)),
                    Expanded(
                      flex: 8,
                      child: Material(
                        // elevation: 5.0,
                        child: Container(
                          child: Column(
                            children: <Widget>[
                              Material(
                                child: Container(
                                  width: 300.0,
                                  height: 200.0,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(15.0),
                                    child: Container(
                                    child: Align(
                                      alignment: Alignment.center,
                                        widthFactor: 0.75,
                                        heightFactor: 0.75,
                                      child: Image(
                                      image: AssetImage(
                                        "images/${quiz.images[questionNumber]}.jpg",
                                      ),
                                    ),
                                  ),
                                ),),),
                              ),
                              Padding(
                              padding: EdgeInsets.symmetric(
                                vertical: 5.0,
                                horizontal: 15.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                      // new Text("${quiz.questions.length}",
                      //   // style: new TextStyle(
                      //   //     fontSize: 22.0
                      //   //   ),
                      //   ),

                      // new Text("Score: $finalScore",
                      //   style: new TextStyle(
                      //       fontSize: 22.0
                      //   ),
                      //   )
                      
                    ],
                  ),
                ),
             
                //image
                // new Image.asset(
                //   "images/${quiz.images[questionNumber]}.jpg",
                //   height: 220.0,
                //   width: 240.0,
                // ),
                
                
                new Padding(padding: EdgeInsets.all(15.0)),

                new Text(quiz.questions[questionNumber],
                  style: new TextStyle(
                    fontSize: 20.0,
                  ),
                ),

                new Padding(padding: EdgeInsets.all(15.0)),
                
                new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[

                    //button 1
                    new MaterialButton(
                      minWidth: 120.0,
                      color: Colors.indigoAccent,
                      onPressed: (){
                        if(quiz.choices[questionNumber][0] == quiz.correctAnswers[questionNumber]){
                          colortoshow = rigth;
                          debugPrint("Correct");
                          finalScore++;
                          print("Score = ${finalScore}");
                        }else{
                          colortoshow = wrong;
                          debugPrint("Wrong");
                        }
                        updateQuestion();
                      },
                      child: new Text(quiz.choices[questionNumber][0],
                        style: new TextStyle(
                            fontSize: 20.0,
                            color: Colors.white
                        ),
                      ),
                      splashColor: Colors.indigo[800],
                      highlightColor: Colors.indigo[800],
                       shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),

                    //button 2
                    new MaterialButton(
                      minWidth: 120.0,
                      color: Colors.indigoAccent,
                      onPressed: (){
                        if(quiz.choices[questionNumber][1] == quiz.correctAnswers[questionNumber]){
                          colortoshow = rigth;
                          finalScore++;
                          debugPrint("Correct");
                          print("Score = ${finalScore}");
                        }else{
                          colortoshow = wrong;
                          debugPrint("Wrong");
                        }
                        updateQuestion();
                      },
                      child: new Text(quiz.choices[questionNumber][1],
                        style: new TextStyle(
                            fontSize: 20.0,
                            color: Colors.white
                        ),
                      ),
                      splashColor: Colors.indigo[800],
                      highlightColor: Colors.indigo[800],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                  ],
                ),

                new Padding(padding: EdgeInsets.all(10.0)),

                new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[

                    //button 3
                    new MaterialButton(
                      minWidth: 120.0,
                      color: Colors.indigoAccent,
                      onPressed: (){
                        if(quiz.choices[questionNumber][2] == quiz.correctAnswers[questionNumber]){
                          colortoshow = rigth;
                          debugPrint("Correct");
                          finalScore++;
                          print("Score = ${finalScore}");
                        }else{
                          colortoshow = wrong;
                          debugPrint("Wrong");
                        }
                        updateQuestion();
                      },
                      child: new Text(quiz.choices[questionNumber][2],
                        style: new TextStyle(
                            fontSize: 20.0,
                            color: Colors.white
                        ),
                      ),
                      splashColor: Colors.indigo[800],
                      highlightColor: Colors.indigo[800],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),

                    //button 4
                    new MaterialButton(
                      minWidth: 120.0,
                      color: Colors.indigoAccent,
                      onPressed: (){
                        if(quiz.choices[questionNumber][3] == quiz.correctAnswers[questionNumber]){
                          colortoshow = rigth;
                          debugPrint("Correct");
                          finalScore++;
                          print("Score = ${finalScore}");
                        }else{
                          colortoshow = wrong;
                          debugPrint("Wrong");
                        }
                        updateQuestion();
                      },
                      child: new Text(quiz.choices[questionNumber][3],
                        style: new TextStyle(
                            fontSize: 20.0,
                            color: Colors.white
                        ),
                      ),
                      splashColor: Colors.indigo[800],
                      highlightColor: Colors.indigo[800],
                       shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                  ],
                ),

                  new Padding(padding: EdgeInsets.all(35.0)),

                //   new Text(
                //       showtimer,
                //   style: new TextStyle(
                //     fontSize: 30.0,
                //     fontWeight: FontWeight.w700,
                //   ),
                // ),

                // new Container(
                //   alignment: Alignment.bottomCenter,
                //   child:  new MaterialButton(
                //       minWidth: 240.0,
                //       height: 30.0,
                //       color: Colors.red,
                //       onPressed: resetQuiz,
                //       child: new Text(
                //         "Quit",
                //         style: new TextStyle(
                //             fontSize: 18.0,
                //             color: Colors.white
                //         ),),
                //   ),
                // ),

              ],
            ),
          ),
      )
    );
    
  }
  void updateQuestion(){
    setState(() {
      if(questionNumber == quiz.questions.length - 1){
        Navigator.push(context, new MaterialPageRoute(builder: (context)=> new Summary(score: finalScore)));
        print("Score all = ${finalScore}");
      }else{
        questionNumber++;
      }
    });
  }
}

// Result
class Summary extends StatelessWidget{
  final int score;
  Summary({Key key, @required this.score}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,DeviceOrientation.portraitUp
    ]);
    return new WillPopScope(
      onWillPop: (){
         return showDialog(context: context,builder: (context) => AlertDialog(
            title: Text("Quiz",),
            content: Text(
              "You can't return to the quiz page."
            ),
            // leading: new Container(),
              actions: <Widget>[
              FlatButton(
                onPressed: (){
                    questionNumber = 0;
                    finalScore = 0;
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => new AnimaQuiz(),));
                },
                child: Text(
                  "OK",
                ),
              ),
            ],
        ));
      },
       child: Scaffold(
          appBar: AppBar(
          // automaticallyImplyLeading: false,
            title: Text(
              "Result",
            ),
          ),
        body: new Column(
          // child: new Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
              flex: 6,
              child: Material(
                child: Container(
                  child: ClipRect(
                    child: Image(
                      image: AssetImage(
                        "images/good.jpg",
                      ),
                    ),
                  ),
                ),
              ),
              ),
             new Text(
                 "You Scred : ${score}",
                style: new TextStyle(
                    fontSize: 18.0
              ),
            ),
            Expanded(
              flex: 4,
              child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                OutlineButton(
                  onPressed: (){
                      questionNumber = 0;
                      finalScore = 0;
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => new AnimaQuiz(),));
                  },
                    child: Text(
                      "Continue",
                      style: TextStyle(
                        fontSize: 18.0,
                    ),
                  ),
                   padding: EdgeInsets.symmetric(
                    vertical: 10.0,
                    horizontal: 25.0,
              ),
                borderSide: BorderSide(width: 5.0, color: Colors.indigoAccent),
                splashColor: Colors.indigoAccent,
                ),
              ],
            ),
            ),
              // new Text("Final Score: $score",
              //   style: new TextStyle(
              //       fontSize: 35.0
              //   ),),

              // new Padding(padding: EdgeInsets.all(30.0)),

              // new MaterialButton(
              //   color: Colors.red,
              //   onPressed: (){
              //     questionNumber = 0;
              //     finalScore = 0;
              //     Navigator.pop(context);
              //   },
              //   child: new Text(
              //     "Reset Quiz",
              //     style: new TextStyle(
              //         fontSize: 20.0,
              //         color: Colors.white
                      
              //     ),
              //   ),
              //   ),

            ],
          // ),
        ),
      // ),
    ));
  }
}