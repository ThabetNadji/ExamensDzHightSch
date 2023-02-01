import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:ui' as ui;

class timeRemaing extends StatefulWidget {
  const timeRemaing({Key key}) : super(key: key);

  @override
  State<timeRemaing> createState() => _timeRemaingState();
}

class _timeRemaingState extends State<timeRemaing> {
  int estimateTs = DateTime(2023, 06, 12, 00, 00, 00).millisecondsSinceEpoch;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
          child: Column(
            children: [
              StreamBuilder(
                  stream: Stream.periodic(Duration(seconds: 1), (i) => i),
                  builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
                    DateFormat format = DateFormat("mm:ss");
                    int now = DateTime.now().millisecondsSinceEpoch;
                    Duration remaining =
                        Duration(milliseconds: estimateTs - now);
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
                      decoration: new BoxDecoration(
                        borderRadius:
                            new BorderRadius.all(new Radius.circular(10.0)),
                        image: DecorationImage(
                          image: AssetImage("assets/images/4.png"),
                          fit: BoxFit.cover,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.orange,
                            //.withOpacity(0.5),
                            spreadRadius: 0,
                            blurRadius: 0,
                            offset: Offset(0, 0), // changes position of shadow
                          ),
                        ],
                      ),
                      //color: Colors.greenAccent.withOpacity(0.3),
                      alignment: Alignment.center,
                      child: Column(
                        children: [
                          Column(
                            children: [
                              Text('',
                                  style: new TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 10.0,
                                    //color: Colors.orange,
                                    fontFamily: 'Kufi',
                                  )),
                              Text(
                                  ' 2023 الـوقـت المـتـبـقـي لــشـهــادة البــكــالوريــــا  ',
                                  style: new TextStyle(
                                    fontWeight: FontWeight.w900,
                                    fontSize:
                                        MediaQuery.of(context).size.width / 25,
                                    color: Color.fromARGB(220, 4, 250, 12),
                                    fontFamily: 'Kufi',
                                  ))
                            ],
                          ),
                          Column(
                            children: [
                              //remaining

                              Row(
                                mainAxisAlignment: MainAxisAlignment
                                    .center, //Center Row contents horizontally,
                                crossAxisAlignment: CrossAxisAlignment
                                    .center, //Center Row contents vertically,
                                children: [
                                  Row(
                                    children: [
                                      Text('  يـــــوم  ',
                                          style: new TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14.0,
                                            //color: Colors.orange,
                                            fontFamily: 'Kufi',
                                          ))
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment
                                        .center, //Center Row contents horizontally,
                                    crossAxisAlignment: CrossAxisAlignment
                                        .center, //Center Row contents vertically,
                                    children: [
                                      Text(
                                          '- الوقت بالأيام :   ' +
                                              '' +
                                              day.toInt().toString(),
                                          textDirection: ui.TextDirection.rtl,
                                          style: new TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14.0,
                                            //color: Colors.orange,
                                            fontFamily: 'Kufi',
                                          ))
                                    ],
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment
                                    .center, //Center Row contents horizontally,
                                crossAxisAlignment: CrossAxisAlignment
                                    .center, //Center Row contents vertically,
                                children: [
                                  Row(
                                    children: [
                                      Text('  ســــــاعــة  ',
                                          style: new TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14.0,
                                            //color: Colors.orange,
                                            fontFamily: 'Kufi',
                                          ))
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text('- الوقت بالساعات : ' + dateString,
                                          textDirection: ui.TextDirection.rtl,
                                          style: new TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14.0,
                                            //color: Colors.orange,
                                            fontFamily: 'Kufi',
                                          ))
                                    ],
                                  ),
                                ],
                              ),
                              Text('بالتـــوفـيق لكــل مجـتهــد ',
                                  style: new TextStyle(
                                    //fontWeight: FontWeight.bold,
                                    fontWeight: FontWeight.w900,
                                    fontSize: 14.0,
                                    color: Color.fromARGB(220, 4, 250, 12),
                                    fontFamily: 'Kufi',
                                  )),
                              Text('',
                                  style: new TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 10.0,
                                    //color: Colors.orange,
                                    fontFamily: 'Kufi',
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
    );
  }
}
