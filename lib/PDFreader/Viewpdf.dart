import 'dart:io';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:myEduApp/PDFreader/quotation.dart';
import 'package:myEduApp/main/MyViewModel.dart';
import 'package:myEduApp/main/theme.dart';
import 'package:provider/provider.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:back_button_interceptor/back_button_interceptor.dart';
import '../ad_helper/ad_helper.dart';
import '../ad_helper/interstitialAds.dart';
import 'PdfView.dart';

// ignore: must_be_immutable
class Viewpdf extends StatefulWidget {
  Future<String> futureUrl;
  String num_sub, tri, level, years, subject, fileName, speciality;
  //String pdfURL;
  Viewpdf(this.futureUrl, this.num_sub, this.tri, this.level, this.years,
      this.subject, this.fileName, this.speciality);

  setpdfURL(Future<String> url) {
    this.futureUrl = url;
  }

  @override
  _ViewpdfState createState() => _ViewpdfState();
}

class _ViewpdfState extends State<Viewpdf> {
  BuildContext backContext;
  //PDFDocument document; //
  interstitlaAds _interstitlaAds = interstitlaAds();
  quotations _quotation = new quotations();
  // AdWidget adWidget = AdWidget(ad: AdHelper.myBanner);
  /* @override
  void initState() {
    var myViewModel = Provider.of<MyViewModel>(context, listen: false);

    widget.futureUrl.then((url) async {
      myViewModel.startDownloading(url);
    });

    //AdHelper.myBanner.dispose();
    //AdHelper.myBanner.load();
    super.initState();
  }*/

  @override
  void initState() {
    print('-------------------_____________________)))))');
    print('the context is ');
    print(context);
    BackButtonInterceptor.add(myInterceptor);
    var myViewModel = Provider.of<MyViewModel>(context, listen: false);

    widget.futureUrl.then((url) async {
      myViewModel.startDownloading(url);
    });

    super.initState();
  }

  @override
  void dispose() {
    BackButtonInterceptor.remove(myInterceptor);
    super.dispose();
  }

