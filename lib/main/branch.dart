import 'package:flutter/material.dart';
import 'package:myEduApp/EndEduc/listCoursesBac.dart';


class branch extends StatefulWidget {
  String year, level;
  listCoursesBac bac;

  branch(this.year, this.level);

  @override
  _brachState createState() => _brachState();
}

class _brachState extends State<branch> {
  @override
  Widget build(BuildContext context) {
    if (widget.year == 'Bac') {
          return widget.bac = new listCoursesBac(widget.year, widget.level);
        }
    return null;
  }
}
