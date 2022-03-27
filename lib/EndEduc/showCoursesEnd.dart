import 'package:flutter/material.dart';
import 'package:myEduApp/CourseProcessing/getCourses.dart';
import 'package:myEduApp/main/theme.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class showCoursesEnd extends StatefulWidget {
  String years, courseName, sp, yearX;

  showCoursesEnd(this.courseName, this.years, this.sp, this.yearX);
  @override
  _ShowCoursesState createState() => _ShowCoursesState();
}

class _ShowCoursesState extends State<showCoursesEnd>
    with SingleTickerProviderStateMixin {
  //TabController _tabController;
  List<showCoursesEnd> getCoursesList;

  @override
  void initState() {
    //_tabController = TabController(length: 4, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // to remove space beteween words of sp var
    if (widget.sp == '            آداب و فلسفة') {
      widget.sp = 'آداب و فلسفة';
    } else {
      if (widget.sp == '            علوم تجريبية') {
        widget.sp = 'علوم تجريبية';
      } else {
        if (widget.sp == null) {
          widget.sp = '';
        } else {
          if (widget.sp == '                 رياضيات') {
            widget.sp = 'رياضيات';
          } else {
            if (widget.sp == '              تقني رياضي') {
              widget.sp = 'تقني رياضي';
            } else {
              if (widget.sp == '             لغات اجنبية') {
                widget.sp = 'لغات اجنبية';
              } else {
                if (widget.sp == '          تسيير و إقتصاد') {
                  widget.sp = 'تسيير و إقتصاد';
                }
              }
            }
          }
        }
      }
    }

    return Consumer<ThemeProvider>(builder: (context, value, child) {
      return MaterialApp(
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
                title: Text(widget.years + ' ' + widget.yearX,
                    style: TextStyle(
                        fontFamily: 'Kufi',
                        fontSize: 15,
                        fontWeight: FontWeight.bold)),
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
                ), // green
              ),
              body: Center(
                child: Wrap(
                  children: [
                    Column(
                      children: [
                        Text(' المادة : ' + widget.courseName,
                            style: TextStyle(
                                fontFamily: 'Kufi',
                                fontSize: 15,
                                fontWeight: FontWeight.bold)),
                        Text(widget.years + '   : الشهادة',
                            style: TextStyle(
                                fontFamily: 'Kufi',
                                fontSize: 15,
                                fontWeight: FontWeight.bold)),
                        widget.sp != ''
                            ? Text(' الشعبة : ' + widget.sp,
                                style: TextStyle(
                                    fontFamily: 'Kufi',
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold))
                            : Text(''),
                        Text(' الموسم الدراسي : ' + widget.yearX,
                            style: TextStyle(
                                fontFamily: 'Kufi',
                                fontSize: 15,
                                fontWeight: FontWeight.bold)),
                        GetCourses(widget.courseName, widget.years, '', '',
                            widget.sp, widget.yearX),
                        SizedBox(
                          height: 100, //Use of SizedBox
                        ),
                      ],
                    ),
                  ],
                ),
              )));
    });
  }
}
