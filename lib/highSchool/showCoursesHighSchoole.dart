import 'package:flutter/material.dart';

import 'listCoursesHiegh.dart';
import 'listCoursesHiegh_.dart';

class ShowCoursesHighSchoole extends StatefulWidget {
  final String year, level;
  ShowCoursesHighSchoole(this.year, this.level);

  @override
  _ShowCoursesState createState() => _ShowCoursesState();
}

class _ShowCoursesState extends State<ShowCoursesHighSchoole> {
  String year;

  @override
  // ignore: must_call_super
  void initState() {
    year = widget.year;
  }

  @override
  Widget build(BuildContext context) {
    listCoursesHiegh firstYears = listCoursesHiegh(year, '3_high');
    listCoursesHiegh_ secondeYears = listCoursesHiegh_(year, '3_high');

    if (widget.year == 'أولى ثانوي') {
      return firstYears;
    } else {
      if (widget.year == 'ثانية ثانوي' || widget.year == 'الثالثة ثانوي') {
        return secondeYears;
      }
    }
  }
}

// /3_high/1/science/math/first_trim
