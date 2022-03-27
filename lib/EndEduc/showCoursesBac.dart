import 'package:flutter/material.dart';
import 'package:myEduApp/Buttons/customButton.dart';
import 'package:myEduApp/Buttons/customButtonEmpty.dart';

class showCoursesBac extends StatefulWidget {
  String year, level, speciality, yearX;
  showCoursesBac(this.year, this.level, this.speciality, this.yearX);

  @override
  _ShowCoureses2State createState() => _ShowCoureses2State();
}

class _ShowCoureses2State extends State<showCoursesBac> {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        SizedBox(
          //Use of SizedBox
          height: 40,
        ),
        Center(
            child: Text(
          'بكالوريا ',
          style: TextStyle(
              color: Colors.green,
              fontSize: 16,
              fontFamily: 'Kufi',
              fontWeight: FontWeight.bold),
        )),
        Center(
            child: Text(
          widget.speciality + ' / ' + widget.yearX + '              ',
          style: TextStyle(
              color: Colors.green,
              fontSize: 16,
              fontFamily: 'Kufi',
              fontWeight: FontWeight.bold),
        )), //widget.speciality
        SizedBox(
          height: 05, //Use of SizedBox
        ),
        SizedBox(
          height: 25, //Use of SizedBoxs
        ),
        Row(
          mainAxisAlignment:
              MainAxisAlignment.center, //Center Row contents horizontally,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomBTN('لغة عربية', Icons.auto_stories, widget.year,
                widget.level, widget.speciality, widget.yearX),
            CustomBTN('رياضيات', Icons.calculate, widget.year, widget.level,
                widget.speciality, widget.yearX)
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment //
              .center, //Center Row contents horizontally,
          crossAxisAlignment:
              CrossAxisAlignment.center, //Center Row contents vertically,
          children: [
            widget.speciality == '            علوم تجريبية' ||
                    widget.speciality == '                 رياضيات' ||
                    (widget.speciality == '            آداب و فلسفة' &&
                        widget.year == 'ثانية ثانوي')
                ? CustomBTN('علوم الطبيعة', Icons.biotech_sharp, widget.year,
                    widget.level, widget.speciality, widget.yearX)
                : widget.speciality == '          تسيير و إقتصاد'
                    ? CustomBTN(
                        'إ و المناجمنت',
                        Icons.attach_money_outlined,
                        widget.year,
                        widget.level,
                        widget.speciality,
                        widget.yearX)
                    : widget.speciality == '             لغات اجنبية'
                        ? CustomBTN('فلسفة', Icons.extension, widget.year,
                            widget.level, widget.speciality, widget.yearX)
                        : widget.speciality == '              تقني رياضي'
                            ? CustomBTN(
                                'ه مدنية',
                                Icons.engineering_rounded,
                                widget.year,
                                widget.level,
                                widget.speciality,
                                widget.yearX)
                            : CustomButtonEmpty(
                                ' ', Icons.announcement, widget.year),
            CustomBTN('إسلامية', Icons.brightness_low_outlined, widget.year,
                widget.level, widget.speciality, widget.yearX),
          ],
        ),
        Row(
          mainAxisAlignment:
              MainAxisAlignment.center, //Center Row contents horizontally,
          crossAxisAlignment:
              CrossAxisAlignment.center, //Center Row contents vertically,
          children: [
            widget.speciality == '            آداب و فلسفة'
                ? CustomBTN('فلسفة', Icons.extension, widget.year, widget.level,
                    widget.speciality, widget.yearX)
                : widget.speciality == '          تسيير و إقتصاد'
                    ? CustomBTN('تسيير مالي', Icons.euro_rounded, widget.year,
                        widget.level, widget.speciality, widget.yearX)
                    : widget.speciality == '              تقني رياضي'
                        ? CustomBTN(
                            'ه كهربائية',
                            Icons.electrical_services_sharp,
                            widget.year,
                            widget.level,
                            widget.speciality,
                            widget.yearX)
                        : CustomButtonEmpty(
                            ' ', Icons.announcement, widget.year),
          ],
        ),
        Row(
          mainAxisAlignment:
              MainAxisAlignment.center, //Center Row contents horizontally,
          crossAxisAlignment:
              CrossAxisAlignment.center, //Center Row contents vertically,
          children: [
            CustomBTN('إجتماعيات', Icons.explore, widget.year, widget.level,
                widget.speciality, widget.yearX),
            CustomBTN('فرنسية', Icons.language, widget.year, widget.level,
                widget.speciality, widget.yearX),
          ],
        ),
        Row(
          mainAxisAlignment:
              MainAxisAlignment.center, //Center Row contents horizontally,
          crossAxisAlignment:
              CrossAxisAlignment.center, //Center Row contents vertically,
          children: [
            CustomBTN('إنجليزية', Icons.g_translate_sharp, widget.year,
                widget.level, widget.speciality, widget.yearX),
            widget.speciality == '            علوم تجريبية' ||
                    widget.speciality == '                 رياضيات' ||
                    widget.speciality == '              تقني رياضي' ||
                    (widget.speciality == '            آداب و فلسفة' &&
                        widget.year == 'ثانية ثانوي')
                ? CustomBTN('فيزياء', Icons.science_outlined, widget.year,
                    widget.level, widget.speciality, widget.yearX)
                : widget.speciality == '          تسيير و إقتصاد'
                    ? CustomBTN('قانون', Icons.assignment_rounded, widget.year,
                        widget.level, widget.speciality, widget.yearX)
                    : widget.speciality == '             لغات اجنبية'
                        ? CustomBTN('لغة إسبانية', Icons.translate, widget.year,
                            widget.level, widget.speciality, widget.yearX)
                        : CustomButtonEmpty(
                            ' ', Icons.announcement, widget.year),
          ],
        ),
        widget.speciality == '              تقني رياضي'
            ? Row(
                mainAxisAlignment: MainAxisAlignment
                    .center, //Center Row contents horizontally,
                crossAxisAlignment:
                    CrossAxisAlignment.center, //Center Row contents vertically,
                children: [
                  CustomBTN(
                      'ه ميكانيكية',
                      Icons.construction_outlined,
                      widget.year,
                      widget.level,
                      widget.speciality,
                      widget.yearX),
                  CustomBTN('ه طرائق', Icons.biotech_sharp, widget.year,
                      widget.level, widget.speciality, widget.yearX)
                ],
              )
            : Text(''),
        widget.speciality == '             لغات اجنبية'
            ? Row(
                mainAxisAlignment: MainAxisAlignment
                    .center, //Center Row contents horizontally,
                crossAxisAlignment:
                    CrossAxisAlignment.center, //Center Row contents vertically,
                children: [
                  CustomBTN(
                      'لغة إيطالية',
                      Icons.my_library_books_sharp,
                      widget.year,
                      widget.level,
                      widget.speciality,
                      widget.yearX),
                  CustomBTN(
                      'لغة ألمانية',
                      Icons.insert_comment_sharp,
                      widget.year,
                      widget.level,
                      widget.speciality,
                      widget.yearX)
                ],
              )
            : Text(''),
        (widget.speciality == '            علوم تجريبية' ||
                widget.speciality == '                 رياضيات' ||
                widget.speciality == '              تقني رياضي' ||
                widget.speciality == '          تسيير و إقتصاد')
            ? Row(
                mainAxisAlignment: MainAxisAlignment
                    .center, //Center Row contents horizontally,
                crossAxisAlignment:
                    CrossAxisAlignment.center, //Center Row contents vertically,
                children: [
                  CustomBTN('فلسفة', Icons.extension, widget.year, widget.level,
                      widget.speciality, widget.yearX)
                ],
              )
            : Text(''),
      ],
    );
  }
}
