import 'package:flutter/material.dart';
import 'package:myEduApp/highSchool/showCoursesHighSchoole.dart';
import './entry.dart';

class InitData {
  List<Entry> data;

  List getData(BuildContext context) {
    return data = <Entry>[
      Entry(
        //'التعليم الثانوي',
        '                   التعليم الثانوي               ',
        <Widget>[
          ListTile(
            title: Text(' -  أولى ثانوي   ',
                textDirection: TextDirection.rtl,
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.height * 0.023,
                  fontFamily: 'Kufi',
                )),
            contentPadding: EdgeInsets.fromLTRB(20, 5, 0, 5),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) =>
                          ShowCoursesHighSchoole(('أولى ثانوي'), ('3_high'))));
            },
          ),
          ListTile(
            title: Text(' -  الثانية ثانوي   ',
                textDirection: TextDirection.rtl,
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.height * 0.023,
                  fontFamily: 'Kufi',
                )),
            contentPadding: EdgeInsets.fromLTRB(20, 5, 0, 5),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) =>
                          ShowCoursesHighSchoole('ثانية ثانوي', ('3_high'))));
            },
          ),
          ListTile(
            title: Text(' -  الثالثة ثانوي   ',
                textDirection: TextDirection.rtl,
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.height * 0.023,
                  fontFamily: 'Kufi',
                )),
            contentPadding: EdgeInsets.fromLTRB(20, 5, 0, 5),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) =>
                          ShowCoursesHighSchoole('الثالثة ثانوي', ('3_high'))));
            },
          )
        ],
      )
    ];
  }

  //final List<Entry> data =
}
