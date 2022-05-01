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
    return Column(
      children: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: Color.fromARGB(255, 22, 133, 66),
            onPrimary: const Color(0xFF63d471),
          ),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (BuildContext context) => viewpdf));
          },
          child: Ink(
            child: Container(
              width: MediaQuery.of(context).size.height * 0.25,
              height: MediaQuery.of(context).size.height * 0.08,
              //constraints: BoxConstraints(maxWidth: 170.0, minHeight: 60.0),
              alignment: Alignment.center,
              child: extra == ''
                  ? Text(
                      ' النموذج رقم ' + titleBtn,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: MediaQuery.of(context).size.height * 0.02,
                          fontFamily: 'Kufi'),
                    )
                  : Text(
                      link,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: MediaQuery.of(context).size.height * 0.02,
                          fontFamily: 'Kufi'),
                    ),
            ),
          ),
        ),
        SizedBox(
          height: 15,
        ),
      ],
    );
  }
}
