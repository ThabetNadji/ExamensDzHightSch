import 'package:flutter/material.dart';
import '../PDFreader/Viewpdf.dart';

// ignore: must_be_immutable
class CourseContentButton extends StatelessWidget {
  Viewpdf viewpdf;
  String titleBtn, extra;
  CourseContentButton(this.viewpdf, this.titleBtn, this.extra);

  @override
  Widget build(BuildContext context) {
    String link;
    if (extra == 'end') {
      link = titleBtn.split("/")[4];
      link = link.substring(0, link.indexOf('.pdf'));
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
            constraints: BoxConstraints(maxWidth: 170.0, minHeight: 60.0),
            alignment: Alignment.center,
            child: extra == ''
                ? Text(
                    ' النموذج رقم ' + titleBtn,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white, fontSize: 15, fontFamily: 'Kufi'),
                  )
                : Text(
                    link,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white, fontSize: 15, fontFamily: 'Kufi'),
                  ),
          ),
        ),
      ),
    );
  }
}
