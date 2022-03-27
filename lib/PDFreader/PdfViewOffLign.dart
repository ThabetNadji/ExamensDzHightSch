import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:myEduApp/main/MyViewModel.dart';
import 'package:myEduApp/main/theme.dart';
import 'package:provider/provider.dart';
import 'package:fluttertoast/fluttertoast.dart';

class PdfViewOffLign extends StatefulWidget {
  final String path, fileName, tri;
  PdfViewOffLign({Key key, this.path, this.fileName, this.tri})
      : super(key: key);
  @override
  _PdfViewState createState() => _PdfViewState();
}

class _PdfViewState extends State<PdfViewOffLign> {
  bool pdfReady = false;
  int _totalPages = 0;
  int _currentPage = 0;
  int _actualPage = 1;
  PDFViewController _pdfViewController;

  void _showToast(BuildContext context, String _actualPage, String totalPage) {
    Fluttertoast.showToast(
        msg: ' الصفحة ' + _actualPage + ' / ' + totalPage,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIos: 2,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  @override
  Widget build(BuildContext context) {
    String s = widget.path.split('/').last;
    String finaleName = s.substring(0, s.indexOf('.pdf'));
    var myViewModel = Provider.of<MyViewModel>(context, listen: false);
    bool viewThemeX = myViewModel.getThemeView(); //ThemeProvider
    // ignore: non_constant_identifier_names
    var viewThemeX_ = Provider.of<ThemeProvider>(context, listen: false);
    //print('get >>>>>>>>>>>>>>>>>>>>>>>>');
    //print(widget.viewTheme.toString());
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: widget.tri != 'xmore'
              ? Text(widget.fileName,
                  style: TextStyle(
                      fontFamily: 'Kufi',
                      fontWeight: FontWeight.bold,
                      fontSize: 20))
              : Text(finaleName,
                  style: TextStyle(
                      fontFamily: 'Kufi',
                      fontWeight: FontWeight.bold,
                      fontSize: 20)),
          leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            ),
          ),
          flexibleSpace: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                decoration: viewThemeX_.getTheme() ==
                        ThemeData.light().copyWith()
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
              )
            ],
          )),
      body: Stack(
        children: <Widget>[
          SizedBox(
            width: 600, // large
            height: 30,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                        '  الصفحة ' +
                            _totalPages.toString() +
                            '/' +
                            _actualPage.toString(),
                        style: TextStyle(
                            fontFamily: 'Kufi',
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                            color: Colors.green[800])),
                  ],
                )
              ],
            ),
          ),
          Center(
            child: SizedBox(
                //width: 600,
                //height: 550,
                child: PDFView(
              filePath: widget.path,
              autoSpacing: true,
              enableSwipe: true,
              swipeHorizontal: false,
              pageFling: true,
              nightMode: viewThemeX,
              onError: (e) {
                print(e);
              },
              onRender: (_pages) {
                setState(() {
                  _totalPages = _pages;
                  pdfReady = true;
                });
              },
              onViewCreated: (PDFViewController vc) {
                _pdfViewController = vc;
              },
              onPageChanged: (int page, int total) {
                setState(() {
                  _actualPage = page + 1;
                  _showToast(context, _actualPage.toString(), total.toString());
                });
              },
              onPageError: (page, e) {},
            )),
          ),
          !pdfReady
              ? Center(
                  child: Text(
                      'حدث خطأ أثناء عملية فحص الملف، حاول فتح الملف من جديد'),
                )
              : Offstage()
        ],
      ),
    );
  }
}
