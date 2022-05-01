import 'dart:io';

import 'package:flutter/material.dart';
import 'package:myEduApp/main/MyViewModel.dart';
import 'package:myEduApp/main/theme.dart';
import 'package:provider/provider.dart';
import 'package:percent_indicator/percent_indicator.dart';

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
  //PDFDocument document; //

  @override
  void initState() {
    var myViewModel = Provider.of<MyViewModel>(context, listen: false);

    widget.futureUrl.then((url) async {
      myViewModel.startDownloading(url);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
                              child: CircularPercentIndicator(
                            radius: MediaQuery.of(context).size.width * 0.30,
                            lineWidth: 10.0,
                            percent:
                                (myViewModel.getDownloadProgress().toDouble()) /
                                    100,
                            center: new Text(
                                ' % ' +
                                    myViewModel
                                        .getDownloadProgress()
                                        .toString() +
                                    '  ',
                                style: TextStyle(
                                    fontFamily: 'Kufi',
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                    color: value.getTheme() ==
                                            ThemeData.light().copyWith()
                                        ? Colors.black
                                        : Colors.white)),
                            progressColor: Colors.green[800],
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
