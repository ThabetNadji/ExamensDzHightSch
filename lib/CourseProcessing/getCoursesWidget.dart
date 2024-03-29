import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:myEduApp/Buttons/courseContentButton.dart';
import 'package:myEduApp/Buttons/courseContentButtonMore.dart';
import 'package:myEduApp/PDFreader/Viewpdf.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:myEduApp/main/MyViewModel.dart';
import 'package:provider/provider.dart';

import 'MyItem.dart';

// ignore: must_be_immutable
class GetCoursesWidgetFull extends StatefulWidget {
  Viewpdf viewpdf;
  CourseContentButton cButton;
  CourseContentButtonMore cButtonMore;
  String subject, years, tri, level, speciality, yearX;
  GetCoursesWidgetFull(this.subject, this.years, this.tri, this.level,
      this.speciality, this.yearX);
  GetCoursesWidget createState() => GetCoursesWidget();
}

class GetCoursesWidget extends State<GetCoursesWidgetFull> {
  // function_to_retrive_data_from_Firebse_Storage(high school)
  // ignore: non_constant_identifier_names
  Future<ListResult> getListCourses_High_More(String xmorePlus) {
    var listUrl = FirebaseStorage.instance
        .ref(widget.level +
            '/' +
            widget.years +
            '/' +
            widget.speciality +
            '/' +
            widget.subject +
            '/' +
            widget.tri +
            '/' +
            xmorePlus)
        .listAll();
    return listUrl;
  }

  // function_to_retrive_data_from_Firebse_Storage(high school)
  // ignore: non_constant_identifier_names
  Future<ListResult> getListCourses_High() {
    var listUrl = FirebaseStorage.instance
        .ref(widget.level +
            '/' +
            widget.years +
            '/' +
            widget.speciality +
            '/' +
            widget.subject +
            '/' +
            widget.tri)
        .listAll();
    return listUrl;
  }

  // function_to_retrive_data_from_Firebse_Storage(End bac)
  // ignore: non_constant_identifier_names
  Future<ListResult> getListCourses_Bac_End() {
    // science togather
    if (widget.speciality == 'math' ||
        widget.speciality == 'math_tech' ||
        widget.speciality == 'gestion') {
      if (widget.subject == 'arab' ||
          widget.subject == 'eng' ||
          widget.subject == 'fr') {
        widget.speciality = 'science';
      }
    }

    // hestoGeo of math and mathTech
    if (widget.speciality == 'math' || widget.speciality == 'math_tech') {
      if (widget.subject == 'geo_hes') {
        widget.speciality = 'science';
      }
    }

    // phelo of math
    if (widget.subject == 'phylo' && widget.speciality == 'math') {
      widget.speciality = 'science';
    }

    // phelo of mathTech and gestion
    if (widget.subject == 'phylo' && widget.speciality == 'gestion') {
      widget.speciality = 'math_tech';
    }

    // islam is for everybady
    if (widget.subject == 'islam') {
      widget.speciality = 'science';
    }

    //math of lettre and les langues
    if (widget.subject == 'math' && widget.speciality == 'langes') {
      widget.speciality = 'lettre';
    }

    var listUrl = FirebaseStorage.instance
        .ref(widget.years +
            '/' +
            widget.yearX +
            '/' +
            widget.speciality +
            '/' +
            widget.subject)
        .listAll();

    return listUrl;
  }

  List<MyItem> _items;

