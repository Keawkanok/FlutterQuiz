import 'package:flutter/material.dart';
import 'package:quiz/home.dart';
import 'package:quiz/resultpage.dart';
import 'dart:async'; // Timer
import 'dart:convert';


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
  
//  List<String> images = [
//     "images/success.jpg",
//     "images/good.jpg",
//     "images/bad.jpg",
//   ];




//  @override
//   void initState(){
//     if (this.score < 5) {
//       image = images[2];
//       message = "You Did Very Hard..\n" + "You Scred ${this.score}";
//       print("${score}");
//     }else if(this.score < 10){
//       image = images[1];
//       message = "You Did Very Better..\n" + "You Scred ${this.score}";
//       print("${this.score}");
//     }else{
//       image = images[0];
//       message = "You Did Very Well..\n" + "You Scred ${this.score}";
//       print("${this.score}");
//     }
//     super.initState();
//   }
 
 
  


  //  void checkanswer(String Answer){
  //   // if(mydatas[2]["1"] == mydatas[1]["1"][Answer]){
  //   //   marks = marks + 5;
  //   //   print(marks);
  //   //   colortoshow = rigth;
  //   // }else{
  //   //   colortoshow = wrong;
  //   // }
  //   setState(() {
  //     // btnColors[Answer] = colortoshow;
  //     canceltimer = true;
  //   });
  //   Timer(Duration(seconds: 2), nextqusetion);
  // }

  //  Widget choicebutton(String Answer){
  //    return Padding(
  //      padding: EdgeInsets.symmetric(
  //       // vertical: 10.0,
  //       // horizontal: 20.0,
  //     ),
  //     child: MaterialButton(
  //        onPressed: () => checkanswer(Answer),
  //     ),
  //   );
  //  }

  @override
  Widget build(BuildContext context) {
    return new WillPopScope(
        onWillPop: (){
          return showDialog(context: context,builder: (context) => AlertDialog(
            title: Text(
              "Quiz",
            ),
            content: Text(
              "You Can't Go Back At This Stage."
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
                      new Padding(padding: EdgeInsets.all(10.0)),

      
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
                new Image.asset(
                  "images/${quiz.images[questionNumber]}.jpg",
                  height: 220.0,
                  width: 240.0,
                ),
                
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




  // void resetQuiz(){
  //   setState(() {
  //     Navigator.of(context).pop(); 
  //     finalScore = 0;
  //     questionNumber = 0;
  //   });
  // }

//  void starttimer() async {
//     const onesec = Duration(seconds: 1);
//     Timer.periodic(onesec, (Timer time) { 
//       setState(() {
//         if(timer < 1){
//           time.cancel();
//           nextqusetion();
//         }else if(canceltimer == true){
//           time.cancel();
//         }else{
//           timer = timer - 1;
//         }
//         showtimer = timer.toString();
//       });
//     });
//   }
  
//  void nextqusetion(){
//     canceltimer = false;
//     timer = 30;
//     setState(() {
//       if(finalScore < 1){
//         finalScore++;
//       }else{
//         // Navigator.of(context).pushReplacement(MaterialPageRoute(
//         //   builder: (context) => resultpage(),
//         // ));
//       }
      
//     });
//     starttimer();
//   }

  void q(){
    if(quiz.questions.length - 1 == quiz.questions.length - 1){
      //  canceltimer = true;
      //  print(canceltimer);
    }
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
    // Timer(Duration(seconds: 1), nextqusetion);
  }
}

// Result
class Summary extends StatelessWidget{
  final int score;
  Summary({Key key, @required this.score}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      // onWillPop: () async => false,
      // child: Scaffold(
        appBar: AppBar(
        title: Text(
          "Result"
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
    );
  }


}