import 'package:flutter/material.dart';
import './entryItem.dart';
import './entry.dart';
import './initData.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:url_launcher/url_launcher.dart';

// ignore: must_be_immutable
class SideDrawer extends StatelessWidget {
  // ignore: non_constant_identifier_names
  var initData_ = InitData();
  List<Entry> data;

  void _showToast(BuildContext context) {
    Fluttertoast.showToast(
        msg: 'إنتظرونا قربيا',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIos: 2,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  _launchURL(String newUrl) async {
    String url = newUrl;
    print('------>>>>');

    if (await canLaunch(url)) {
      print('url opned ...');
      await launch(url);
    } else {
      print('cant open this url ...');
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    data = initData_.getData(context);

    return Drawer(
      child: Column(
        children: <Widget>[
          DrawerHeader(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/myNewLogo5.png"),
                  //fit: BoxFit.cover,
                ),
                gradient: LinearGradient(
                    /*colors: [
                  Colors.cyan,
                  Colors.indigo,
                ]*/
                    colors: [
                      const Color(0xFF167F57),
                      const Color(0xFF167F77),
                      const Color(0xFF167F82),
                      const Color(0xFF167F99)
                      //add more colors for gradient
                    ],
                    begin: Alignment.topLeft, //begin of the gradient color
                    end: Alignment.topRight, //end of the gradient color
                    stops: [0, 0.2, 0.7, 0.8] //stops for individual color
                    //set the stops number equal to numbers of color
                    ),
              ),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topCenter,
                    child: Text(
                      '',
                      style: TextStyle(
                          color: Colors.orange,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Kufi'),
                    ),
                  )
                ],
              )),
          Expanded(
            child: ListView.builder(
              itemBuilder: (BuildContext context, int index) =>
                  EntryItem(data[index]),
              itemCount: data.length,
            ),
          ),
          Container(
            height: 30,
            width: 275,
            decoration: BoxDecoration(
                color: Colors.green, borderRadius: BorderRadius.circular(5)),
            child: Row(
              children: [
                FlatButton.icon(
                    onPressed: () => _launchURL(
                        'https://play.google.com/store/apps/details?id=com.Moyenne.ExamensDZ'),
                    icon: Icon(
                      Icons.file_download,
                      color: Colors.orange,
                    ),
                    label: Text('')),
                Text('   تطبيقنا الخاص بالتعليم المتوسط    ',
                    textDirection: TextDirection.rtl,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: MediaQuery.of(context).size.height * 0.012,
                        fontFamily: 'Kufi',
                        fontWeight: FontWeight.bold)),
              ],
            ),
          ),
          SizedBox(
            height: 25, //Use of SizedBox
          ),
          Container(
            height: 30,
            width: 275,
            decoration: BoxDecoration(
                color: Colors.green, borderRadius: BorderRadius.circular(5)),
            child: Row(
              children: [
                FlatButton.icon(
                    onPressed: () => _launchURL(
                        'https://play.google.com/store/apps/details?id=com.Premaire.ExamensDZ'),
                    icon: Icon(
                      Icons.file_download,
                      color: Colors.orange,
                    ),
                    label: Text('')),
                Text('   تطبيقنا الخاص بالتعليم الإبتدائي    ',
                    textDirection: TextDirection.rtl,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: MediaQuery.of(context).size.height * 0.012,
                        fontFamily: 'Kufi',
                        fontWeight: FontWeight.bold)),
              ],
            ),
          ),
          SizedBox(
            height: 20, //Use of SizedBox
          )
        ],
      ),
    );
  }
}
