import 'package:flutter/material.dart';
import 'package:myEduApp/EndEduc/showCoursesBac.dart';

class dropDownListX extends StatefulWidget {
  String level, year;
  dropDownListX(this.year, this.level);
  String yearX = '', speciality = '';
  @override
  _dropDownListXState createState() => _dropDownListXState();
}

class _dropDownListXState extends State<dropDownListX> {
  showCoursesBac sc;

  @override
  Widget build(BuildContext context) {
    String dRattrapage = '2017 دورة إستدراكية';
    return Center(
      child: Wrap(
        children: [
          Center(
            child: new DropdownButton<String>(
              hint: Text(
                'إختر السنة التي تريد عرض مواضيعها',
                style: TextStyle(
                    color: Colors.orange, fontSize: 15, fontFamily: 'Kufi'),
              ),
              onChanged: (String newVal) {
                setState(() {
                  widget.yearX = newVal;
                });
              },

              items: <String>[
                '2020',
                '2019',
                '2018',
                '2017',
                dRattrapage,
                '2016',
                '2015'
              ].map((String value) {
                return new DropdownMenuItem<String>(
                  value: value,
                  child: new Text(value),
                );
              }).toList(),
              //value: speciality,
            ),
          ),
          Center(
            child: new DropdownButton<String>(
              hint: Text(
                'إختر الشعبة التي تدرسها',
                style: TextStyle(
                    color: Colors.orange, fontSize: 15, fontFamily: 'Kufi'),
              ),
              //value: speciality,
              onChanged: (String newVal) {
                setState(() {
                  widget.speciality = newVal;
                  //sp.getVal(newVal);
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
              //value: widget.speciality,
            ),
          ),
          SizedBox(
            height: 35, //Use of SizedBox
          ),
          widget.speciality != '' && widget.yearX != ''
              ? sc = new showCoursesBac(
                  widget.year, widget.level, widget.speciality, widget.yearX)
              : widget.speciality == ''
                  ? Center(
                      child: Text(
                        widget.yearX + '   ',
                        style: TextStyle(
                            color: Colors.green,
                            fontSize: 16,
                            fontFamily: 'Kufi',
                            fontWeight: FontWeight.bold),
                      ),
                    )
                  : widget.yearX == ''
                      ? Center(
                          child: Text(widget.speciality + '                  ',
                              style: TextStyle(
                                  color: Colors.green,
                                  fontSize: 16,
                                  fontFamily: 'Kufi',
                                  fontWeight: FontWeight.bold)),
                        )
                      : Text(''),
        ],
      ),
    );
  }
}
