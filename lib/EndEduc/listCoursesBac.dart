import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:myEduApp/main/devicesType.dart';
import 'package:myEduApp/main/theme.dart';
import 'package:provider/provider.dart';
import '../ad_helper/ad_helper.dart';
import 'dropDownListX.dart';

// ignore: must_be_immutable
class listCoursesBac extends StatefulWidget {
  String year, level;
  listCoursesBac(this.year, this.level);

  @override
  _FirstYearsState createState() => _FirstYearsState();
}

class _FirstYearsState extends State<listCoursesBac> {
  @override
  void initState() {
    AdHelper.disposeAd();
    AdHelper.myBanner.load();
    super.initState();
  }

  AdWidget adWidget = AdWidget(ad: AdHelper.myBanner);

  String speciality = '_';
  String yearX = '';
  devicesType _devicesType = new devicesType();

  @override
  Widget build(BuildContext context) {
    String devType = _devicesType.getDeviceType();
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
            bottomNavigationBar: Container(
              height: 50,
              color: Colors.black38,
              child: adWidget,
            ),
            body: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  SizedBox(
                    //Use of SizedBox
                    height: 10,
                  ),
                  devType == 'isPhone'
                      ? Text(
                          'مواضيع شهادة البكالوريا',
                          style: new TextStyle(
                              fontFamily: 'Kufi',
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.057,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        )
                      : Text(
                          'مواضيع شهادة البكالوريا',
                          style: new TextStyle(
                              fontFamily: 'Kufi',
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.03,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                  SizedBox(
                    height: 35, //Use of SizedBox
                  ),
                  SizedBox(
                    height: 05, //Use of SizedBox
                  ),
                  Center(
                      child: Column(
                    children: [
                      dropDownListX(widget.year, widget.level),
                    ],
                  ))
                ],
              ),
            )),
      );
    });
  }
}
