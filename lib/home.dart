import 'package:flutter/material.dart';
import 'package:quiz/quiz2.dart';
import 'package:flutter/services.dart';
import 'dart:ui';
import 'quiz1.dart';

class AnimaQuiz extends StatefulWidget {
  @override
  _AnimaQuizState createState() => _AnimaQuizState();
}

class _AnimaQuizState extends State<AnimaQuiz> {

  @override
  Widget build(BuildContext context) {
     SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,DeviceOrientation.portraitUp
    ]);
   return new Scaffold(
     appBar: new AppBar(
        title: new Text(
          "Choose a test",
           style: TextStyle(
            // fontFamily: "Quando"
            fontSize: 22.0,
          ),
        ),
        // backgroundColor: Colors.blue,
      ),
     body: new Container(
          margin: const EdgeInsets.all(15.0),
       child: new Column(  
         crossAxisAlignment: CrossAxisAlignment.stretch,
         mainAxisAlignment: MainAxisAlignment.center,
        
        // button1 Quiz1
         children: <Widget>[
           new MaterialButton(
             height: 50.0,
               color: Colors.green,
               onPressed: startQuiz1,
               child: new Text(
                 "Quiz 1",
                 style: new TextStyle(
                     fontSize: 18.0,
                     color: Colors.white,
                 ),
                ),
                splashColor: Colors.green[700],
                highlightColor: Colors.green[700],
                minWidth: 200.0,
                 shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0)
                ),
              ),
            
              new Padding(padding: EdgeInsets.all(20.0)),
              
              // button2 Quiz2
              new MaterialButton(
                height: 50.0,
                color: Colors.green,
                onPressed: startQuiz2,
                child: new Text(
                  "Quiz 2",
                  style: new TextStyle(
                      fontSize: 18.0,
                      color: Colors.white
                 ),
                ),
                splashColor: Colors.green[700],
                highlightColor: Colors.green[700],
                minWidth: 200.0,
                 shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0)
                ),
              ),
            ],
          ),
        ),
      );
  }
    
    
  void startQuiz1(){
    setState(() {
      Navigator.push(
        context, new MaterialPageRoute(builder: (context) => new Quiz1()));
    });
  }

   void startQuiz2(){
    setState(() {
      Navigator.push(
        context, new MaterialPageRoute(builder: (context) => new Quiz2()));
    });
  }
}





// class AnimalQuiz extends StatefulWidget{
//   @override
//   State<StatefulWidget> createState() {
//    return new AnimalQuizState();
//   }
// }

// class AnimalQuizState extends State<AnimalQuiz>{
//   @override
//   Widget build(BuildContext context) {
//    return new Scaffold(
//      appBar: new AppBar(
//         title: new Text(
//           "Multiple Choice Quiz"
//         ),
//         backgroundColor: Colors.blue,
//       ),

//      body: new Container(
//           margin: const EdgeInsets.all(15.0),
//        child: new Column(  
//          crossAxisAlignment: CrossAxisAlignment.stretch,
//          mainAxisAlignment: MainAxisAlignment.center,
//          children: <Widget>[
//            new MaterialButton(
//              height: 50.0,
//                color: Colors.green,
//                onPressed: startQuiz,
//                child: new Text(
//                  "Quiz 1",
//                  style: new TextStyle(
//                      fontSize: 18.0,
//                      color: Colors.white
//                  ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       );
//     }

//   void startQuiz(){
//     setState(() {
//       Navigator.push(
//         context, new MaterialPageRoute(
//         builder: (context) => new Quiz1()));
//     });
//   }
// }