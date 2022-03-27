import 'package:flutter/material.dart';
import 'package:myEduApp/main/theme.dart';
import 'package:provider/provider.dart';
import '../SideDrawer/sideDrawer.dart';
import 'cardHomeWidget.dart';
import 'cardHomeWidgetDark.dart';
import 'package:intl/intl.dart';
import 'dart:ui' as ui;

class MyHomePage extends StatelessWidget {
  int estimateTs = DateTime(2022, 06, 20, 00, 00, 00)
      .millisecondsSinceEpoch; // set needed date

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(builder: (context, value, child) {
      return new MaterialApp(
          theme: value.getTheme(),
          home: Scaffold(
            drawer: SideDrawer(),
            appBar: AppBar(
              centerTitle: true,
              title: Text(
                ' التــعـليــم الـثـانـوي - Examens DZ ',
                style: new TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15.0,
                  color: Colors.orange,
                  fontFamily: 'Kufi',
                ),
              ),
              actions: <Widget>[
                value.getTheme() == ThemeData.light().copyWith()
                    ? IconButton(
                        icon:
                            Icon(Icons.toggle_off_rounded), //toggle_on_outlined
                        color: Colors.black,
                        onPressed: () {
                          Provider.of<ThemeProvider>(context, listen: false)
                              .swapTheme();
                        },
                      )
                    : IconButton(
                        icon: Icon(Icons.toggle_on_outlined),
                        color: Colors.white,
                        onPressed: () {
                          Provider.of<ThemeProvider>(context, listen: false)
                              .swapTheme();
                        },
                      ),
              ],
              flexibleSpace: Container(
                decoration: value.getTheme() == ThemeData.light().copyWith()
                    ? BoxDecoration(
                        gradient: LinearGradient(
                            colors: [
                              const Color(0xFF167F57),
                              const Color(0xFF167F77),
                              const Color(0xFF167F82),
                              const Color(0xFF167F99)
                              //add more colors for gradient
                            ],
                            begin:
                                Alignment.topLeft, //begin of the gradient color
                            end: Alignment.topRight, //end of the gradient color
                            stops: [0, 0.2, 0.7, 0.8]),

                        borderRadius:
                            BorderRadius.circular(0), //border corner radius
                      )
                    : BoxDecoration(
                        gradient: LinearGradient(
                            colors: [
                              const Color(0x00000000),
                              const Color(0x00000000),
                              const Color(0x00000000),
                              const Color(0x00000000)
                              //add more colors for gradient
                            ],
                            begin:
                                Alignment.topLeft, //begin of the gradient color
                            end: Alignment.topRight, //end of the gradient color
                            stops: [0, 0.2, 0.7, 0.8]),

                        borderRadius:
                            BorderRadius.circular(0), //border corner radius
                      ),
              ),
            ),
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
                          //width: 400,
                          //height: 673,
                          child: Column(
                            children: <Widget>[
                              Column(
                                children: [
                                  Container(
                                    //height: 30,
                                    //width: 675,
                                    decoration: BoxDecoration(
                                        //color: Colors.green,
                                        borderRadius: BorderRadius.circular(5)),
                                    child: Column(
                                      children: [
                                        StreamBuilder(
                                            stream: Stream.periodic(
                                                Duration(seconds: 1), (i) => i),
                                            builder: (BuildContext context,
                                                AsyncSnapshot<int> snapshot) {
                                              DateFormat format =
                                                  DateFormat("mm:ss");
                                              int now = DateTime.now()
                                                  .millisecondsSinceEpoch;
                                              Duration remaining = Duration(
                                                  milliseconds:
                                                      estimateTs - now);
                                              var dateString =
                                                  '${remaining.inHours}:${format.format(DateTime.fromMillisecondsSinceEpoch(remaining.inMilliseconds))}';
                                              var dayX = remaining.inHours / 24;
                                              var min = remaining.inHours * 60;
                                              var sec = min * 60;

                                              double day;
                                              if (dayX >= 0) {
                                                day = dayX;
                                              } else {
                                                day = 0;
                                                min = 0;
                                                sec = 0;
                                                dateString = '0';
                                              }
                                              //print(dateString);
                                              return Container(
                                                color: Colors.greenAccent
                                                    .withOpacity(0.3),
                                                alignment: Alignment.center,
                                                child: Column(
                                                  children: [
                                                    Column(
                                                      children: [
                                                        Text(
                                                            ' 2022 الـوقـت المـتـبـقـي لــشـهــادة البــكــالوريــــا  ',
                                                            style:
                                                                new TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontSize: 10.0,
                                                              //color: Colors.orange,
                                                              fontFamily:
                                                                  'Kufi',
                                                            ))
                                                      ],
                                                    ),
                                                    Column(
                                                      children: [
                                                        //remaining

                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center, //Center Row contents horizontally,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .center, //Center Row contents vertically,
                                                          children: [
                                                            Row(
                                                              children: [
                                                                Text(
                                                                    '  يـــــوم  ',
                                                                    style:
                                                                        new TextStyle(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      fontSize:
                                                                          10.0,
                                                                      //color: Colors.orange,
                                                                      fontFamily:
                                                                          'Kufi',
                                                                    ))
                                                              ],
                                                            ),
                                                            Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center, //Center Row contents horizontally,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .center, //Center Row contents vertically,
                                                              children: [
                                                                Text(
                                                                    '- الوقت بالأيام :     ' +
                                                                        '             ' +
                                                                        day
                                                                            .toInt()
                                                                            .toString(),
                                                                    textDirection: ui
                                                                        .TextDirection
                                                                        .rtl,
                                                                    style:
                                                                        new TextStyle(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      fontSize:
                                                                          10.0,
                                                                      //color: Colors.orange,
                                                                      fontFamily:
                                                                          'Kufi',
                                                                    ))
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center, //Center Row contents horizontally,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .center, //Center Row contents vertically,
                                                          children: [
                                                            Row(
                                                              children: [
                                                                Text(
                                                                    'ســــــاعــة',
                                                                    style:
                                                                        new TextStyle(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      fontSize:
                                                                          10.0,
                                                                      //color: Colors.orange,
                                                                      fontFamily:
                                                                          'Kufi',
                                                                    ))
                                                              ],
                                                            ),
                                                            Row(
                                                              children: [
                                                                Text(
                                                                    '- الوقت بالساعات :    ' +
                                                                        dateString,
                                                                    textDirection: ui
                                                                        .TextDirection
                                                                        .rtl,
                                                                    style:
                                                                        new TextStyle(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      fontSize:
                                                                          10.0,
                                                                      //color: Colors.orange,
                                                                      fontFamily:
                                                                          'Kufi',
                                                                    ))
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                        Text(
                                                            'بالتـــوفـيق لكــل مجـتهــد ',
                                                            style:
                                                                new TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontSize: 10.0,
                                                              //color: Colors.orange,
                                                              fontFamily:
                                                                  'Kufi',
                                                            ))
                                                      ],
                                                    )
                                                  ],
                                                ),
                                              );
                                            }),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 60, //Use of SizedBox
                              ),
                              value.getTheme() == ThemeData.light().copyWith()
                                  ? cardHomeWidget(
                                      'assets/images/educ_re.png',
                                      'مواضيع شهادة البكالوريا للسنوات الماضيه مع الحل ',
                                      'Bac',
                                      'Bac',
                                      '3_high')
                                  : cardHomeWidgetDark(
                                      'assets/images/educ_re.png',
                                      'مواضيع شهادة البكالوريا للسنوات الماضيه مع الحل ',
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
          ));
    });
  }
}
