import 'dart:convert';
import 'package:flutter/material.dart';

import '../PDFreader/Viewpdf.dart';

// ignore: must_be_immutable
class CourseContentButtonMore extends StatelessWidget {
  Viewpdf viewpdf;
  String titleBtn, years_;
  CourseContentButtonMore(this.viewpdf, this.titleBtn, this.years_);

  @override
  Widget build(BuildContext context) {
    String link;
    try {
      if (years_ == '3') {
        link = titleBtn.split("/")[6]; // and 5 and 6
        //print('title = ' + link);
      } else {
        link = titleBtn.split("/")[5]; // and 5 and 6
      }
      //link = titleBtn.split("/")[5]; // and 5 and 6
      link = link.substring(0, link.indexOf('.pdf'));
    } catch (e) {
      print(e);
    }

    return Column(children: [
      RaisedButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (BuildContext context) => viewpdf));
        },
        shape: RoundedRectangleBorder(
            side: BorderSide(color: Color(0xFF233329), width: 1)),
        padding: EdgeInsets.all(1.0),
        child: Ink(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  const Color(0xFF233329),
                  const Color(0xFF63d471),
                ],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              ),
              borderRadius: BorderRadius.circular(00.0)),
          child: Container(
            width: MediaQuery.of(context).size.height * 0.25,
            height: MediaQuery.of(context).size.height * 0.08,
            alignment: Alignment.center,
            child: Text(
              link,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Kufi',
                fontSize: MediaQuery.of(context).size.height * 0.015,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
      SizedBox(
        height: 15,
      ),
    ]
        // ignore: deprecated_member_use

        );
  }
}
