import 'package:E_Learning_App/page2.dart';
import 'package:flutter/material.dart';
import 'dart:ui';

import 'models/vocabulary.dart';

class ListParts extends StatefulWidget {
  @override
  _ListPartsState createState() => _ListPartsState();
}

class _ListPartsState extends State<ListParts> {
  final cards = allCards;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _getCustomAppBar(),
      backgroundColor: Color(0xFFFAF6ED),
      body: ListView(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: null,
              ),
              IconButton(
                icon: Icon(Icons.menu),
                onPressed: null,
              )
            ],
          ),
          Padding(
            padding: EdgeInsets.only(left: 15.0, right: 15.0),
            child: (Text(
              'Best place to improve your skills in English',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            )),
          ),
          Padding(
              padding: EdgeInsets.only(left: 15.0, right: 15.0),
              child: TextField(
                decoration: InputDecoration(
                  prefixIcon:
                      IconButton(icon: Icon(Icons.search), onPressed: null),
                  hintText: 'Search',
                ),
              )),
          Container(
            height: MediaQuery.of(context).size.height - 200,
            child: GridView.count(
              crossAxisCount: 3,
              crossAxisSpacing: 1,
              mainAxisSpacing: 1,
              childAspectRatio: 0.67,
              primary: false,
              children: <Widget>[
                ...cards.map((e) {
                  return buildCardGrid(e);
                }).toList()
              ],
            ),
          ),
        ],
      ),
    );
  }

  _getCustomAppBar() {
    return PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: Container(
            alignment: Alignment.bottomCenter,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
                  Colors.tealAccent,
                  Colors.redAccent,
                ],
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  '       World of English',
                  style: TextStyle(fontSize: 37, fontWeight: FontWeight.w500),
                ),
                IconButton(icon: Icon(Icons.favorite), onPressed: () {}),
              ],
            )));
  }

  buildCardGrid(Cards cards) {
    return GestureDetector(
        onTap: () {
          //Todo

          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => CardsDetails(selectedCards: cards)));
        },
        child: Padding(
            padding: EdgeInsets.all(5.0),
            child: Stack(children: <Widget>[
              Container(
                height: 150.0,
                width: 100.0,
                color: Colors.transparent,
              ),
              Positioned(
                  left: 30.0,
                  top: 65.0,
                  child: Container(
                      height: 30.0,
                      width: 50.0,
                      decoration: BoxDecoration(boxShadow: [
                        BoxShadow(
                            blurRadius: 8.0,
                            color: Colors.grey.withOpacity(0.75),
                            offset: Offset(5, 25),
                            spreadRadius: 12.0)
                      ]))),
              Positioned(
                left: 12.0,
                top: 15.0,
                child: Hero(
                  tag: cards.cardPic,
                  child: Container(
                    height: 110.0,
                    width: 110.0,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7.0),
                        image: DecorationImage(
                          image: AssetImage(cards.cardPic),
                          fit: BoxFit.cover,
                        )),
                  ),
                ),
              ),
              Positioned(
                  left: 22.0,
                  top: 138.0,
                  child: Column(
                    children: <Widget>[
                      Text(
                        cards.cardName,
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ))
            ])));
  }
}
