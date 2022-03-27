import 'package:flutter/material.dart';
import 'package:myEduApp/highSchool/showCourses_.dart';
import 'package:myEduApp/main/theme.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class listCoursesHiegh_ extends StatefulWidget {
  String year, level;
  listCoursesHiegh_(this.year, this.level);
  @override
  _FirstYearsState createState() => _FirstYearsState();
}

class _FirstYearsState extends State<listCoursesHiegh_> {
  String speciality = 'noChanged';
  ShowCoureses_ sc;
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, value, child) {
        return new MaterialApp(
          theme: value.getTheme(),
          home: Scaffold(
              appBar: AppBar(
                leading: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                  ),
                ),
                centerTitle: true,
                title: Text(
                  widget.year,
                  style: TextStyle(
                      fontFamily: 'Kufi',
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
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
                              begin: Alignment
                                  .topLeft, //begin of the gradient color
                              end: Alignment
                                  .topRight, //end of the gradient color
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
                              begin: Alignment
                                  .topLeft, //begin of the gradient color
                              end: Alignment
                                  .topRight, //end of the gradient color
                              stops: [0, 0.2, 0.7, 0.8]),

                          borderRadius:
                              BorderRadius.circular(0), //border corner radius
                        ),
                ),
              ),
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
                                    fontSize: 12.0,
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
                              fontSize: 15,
                              fontFamily: 'Kufi'),
                        ),
                        onChanged: (String newVal) {
                          setState(() {
                            speciality = newVal;
                            sc = ShowCoureses_(
                                widget.year, widget.level, newVal);
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
                    speciality == 'noChanged' ? Text('') : sc,
                  ],
                ),
              )),
        );
      },
    );
  }
}

/* */
