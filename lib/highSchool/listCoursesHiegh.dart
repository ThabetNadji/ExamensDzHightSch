import 'package:flutter/material.dart';
import 'package:myEduApp/Buttons/customButton.dart';
import 'package:myEduApp/main/theme.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class listCoursesHiegh extends StatefulWidget {
  String year, level;
  listCoursesHiegh(this.year, this.level);
  @override
  _FirstYearsState createState() => _FirstYearsState();
}

class _FirstYearsState extends State<listCoursesHiegh> {
  String speciality = 'noChanged';
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
                            begin:
                                Alignment.topLeft, //begin of the gradient color
                            end: Alignment.topRight, //end of the gradient color
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
                            begin:
                                Alignment.topLeft, //begin of the gradient color
                            end: Alignment.topRight, //end of the gradient color
                            stops: [0, 0.2, 0.7, 0.8]),

                        borderRadius:
                            BorderRadius.circular(0), //border corner radius
                      ),
              ),
            ),
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
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.03,
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
                value.getTheme() == ThemeData.light().copyWith()
                    ? Text(
                        'قائمة المواد',
                        style: new TextStyle(
                            fontSize: MediaQuery.of(context).size.width * 0.04,
                            color: Colors.black,
                            fontFamily: 'Kufi'),
                      )
                    : Text(
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
                    mainAxisAlignment: MainAxisAlignment
                        .center, //Center Row contents horizontally,
                    crossAxisAlignment: CrossAxisAlignment
                        .center, //Center Row contents vertically,
                    children: [
                      CustomBTN('لغة عربية', Icons.auto_stories, widget.year,
                          widget.level, speciality, ''),
                      CustomBTN('رياضيات', Icons.calculate, widget.year,
                          widget.level, speciality, ''),
                    ],
                  ),
                ),
                Flexible(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment //
                        .center, //Center Row contents horizontally,
                    crossAxisAlignment: CrossAxisAlignment
                        .center, //Center Row contents vertically,
                    children: [
                      CustomBTN('علوم الطبيعة', Icons.biotech_sharp,
                          widget.year, widget.level, speciality, ''),
                      CustomBTN('إسلامية', Icons.brightness_low_outlined,
                          widget.year, widget.level, speciality, ''),
                    ],
                  ),
                ),
                Flexible(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment
                        .center, //Center Row contents horizontally,
                    crossAxisAlignment: CrossAxisAlignment
                        .center, //Center Row contents vertically,
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
                    mainAxisAlignment: MainAxisAlignment
                        .center, //Center Row contents horizontally,
                    crossAxisAlignment: CrossAxisAlignment
                        .center, //Center Row contents vertically,
                    children: [
                      CustomBTN('إجتماعيات', Icons.explore, widget.year,
                          widget.level, speciality, ''),
                      CustomBTN('فرنسية', Icons.language, widget.year,
                          widget.level, speciality, ''),
                    ],
                  ),
                ),
                Flexible(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment
                        .center, //Center Row contents horizontally,
                    crossAxisAlignment: CrossAxisAlignment
                        .center, //Center Row contents vertically,
                    children: [
                      CustomBTN('إنجليزية', Icons.g_translate_sharp,
                          widget.year, widget.level, speciality, ''),
                      CustomBTN('فيزياء', Icons.science_outlined, widget.year,
                          widget.level, speciality, ''),
                    ],
                  ),
                ),
                Spacer(),
                Spacer(),
              ],
            ),
          ),
        );
      },
    );
  }
}

/*  */
