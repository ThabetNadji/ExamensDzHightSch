import 'package:flutter/material.dart';
import 'package:flushbar/flushbar.dart';

class Myflushbar {
  String text1, text2;
  Myflushbar(this.text1, this.text2);
  Widget myWidget(BuildContext context) {
    //elasticOut
    return Flushbar(
      flushbarPosition: FlushbarPosition.BOTTOM,
      flushbarStyle: FlushbarStyle.FLOATING,
      boxShadows: [
        BoxShadow(
            color: Colors.green[800], offset: Offset(0.0, 2.0), blurRadius: 3.0)
      ],
      backgroundGradient:
          LinearGradient(colors: [Colors.blueGrey, Colors.black]),
      reverseAnimationCurve: Curves.decelerate,
      forwardAnimationCurve: Curves.elasticOut,
      titleText: RichText(
        text: TextSpan(
          children: [
            WidgetSpan(
              child: Icon(
                Icons.check_circle_outlined,
                size: 25,
                color: Colors.green,
              ),
            ),
            TextSpan(
              text: text1,
              style: TextStyle(
                fontFamily: 'Kufi',
                fontSize: 25,
                color: Colors.green,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
      message: text2,
      duration: Duration(seconds: 3),
    )..show(context);
  }
}
