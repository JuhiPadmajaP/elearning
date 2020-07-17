import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:io';

void main() {
  FlutterError.onError = (FlutterErrorDetails details) {
    FlutterError.dumpErrorToConsole(details);
    if (kReleaseMode) exit(1);
  };
}

class Quiz1 {
  var questions = [
    "Choose the correct word which suits the meaning 'good'",
    "What do we study in etymology?",
    "Another word for chair (4 letters):",
  ];
  var choices = [
    ["right", 'bad', 'good', 'worst'],
    [
      'origin of words',
      'origin of plants',
      'origin of language',
      'origin of earth',
    ],
    [
      'table',
      'seat',
      'bench',
      'desk',
      'hsbs',
      'sasan',
    ],
  ];

  var correctAnswers = [
    'right',
    'origin of words',
    'seat',
  ];
}

var finalScore = 0;
var questionNumber = 1;
var quiz = new Quiz1();

// ignore: camel_case_types
class Vocabulary extends StatefulWidget {
  @override
  _VocabularyState createState() => _VocabularyState();
}

class _VocabularyState extends State<Vocabulary> {
  @override
  Widget build(BuildContext context) {
    return new WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: new AppBar(
          title: new Text('       Vocabulary Quiz'),
          backgroundColor: Colors.amber,
        ),
        body: new Container(
          margin: const EdgeInsets.all(10.0),
          alignment: Alignment.topCenter,
          child: new Column(children: <Widget>[
            new Padding(padding: EdgeInsets.all(20.0)),
            new Container(
              alignment: Alignment.centerRight,
              child: new Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  new Text(
                    "Question ${questionNumber + 1} of ${quiz.questions.length}",
                    style: new TextStyle(
                      fontSize: 22.0,
                    ),
                  ),
                  new Text(
                    "Score : $finalScore",
                    style: new TextStyle(
                      fontSize: 22.0,
                    ),
                  )
                ],
              ),
            ),
            new Padding(padding: EdgeInsets.all(10.0)),
            new Text(
              quiz.questions[questionNumber],
              style: new TextStyle(
                fontSize: 20.0,
              ),
            ),
            new Padding(padding: EdgeInsets.all(10.0)),
            new Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                new MaterialButton(
                    onPressed: () {
                      if (quiz.choices[questionNumber][0.compareTo(0)] ==
                          quiz.correctAnswers[questionNumber]) {
                        debugPrint("Correct");
                        finalScore++;
                      } else {
                        debugPrint("Wrong");
                      }
                      updateQuestion();
                    },
                    minWidth: 120.0,
                    color: Colors.blueGrey,
                    child: new Text(
                      quiz.choices[questionNumber][0.compareTo(0)],
                      style: new TextStyle(fontSize: 20.0, color: Colors.white),
                    )),
                new MaterialButton(
                    onPressed: () {
                      if (quiz.choices[questionNumber][1.compareTo(0)] ==
                          quiz.correctAnswers[questionNumber]) {
                        debugPrint("Correct");
                        finalScore++;
                      } else {
                        debugPrint("Wrong");
                      }
                      updateQuestion();
                    },
                    minWidth: 120.0,
                    color: Colors.blueGrey,
                    child: new Text(
                      quiz.choices[questionNumber][1.compareTo(0)],
                      style: new TextStyle(fontSize: 20.0, color: Colors.white),
                    )),
              ],
            ),
            new Padding(padding: EdgeInsets.all(10.0)),
            new Container(
              alignment: Alignment.bottomCenter,
              child: new MaterialButton(
                onPressed: resetQuiz,
                minWidth: 240.0,
                height: 40.0,
                child: new Text(
                  "Quit",
                  style: new TextStyle(fontSize: 18.0, color: Colors.red),
                ),
              ),
            )
          ]),
        ),
      ),
    );
  }

  void resetQuiz() {
    setState(() {
      Navigator.pop(context);
      finalScore = 0;
      questionNumber = 0;
    });
  }

  void updateQuestion() {
    setState(() {
      if (questionNumber == (quiz.questions.length - 1)) {
        Navigator.push(
            context,
            new MaterialPageRoute(
                builder: (context) => Summary(score: finalScore)));
      } else {
        questionNumber++;
      }
    });
  }
}

class Summary extends StatelessWidget {
  final int score;
  Summary({Key key, @required this.score}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: new Container(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Text(
                "Final Score: $score",
                style: TextStyle(
                  fontSize: 25.0,
                ),
              ),
              new Padding(padding: EdgeInsets.all(10.0)),
              new MaterialButton(
                color: Colors.red,
                onPressed: () {
                  questionNumber = 0;
                  finalScore = 0;
                  Navigator.pop(context);
                },
                child: new Text(
                  "Reset Quiz",
                  style: TextStyle(
                    fontSize: 20.0,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
