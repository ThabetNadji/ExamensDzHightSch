import 'package:flutter/material.dart';
import 'package:myEduApp/Buttons/customButton.dart';
import 'package:myEduApp/Buttons/customButtonEmpty.dart';
import 'package:myEduApp/main/theme.dart';
import 'package:provider/provider.dart';

class ShowCoureses_ extends StatefulWidget {
  String year, level, speciality;
  ShowCoureses_(this.year, this.level, this.speciality);
  @override
  _ShowCoureses2State createState() => _ShowCoureses2State();
}

class _ShowCoureses2State extends State<ShowCoureses_> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(builder: (context, value, child) {
      return SizedBox(
          height: 700,
          width: 400,
          child: Column(
            children: <Widget>[
              SizedBox(
                //Use of SizedBox
                height: 40,
              ),
              Center(
                child: value.getTheme() == ThemeData.light().copyWith()
                    ? Text(
                        'قائمة المواد ',
                        style: new TextStyle(
                            fontSize: 20.0,
                            color: Colors.black,
                            fontFamily: 'Kufi'),
                      )
                    : Text(
                        'قائمة المواد',
                        style: new TextStyle(
                            fontSize: 20.0,
                            color: Colors.white,
                            fontFamily: 'Kufi'),
                      ),
              ),
              Center(
                child: Text(
                  widget.speciality + '          ',
                  style: TextStyle(
                      color: Colors.green,
                      fontSize: 13,
                      fontFamily: 'Kufi',
                      fontWeight: FontWeight.bold),
                ),
              ), //widget.speciality
              SizedBox(
                height: 05, //Use of SizedBox
              ),
              SizedBox(
                height: 25, //Use of SizedBoxs
              ),
              Flexible(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment
                      .center, //Center Row contents horizontally,
                  crossAxisAlignment: CrossAxisAlignment
                      .center, //Center Row contents vertically,
                  children: [
                    CustomBTN('لغة عربية', Icons.auto_stories, widget.year,
                        widget.level, widget.speciality, ''),
                    CustomBTN('رياضيات', Icons.calculate, widget.year,
                        widget.level, widget.speciality, '')
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
                    widget.speciality == '            علوم تجريبية' ||
                            widget.speciality == '                 رياضيات' ||
                            (widget.speciality == '            آداب و فلسفة' &&
                                widget.year == 'ثانية ثانوي')
                        ? CustomBTN('علوم الطبيعة', Icons.biotech_sharp,
                            widget.year, widget.level, widget.speciality, '')
                        : widget.speciality == '          تسيير و إقتصاد'
                            ? CustomBTN(
                                'إ و المناجمنت',
                                Icons.attach_money_outlined,
                                widget.year,
                                widget.level,
                                widget.speciality,
                                '')
                            : widget.speciality == '             لغات اجنبية'
                                ? CustomBTN(
                                    'فلسفة',
                                    Icons.extension,
                                    widget.year,
                                    widget.level,
                                    widget.speciality,
                                    '')
                                : widget.speciality ==
                                        '              تقني رياضي'
                                    ? CustomBTN(
                                        'ه مدنية',
                                        Icons.engineering_rounded,
                                        widget.year,
                                        widget.level,
                                        widget.speciality,
                                        '')
                                    : CustomButtonEmpty(
                                        ' ', Icons.announcement, widget.year),
                    CustomBTN('إسلامية', Icons.brightness_low_outlined,
                        widget.year, widget.level, widget.speciality, ''),
                  ],
                ),
              ),
              Flexible(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment
                      .center, //Center Row contents horizontally,
                  crossAxisAlignment: CrossAxisAlignment
                      .center, //Center Row contents vertically, av_timer_outlined
                  children: [
                    widget.speciality == '            آداب و فلسفة'
                        ? CustomBTN('فلسفة', Icons.extension, widget.year,
                            widget.level, widget.speciality, '')
                        : widget.speciality == '          تسيير و إقتصاد'
                            ? CustomBTN(
                                'تسيير مالي',
                                Icons.euro_rounded,
                                widget.year,
                                widget.level,
                                widget.speciality,
                                '')
                            : widget.speciality == '              تقني رياضي'
                                ? CustomBTN(
                                    'ه كهربائية',
                                    Icons.electrical_services_sharp,
                                    widget.year,
                                    widget.level,
                                    widget.speciality,
                                    '')
                                : CustomButtonEmpty(
                                    ' ', Icons.announcement, widget.year),
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
                        widget.level, widget.speciality, ''),
                    CustomBTN('فرنسية', Icons.language, widget.year,
                        widget.level, widget.speciality, ''),
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
                    CustomBTN('إنجليزية', Icons.g_translate_sharp, widget.year,
                        widget.level, widget.speciality, ''),
                    widget.speciality == '            علوم تجريبية' ||
                            widget.speciality == '                 رياضيات' ||
                            widget.speciality == '              تقني رياضي' ||
                            (widget.speciality == '            آداب و فلسفة' &&
                                widget.year == 'ثانية ثانوي')
                        ? CustomBTN('فيزياء', Icons.science_outlined,
                            widget.year, widget.level, widget.speciality, '')
                        : widget.speciality == '          تسيير و إقتصاد'
                            ? CustomBTN(
                                'قانون',
                                Icons.assignment_rounded,
                                widget.year,
                                widget.level,
                                widget.speciality,
                                '')
                            : widget.speciality == '             لغات اجنبية'
                                ? CustomBTN(
                                    'لغة إسبانية',
                                    Icons.translate,
                                    widget.year,
                                    widget.level,
                                    widget.speciality,
                                    '')
                                : CustomButtonEmpty(
                                    ' ', Icons.announcement, widget.year),
                  ],
                ),
              ),
              //'              تقني رياضي'
              widget.speciality == '              تقني رياضي'
                  ? Flexible(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment
                            .center, //Center Row contents horizontally,
                        crossAxisAlignment: CrossAxisAlignment
                            .center, //Center Row contents vertically,
                        children: [
                          CustomBTN('ه ميكانيكية', Icons.construction_outlined,
                              widget.year, widget.level, widget.speciality, ''),
                          CustomBTN('ه طرائق', Icons.biotech_sharp, widget.year,
                              widget.level, widget.speciality, '')
                        ],
                      ),
                    )
                  : SizedBox(),

              //'          تسيير و إقتصاد'

              //'          تسيير و إقتصاد' //plagiarism_outlined

              //'             لغات اجنبية'
              widget.speciality == '             لغات اجنبية'
                  ? Flexible(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment
                            .center, //Center Row contents horizontally,
                        crossAxisAlignment: CrossAxisAlignment
                            .center, //Center Row contents vertically,
                        children: [
                          CustomBTN('لغة إيطالية', Icons.my_library_books_sharp,
                              widget.year, widget.level, widget.speciality, ''),
                          CustomBTN('لغة ألمانية', Icons.insert_comment_sharp,
                              widget.year, widget.level, widget.speciality, '')
                        ],
                      ),
                    )
                  : SizedBox(),

              (widget.speciality == '            علوم تجريبية' ||
                          widget.speciality == '                 رياضيات' ||
                          widget.speciality == '              تقني رياضي' ||
                          widget.speciality == '          تسيير و إقتصاد') &&
                      (widget.year == 'الثالثة ثانوي')
                  ? Flexible(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment
                            .center, //Center Row contents horizontally,
                        crossAxisAlignment: CrossAxisAlignment
                            .center, //Center Row contents vertically,
                        children: [
                          CustomBTN('فلسفة', Icons.extension, widget.year,
                              widget.level, widget.speciality, '')
                        ],
                      ),
                    )
                  : SizedBox(),
            ],
          ));
    });
  }
}
