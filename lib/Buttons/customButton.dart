import 'package:flutter/material.dart';
import 'package:myEduApp/CourseProcessing/showCourses.dart';
import 'package:myEduApp/EndEduc/showCoursesEnd.dart';

// ignore: must_be_immutable
class CustomBTN extends StatelessWidget {
  String courseName, years, level, sp, yearX;
  IconData icon;

  CustomBTN(
      this.courseName, this.icon, this.years, this.level, this.sp, this.yearX);

  // ignore: unused_element
  void _showAlert(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              content: RichText(
                text: TextSpan(
                  children: [
                    WidgetSpan(
                      child: Icon(Icons.mood_bad_sharp, size: 20),
                    ),
                    TextSpan(
                        text: "  لم تقم بإختيار الشعبة التي تدرسها",
                        style: TextStyle(
                            color: Colors.orange,
                            fontSize:
                                MediaQuery.of(context).size.width * 0.03, //13
                            fontFamily: 'Kufi',
                            fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
            ));
  }

  void _showAlert2(BuildContext context) {
    print('object');
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              content: RichText(
                text: TextSpan(
                  children: [
                    WidgetSpan(
                      child: Icon(Icons.mood_bad_sharp,
                          size: MediaQuery.of(context).size.width * 0.06),
                    ),
                    TextSpan(
                        text: "قم بإختيار السنة التي تريد عرض مواضيعها",
                        style: TextStyle(
                            color: Colors.orange,
                            fontSize: MediaQuery.of(context).size.width * 0.06,
                            fontFamily: 'Kufi',
                            fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(8),
        width: 130,
        height: 45,
        // ignore: deprecated_member_use
        child: ElevatedButton.icon(
          style: ElevatedButton.styleFrom(
            primary: Color.fromARGB(255, 22, 133, 66),
            onPrimary: const Color(0xFF63d471),
          ),
          onPressed: () {
            if (sp == 'noChanged') {
              _showAlert(context);
            } else {
              if (yearX == '' &&
                  (years == 'CinqEme' || years == 'bem' || years == 'bac')) {
                _showAlert2(context);
              } else {
                if (yearX == '' && years == 'CinqEme') {
                  _showAlert2(context);
                } else {
                  if (years == 'CinqEme' || years == 'bem' || years == 'Bac') {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) =>
                                showCoursesEnd(courseName, years, sp, yearX)));
                  } else {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) =>
                                ShowCourses(courseName, years, level, sp)));
                  }
                }
              }
            }
          },
          label: Text(
            courseName,
            style: TextStyle(
                color: Colors.white,
                fontFamily: 'Kufi',
                fontSize: 10,
                fontWeight: FontWeight.bold),
          ),
          icon: Icon(
            icon,
            color: Colors.white,
          ),
        ));
  }
}
