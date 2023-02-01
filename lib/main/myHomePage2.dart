import 'package:flutter/material.dart';
import 'package:myEduApp/main/timaRemaing.dart';
import 'cardHomeWidgetDark.dart';
import 'package:intl/intl.dart';
import 'dart:ui' as ui;

class myHomePage2 extends StatefulWidget {
  const myHomePage2({Key key}) : super(key: key);

  @override
  State<myHomePage2> createState() => _myHomePage2State();
}

class _myHomePage2State extends State<myHomePage2> {
  int estimateTs = DateTime(2023, 06, 12, 00, 00, 00).millisecondsSinceEpoch;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Center(
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 30, //Use of SizedBox
                  ),
                  Container(
                    child: Column(
                      children: <Widget>[
                        timeRemaing(),
                        //Text('qdfqdsfsd'),
                        SizedBox(
                          height: 60, //Use of SizedBox
                        ),
                        cardHomeWidgetDark(
                            'assets/images/educ_re.png',
                            'مواضيع شهادة البكالوريا لسنوات الماضيه مع التصحيح النموذجي',
                            'Bac',
                            'Bac',
                            '3_high'),
                      ],
                    ),
                  ),
                  Container(
                    alignment: Alignment.bottomCenter,
                    child: Column(
                      children: [],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