  bool myInterceptor(bool stopDefaultButtonEvent, RouteInfo info) {
    info.currentRoute(context);
    print("BACK BUTTON1"); // Do some stuff.
    Navigator.pop(context);
    try {
      _interstitlaAds.interstitialAd.show();
    } catch (ex) {
      print('ops...');
      print('something went wrong, ads faild to load ...?');
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    backContext = context;
    var random = Random();
    int randomIndex = random.nextInt(43);
    String link;
    String fullPathFile;
    String link2;
    if (widget.tri == 'xmore') {
      try {
        if (widget.years == '3') {
          link = widget.fileName.split("/")[6];
          print(link);
        } else {
          link = widget.fileName.split("/")[5];
        }
        link2 = link;
        fullPathFile = widget.level +
            '/' +
            widget.years +
            '/' +
            widget.speciality +
            '/' +
            widget.subject +
            '/' +
            widget.tri;
      } catch (e) {
        print('something went wrong xmore....');
        print(e);
      }
    } else {
      try {
        link2 = widget.fileName.split("/")[5];
        fullPathFile = widget.level +
            '/' +
            widget.years +
            '/' +
            widget.speciality +
            '/' +
            widget.subject +
            '/' +
            widget.tri;
      } catch (e) {
        print('something went wrong ....');
        print(e);
      }
    }

    var myViewModel = Provider.of<MyViewModel>(context, listen: false);
    return Consumer<ThemeProvider>(builder: (context, value, child) {
      return MaterialApp(
          theme: value.getTheme(),
          home: Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: widget.tri != 'xmore'
                  ? Text(' النموذج رقم ' + widget.num_sub,
                      style: TextStyle(
                        fontFamily: 'Kufi',
                        fontWeight: FontWeight.bold,
                        fontSize: MediaQuery.of(context).size.height * 0.023,
                      ))
                  : Text(link,
                      style: TextStyle(
                        fontFamily: 'Kufi',
                        fontWeight: FontWeight.bold,
                        fontSize: MediaQuery.of(context).size.height * 0.023,
                      )),
              leading: InkWell(
                onTap: () {
                  try {
                    _interstitlaAds.interstitialAd.show();
                  } catch (ex) {
                    print('ops...');
                    print('something weng wrong, ads faild to load ...?');
                  }
                  Navigator.pop(context);
                },
                child: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                ),
              ),
              actions: <Widget>[
                widget.tri != ""
                    ? ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.orange,
                          onPrimary: const Color(0xFF63d471),
                        ),
                        label: Text(
                          'حفظ الملف',
                          style: TextStyle(
                            fontFamily: 'Kufi',
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize:
                                MediaQuery.of(context).size.height * 0.015,
                          ),
                        ),
                        icon: Icon(
                          Icons.download_sharp,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          myViewModel.savingFile(fullPathFile, link2, context);
                        },
                      )
                    : ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.orange,
                          onPrimary: const Color(0xFF63d471),
                        ),
                        label: Text(
                          'حفظ الملف',
                          style: TextStyle(
                              fontFamily: 'Kufi',
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize:
                                  MediaQuery.of(context).size.height * 0.015),
                        ),
                        icon: Icon(
                          Icons.download_sharp,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          myViewModel.savingFileBEM(fullPathFile, link2);
                        },
                      ),
                Container(
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
                              begin: Alignment
                                  .topLeft, //begin of the gradient color
                              end: Alignment
                                  .topRight, //end of the gradient color
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
                              begin: Alignment
                                  .topLeft, //begin of the gradient color
                              end: Alignment
                                  .topRight, //end of the gradient color
                              stops: [0, 0.2, 0.7, 0.8]),

                          borderRadius:
                              BorderRadius.circular(0), //border corner radius
                        ),
                )
              ],
            ),
            /* bottomNavigationBar: Container(
              height: 50,
              color: Colors.black38,
              child: adWidget,
            ),*/
            body: new Stack(
              children: <Widget>[
                Center(
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 4,
                    height: MediaQuery.of(context).size.height * 4,
                    child: Consumer<MyViewModel>(
                      builder: (context, myViewModel, child) {
                        if (myViewModel.getDownloadProgress() < 100) {
                          return Center(
                              child: Column(
                            children: [
                              SizedBox(width: 60, height: 70),
                              Center(
                                child: Text(
                                  ' ... جاري تحضير الملف ',
                                  style: TextStyle(
                                    fontFamily: 'Kufi',
                                    fontSize:
                                        MediaQuery.of(context).size.width *
                                            0.04,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              SizedBox(width: 60, height: 15),
                              Container(
                                  child: SingleChildScrollView(
                                child: Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 10),
                                  child: new LinearPercentIndicator(
                                    width:
                                        MediaQuery.of(context).size.width * 0.9,
                                    lineHeight:
                                        MediaQuery.of(context).size.width *
                                            0.12,
                                    //animationDuration: 2500,
                                    percent: (myViewModel
                                            .getDownloadProgress()
                                            .toDouble()) /
                                        100,
                                    center: new Text(
                                        ' % ' +
                                            myViewModel
                                                .getDownloadProgress()
                                                .toString() +
                                            '  ',
                                        style: TextStyle(
                                            fontFamily: 'Kufi',
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.06,
                                            fontWeight: FontWeight.bold,
                                            color: value.getTheme() ==
                                                    ThemeData.light().copyWith()
                                                ? Colors.black
                                                : Colors.white)),
                                    barRadius: const Radius.circular(8),
                                    //linearStrokeCap: LinearStrokeCap.round,
                                    progressColor: Colors.green[800],
                                  ),
                                ),
                              )),
                              SizedBox(width: 60, height: 30),
                              Container(
                                child: Center(
                                  child: Text(
                                      _quotation.getQutation(randomIndex),
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontFamily: 'Kufi',
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.04,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.green)),
                                ),
                              ),
                              SizedBox(width: 60, height: 60),
                              /*Container(
                                height: 50,
                                color: Colors.black38,
                                child: adWidget,
                              )*/
                            ],
                          ));
                        } else {
                          if (myViewModel.getDownloadProgress() == 100 &&
                              myViewModel.getDownloadState() == true) {
                            myViewModel.setDownloadState(false);
                            return Center(
                                child: PdfView(
                              path:
                                  '/storage/emulated/0/Android/data/com.Secondaire.ExamensDZ/files/myDownload.pdf',
                            ));
                          } else {
                            return Center(child: Text('Loading files ...'));
                          }
                        }
                      },
                    ),
                  ),
                ),
              ],
            ),
          ));
    });
  }
}

/* Center(child: PDFViewer(document: document)) */
