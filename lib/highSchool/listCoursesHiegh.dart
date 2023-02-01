import 'package:flutter/material.dart';
import 'package:myEduApp/Buttons/customButton.dart';

// ignore: must_be_immutable
class listCoursesHiegh extends StatefulWidget {
  String year, level;
  listCoursesHiegh(this.year, this.level);
  @override
  _FirstYearsState createState() => _FirstYearsState();
}

class _FirstYearsState extends State<listCoursesHiegh> {
  // set ads
  @override
  void initState() {
    super.initState();
  }

  String speciality = 'noChanged';

  @override
  Widget build(BuildContext context) {
    print('()()()()()()()()()()()()()()()()');
    print(widget.year);
    return Scaffold(
      body: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              SizedBox(
                height: 15, //Use of SizedBox
              ),
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
            //Use of SizedBox
            height: 40,
          ),
          Text(
            'قائمة المواد',
            style: new TextStyle(
                fontSize: MediaQuery.of(context).size.width * 0.04,
                color: Colors.white,
                fontFamily: 'Kufi'),
          ),
          SizedBox(
            height: 05, //Use of SizedBox
          ),
          new DropdownButton<String>(
            hint: Text(
              'إختر الشعبة التي تدرسها',
              style: TextStyle(
                  color: Colors.orange, fontSize: 15, fontFamily: 'Kufi'),
            ),
            onChanged: (String newVal) {
              setState(() {
                speciality = newVal;
              });
            },
            items: <String>[
              '            آداب و فلسفة',
              '            علوم تجريبية'
            ].map((String value) {
              return new DropdownMenuItem<String>(
                value: value,
                child: new Text(value),
              );
            }).toList(),
            //value: speciality,
          ),
          speciality == 'noChanged'
              ? Text('')
              : Text(
                  speciality + '             ',
                  style: TextStyle(
                      color: Colors.green,
                      fontSize: 13,
                      fontFamily: 'Kufi',
                      fontWeight: FontWeight.bold),
                ),
          SizedBox(
            height: 25, //Use of SizedBox
          ),
          Flexible(
            child: Row(
              mainAxisAlignment:
                  MainAxisAlignment.center, //Center Row contents horizontally,
              crossAxisAlignment:
                  CrossAxisAlignment.center, //Center Row contents vertically,
              children: [
                CustomBTN('لغة عربية', Icons.auto_stories, widget.year,
                    widget.level, speciality, ''),
                CustomBTN('رياضيات', Icons.calculate, widget.year, widget.level,
                    speciality, ''),
              ],
            ),
          ),
          Flexible(
            child: Row(
              mainAxisAlignment: MainAxisAlignment //
                  .center, //Center Row contents horizontally,
              crossAxisAlignment:
                  CrossAxisAlignment.center, //Center Row contents vertically,
              children: [
                CustomBTN('علوم الطبيعة', Icons.biotech_sharp, widget.year,
                    widget.level, speciality, ''),
                CustomBTN('إسلامية', Icons.brightness_low_outlined, widget.year,
                    widget.level, speciality, ''),
              ],
            ),
          ),
          Flexible(
            child: Row(
              mainAxisAlignment:
                  MainAxisAlignment.center, //Center Row contents horizontally,
              crossAxisAlignment:
                  CrossAxisAlignment.center, //Center Row contents vertically,
              children: [
                CustomBTN('تكنولوجيا', Icons.computer, widget.year,
                    widget.level, speciality, ''),
                CustomBTN('إعلام آلي', Icons.computer, widget.year,
                    widget.level, speciality, ''),
              ],
            ),
          ),
          Flexible(
            child: Row(
              mainAxisAlignment:
                  MainAxisAlignment.center, //Center Row contents horizontally,
              crossAxisAlignment:
                  CrossAxisAlignment.center, //Center Row contents vertically,
              children: [
                CustomBTN('إجتماعيات', Icons.explore, widget.year, widget.level,
                    speciality, ''),
                CustomBTN('فرنسية', Icons.language, widget.year, widget.level,
                    speciality, ''),
              ],
            ),
          ),
          Flexible(
            child: Row(
              mainAxisAlignment:
                  MainAxisAlignment.center, //Center Row contents horizontally,
              crossAxisAlignment:
                  CrossAxisAlignment.center, //Center Row contents vertically,
              children: [
                CustomBTN('إنجليزية', Icons.g_translate_sharp, widget.year,
                    widget.level, speciality, ''),
                CustomBTN('فيزياء', Icons.science_outlined, widget.year,
                    widget.level, speciality, ''),
              ],
            ),
          ),
          Spacer(),
          Spacer(),
        ],
      ),
    );
  }
}
