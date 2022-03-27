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

    return Container(
      margin: EdgeInsets.all(8),
      child:
          // ignore: deprecated_member_use
          RaisedButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (BuildContext context) => viewpdf));
        },
        shape:
            //RoundedRectangleBorder(borderRadius: BorderRadius.circular(05.0)),
            RoundedRectangleBorder(
                side: BorderSide(color: Colors.green, width: 1)),
        padding: EdgeInsets.all(1.0),
        child: Ink(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  const Color(0xFF166D3B),
                  const Color(0xFF166D3B),
                ],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              ),
              borderRadius: BorderRadius.circular(00.0)),
          child: Container(
            constraints: BoxConstraints(maxWidth: 170.0, minHeight: 30.0),
            alignment: Alignment.center,
            child: Directionality(
              // add this
              textDirection: TextDirection.rtl, // set this property
              child: Text(
                link,
                style: TextStyle(
                  fontFamily: 'Kufi',
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
