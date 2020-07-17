import 'package:flutter/material.dart';
import 'quizpage1.dart';

import 'models/vocabulary.dart';

class CardsDetails extends StatefulWidget {
  final Cards selectedCards;
  CardsDetails({this.selectedCards});
  @override
  _CardsDetailsState createState() => _CardsDetailsState();
}

class _CardsDetailsState extends State<CardsDetails> {
  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        body: Stack(children: <Widget>[
      Container(
          height: screenHeight, width: screenWidth, color: Colors.transparent),
      Container(
        height: screenHeight / 3,
        width: screenWidth,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(widget.selectedCards.cardPic),
                fit: BoxFit.cover)),
      ),
      Positioned(
          top: screenHeight / 3 - 40.0,
          child: Container(
              padding: EdgeInsets.only(left: 20.0),
              height: screenHeight / 3 + 25.0,
              width: screenWidth,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 25.0),
                    Text(
                      widget.selectedCards.cardName,
                      style: new TextStyle(
                        fontStyle: FontStyle.italic,
                        fontSize: 20.0,
                        color: Colors.black,
                      ),
                    ),
                  ]),
              decoration: BoxDecoration(
                color: Color(0xFFFAF6ED),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    topRight: Radius.circular(30.0)),
              ))),
      Positioned(
          top: screenHeight / 3 - (-20.0),
          child: Container(
            padding: EdgeInsets.only(left: 20.0),
            height: screenHeight / 3 + 200.0,
            width: screenWidth,
            child: Column(children: [
              SizedBox(),
              Text(
                widget.selectedCards.cardContent,
                style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF201F1C)),
              ),
            ]),
          )),
      Positioned(
        top: screenHeight / 3 - (-390.0),
        child: Container(
          padding: EdgeInsets.only(left: 20.0),
          height: screenHeight / 3 + 25.0,
          width: screenWidth,
          child: Column(
            children: <Widget>[
              new MaterialButton(
                height: 50.0,
                color: Colors.green,
                onPressed: startQuiz,
                child: new Text(
                  'Take a Quiz',
                  style: new TextStyle(
                    fontSize: 18.0,
                    color: Colors.black,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    ]));
  }

  void startQuiz() {
    setState(() {
      Navigator.push(context,
          new MaterialPageRoute(builder: (context) => new Vocabulary()));
    });
  }
}