  @override
  void initState() {
    super.initState();
    _items = new List<MyItem>();
  }

// Coeur2 de l'app
  Widget getCourses() {
    int i = 0;
    return FutureBuilder<ListResult>(
      future: getListCourses_High(),
      builder: (BuildContext context, snapshot) {
        if (!snapshot.hasData) {
          return Center(
              child: Column(
            children: [
              SizedBox(
                height: 100,
              ),
              CircularProgressIndicator(),
              SizedBox(
                height: 40,
              ),
              Text('... يتم العمل على جلب البيانات '),
            ],
          ));
        } else {
          return Column(
            // ignore: non_constant_identifier_names
            children: snapshot.data.items.map((Ref) {
              //List<ExpansionPanelList> listExpansionPanelList =
              //  <ExpansionPanelList>[];

              List<CourseContentButton> listUrlPDF = <CourseContentButton>[];
              List<CourseContentButtonMore> listUrlPDFMore =
                  <CourseContentButtonMore>[];

              i++;
              if (widget.tri == 'xmore') {
                List<Reference> listRef = snapshot.data.prefixes;
                if (widget.years == "3") {
                  for (var item in listRef) {
                    // ignore: non_constant_identifier_names
                    List<CourseContentButtonMore> listUrlPDFMore_ =
                        <CourseContentButtonMore>[];

                    String fullP = item.fullPath;

                    String lastFullp = fullP.split("/")[5];
                    // List<MyItem> items = <MyItem>[];

                    _items.add(new MyItem(
                      true,
                      lastFullp,
                      Column(
                        children: [
                          SizedBox(
                            height: 30,
                          ),
                          FutureBuilder<ListResult>(
                              future: getListCourses_High_More(lastFullp),
                              builder: (BuildContext context, sn) {
                                if (!sn.hasData) {
                                  Text('no data to load');
                                } else {
                                  Container(
                                      child: Column(
                                    children: sn.data.items.map((refR) {
                                      var pdfURL = refR.getDownloadURL();

                                      listUrlPDFMore_.add(
                                        widget.cButtonMore =
                                            new CourseContentButtonMore(
                                                widget.viewpdf = new Viewpdf(
                                                    pdfURL,
                                                    i.toString(),
                                                    widget.tri,
                                                    widget.level,
                                                    widget.years,
                                                    widget.subject,
                                                    refR.fullPath,
                                                    widget.speciality),
                                                refR.fullPath,
                                                widget.years),
                                      );
                                      return (Column(children: listUrlPDF));
                                    }).toList(),
                                  ));
                                }
                                return (Column(children: listUrlPDFMore_));
                              })
                        ],
                      ),
                    ));
                  }

                  return new ExpansionPanelList(
                    expansionCallback: (int index, bool isExpanded) {
                      _items[index].isExpanded = !_items[index].isExpanded;
                      print('call back is working ');
                    },
                    children: _items.map((MyItem item) {
                      return new ExpansionPanel(
                          headerBuilder:
                              (BuildContext context, bool isExpanded) {
                            print('inside the ExpansionPanelList ');
                            return new Container(
                              padding: new EdgeInsets.all(5),
                              child: new Center(
                                child: Text(
                                  item.header,
                                  style: new TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15.0,
                                    color: Colors.orange,
                                    fontFamily: 'Kufi',
                                  ),
                                ),
                              ),
                            );
                          },
                          body: item.body,
                          isExpanded: item.isExpanded);
                    }).toList(),
                  );
                } else {
                  // not 3
                  var pdfURL = Ref.getDownloadURL();
                  listUrlPDFMore.add(widget.cButtonMore =
                      new CourseContentButtonMore(
                          widget.viewpdf = new Viewpdf(
                              pdfURL,
                              i.toString(),
                              widget.tri,
                              widget.level,
                              widget.years,
                              widget.subject,
                              Ref.fullPath,
                              widget.speciality),
                          Ref.fullPath,
                          widget.years));
                  return (Column(children: listUrlPDFMore));
                }
              } else {
                // not Xmore
                var pdfURL = Ref.getDownloadURL();
                listUrlPDF.add(widget.cButton = new CourseContentButton(
                    widget.viewpdf = new Viewpdf(
                        pdfURL,
                        i.toString(),
                        widget.tri,
                        widget.level,
                        widget.years,
                        widget.subject,
                        Ref.fullPath,
                        widget.speciality),
                    i.toString(),
                    ''));
                return (Column(children: listUrlPDF));
              }
            }).toList(),
          );
        }
      },
    );
  }

  // Coeur2 de l'app
  Widget getCoursesEnd() {
    return Container(
        child: new FutureBuilder<ListResult>(
      future: widget.speciality == 'non_'
          ? Text(
              'you have delet a function that deal with this kind of data ....')
          : getListCourses_Bac_End(),
      builder: (BuildContext context, snapshot) {
        if (!snapshot.hasData) {
          return new Column(
            children: [Text('الملفات غير متوفره الآن ...')],
          );
        } else {
          return Column(
            // ignore: non_constant_identifier_names
            children: snapshot.data.items.map((Ref) {
              List<CourseContentButton> listUrlPDF = <CourseContentButton>[];
              var pdfURL = Ref.getDownloadURL();
              String fullPath = Ref.fullPath;
              listUrlPDF.add(widget.cButton = new CourseContentButton(
                  widget.viewpdf = new Viewpdf(
                      pdfURL,
                      '',
                      '',
                      widget.level,
                      widget.years,
                      widget.subject,
                      Ref.fullPath,
                      widget.speciality),
                  fullPath,
                  'end'));
              return (Column(children: listUrlPDF));
            }).toList(),
          );
        }
      },
    ));
  }

  @override
  Widget build(BuildContext context) {
    if (widget.yearX != '') {
      return getCoursesEnd(); // bac, bem, 5_eme
    } else {
      // normal courses
      return getCourses();
    }
  }
}
