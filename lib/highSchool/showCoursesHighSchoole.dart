import 'package:flutter/material.dart';
import 'package:myEduApp/highSchool/listCoursesHiegh_3.dart';
import 'listCoursesHiegh.dart';
import 'listCoursesHiegh_2.dart';

class ShowCoursesHighSchoole extends StatefulWidget {
  final String year, level;
  ShowCoursesHighSchoole(this.year, this.level);

  @override
  _ShowCoursesState createState() => _ShowCoursesState();
}

class _ShowCoursesState extends State<ShowCoursesHighSchoole> {
  @override
  Widget build(BuildContext context) {
    listCoursesHiegh firstYears = listCoursesHiegh(('أولى ثانوي'), ('3_high'));
    listCoursesHiegh_2 secondeAndThirdYears2 =
        listCoursesHiegh_2('ثانية ثانوي', ('3_high'));
    listCoursesHiegh_3 secondeAndThirdYears3 =
        listCoursesHiegh_3('الثالثة ثانوي', ('3_high'));

    if (widget.year == 'أولى ثانوي') {
      return firstYears;
    } else {
      if (widget.year == 'ثانية ثانوي') {
        return secondeAndThirdYears2;
      } else {
        return secondeAndThirdYears3;
      }
    }
  }
}
