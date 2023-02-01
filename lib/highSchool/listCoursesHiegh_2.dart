import 'package:flutter/material.dart';
import 'package:myEduApp/highSchool/showCourses_.dart';

// ignore: must_be_immutable
class listCoursesHiegh_2 extends StatefulWidget {
  String year = 'ثانية ثانوي', level;
  listCoursesHiegh_2(this.year, this.level);
  @override
  _FirstYearsState createState() => _FirstYearsState();
}

class _FirstYearsState extends State<listCoursesHiegh_2> {
  // set ads
  @override
  void initState() {
    super.initState();
  }

  String speciality = 'noChanged';
  ShowCoureses_ showCourses_;
  @override
  Widget build(BuildContext context) {
    print('()()()()()()()()()()()()()()()()');
    print(widget.year);
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 15, //Use of SizedBox
          ),
          Row(
            children: <Widget>[
              Container(
                width: 40.0,
              ),
              Flexible(
                child: Center(
                  child: Text(
                      'فروض،إختبارات، ملخصات، دروس و الكثير من الملفات المفيدة في جميع المواد و لجميع الشعب',
                      textAlign: TextAlign.center,
                      style: new TextStyle(
                          fontSize: MediaQuery.of(context).size.width * 0.03,
                          color: Colors.green,
                          fontFamily: 'Kufi')),
                ),
              ),
              Container(
                width: 40.0,
              ),
            ],
          ),
          SizedBox(
            height: 05, //Use of SizedBox
          ),
          Center(
            child: new DropdownButton<String>(
              hint: Text(
                'إختر الشعبة التي تدرسها',
                style: TextStyle(
                    color: Colors.orange,
                    fontSize: MediaQuery.of(context).size.width * 0.04,
                    fontFamily: 'Kufi'),
              ),
              onChanged: (String newVal) {
                setState(() {
                  speciality = newVal;
                  showCourses_ =
                      ShowCoureses_(widget.year, widget.level, newVal);
                });
              },
              items: <String>[
                '            آداب و فلسفة',
                '            علوم تجريبية',
                '                 رياضيات',
                '              تقني رياضي',
                '             لغات اجنبية',
                '          تسيير و إقتصاد',
              ].map((String value) {
                return new DropdownMenuItem<String>(
                  value: value,
                  child: new Text(value),
                );
              }).toList(),
              //value: speciality,
            ),
          ),
          speciality == 'noChanged' ? Text('') : showCourses_,
        ],
      ),
    ));
  }
}

/* */
