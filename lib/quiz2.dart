import 'package:flutter/material.dart';
import 'package:quiz/home.dart';

var finalScore = 0;
// var scores = 0;
var questionNumber = 0;
var quiz = new AnimalQuiz();

class AnimalQuiz{
  var images = [
     "car","glasses","hornspeaker","mobilephone","notebook","pen","pencil","train","umbrella","backpack"
  ];


  var questions = [
    "1.What is this?.",
    "2.What is this?.",
    "3.What is this?.",
    "4.What is this?.",
    "5.What is this?.",
    "6.What is this?.",
    "7.What is this?.",
    "8.What is this?.",
    "9.What is this?.",
    "10.What is this?.",
  ];


  var choices = [
    ["car", "glasses", "hornspeaker", "mobilephone"],
    ["glasse", "glase", "glasses", "glas"],
    ["horn", "ker", "hornspeaker", "speaker"],
    ["mobile", "phone", "phonemobile", "mobilephone"],
    ["booknote", "notebookbook", "notepan", "notebook"],
    ["pen", "pan", "pun", "pon"],
    ["pancil", "puncil", "poncil", "pencil"],
    ["trains", "train", "training", "traines"],
    ["umbrellas", "umbrellaes", "umbrella", "umbrellaing"],
    ["backpuck", "backpeck", "backpack", "backpacks"],

  ];


  var correctAnswers = [
     "car","glasses","hornspeaker","mobilephone","notebook","pen","pencil","train","umbrella","backpack"
  ];
}


class Quiz2 extends StatefulWidget {
  @override
  _Quiz2State createState() => _Quiz2State();
}

class _Quiz2State extends State<Quiz2> {

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
                          // colortoshow = rigth;
                          debugPrint("Correct");
                          finalScore++;
                          print("Score = ${finalScore}");
                        }else{
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
                          // colortoshow = rigth;
                          finalScore++;
                          debugPrint("Correct");
                          print("Score = ${finalScore}");
                        }else{
                          debugPrint("Wrong");
                          // colortoshow = wrong;
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
                          debugPrint("Correct");
                          finalScore++;
                          print("Score = ${finalScore}");
                        }else{
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
                          // colortoshow = rigth;
                          debugPrint("Correct");
                          finalScore++;
                          print("Score = ${finalScore}");
                        }else{
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
      }else{
        questionNumber++;
      }
    });
    // Timer(Duration(seconds: 1), nextqusetion);
  }
}
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
             new Text("You Scred : ${score}",
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