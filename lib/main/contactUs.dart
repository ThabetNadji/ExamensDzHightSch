import 'package:flutter/material.dart';
import 'package:myEduApp/main/theme.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class contactUs extends StatelessWidget {
  String now = DateTime.now().year.toString();

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
    return Consumer<ThemeProvider>(builder: (context, value, child) {
      return Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 50),
          child: Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
            SizedBox(
              height: MediaQuery.of(context).size.width / 35,
            ),
            Text('-  تواصل معنا ',
                textDirection: TextDirection.rtl,
                style: new TextStyle(
                    fontSize: MediaQuery.of(context).size.height * 0.018,
                    //color: Colors.green,
                    fontFamily: 'Kufi',
                    fontWeight: FontWeight.bold)),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 15),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Image(
                          image: const AssetImage(
                              'assets/images/facebook_image.jpeg'),
                          height: MediaQuery.of(context).size.height / 15,
                          width: MediaQuery.of(context).size.width / 8,
                        ),
                        InkWell(
                            child: new Text('صفحتنا على الفايسبوك',
                                style: TextStyle(
                                    fontFamily: 'Kufi',
                                    fontSize:
                                        MediaQuery.of(context).size.width / 35,
                                    fontWeight: FontWeight.bold)),
                            onTap: () => launch(
                                'https://www.facebook.com/profile.php?id=100067786252229')),
                      ],
                    ),
                    Column(
                      children: [
                        Image(
                          image: const AssetImage('assets/images/at.png'),
                          height: MediaQuery.of(context).size.height / 15,
                          width: MediaQuery.of(context).size.width / 8,
                        ),
                        Column(
                          children: [
                            Text('البريد الإلكتروني',
                                style: TextStyle(
                                    fontFamily: 'Kufi',
                                    fontSize:
                                        MediaQuery.of(context).size.width / 35,
                                    fontWeight: FontWeight.bold)),
                            SelectableText('myeducapphighschool@gmail.com',
                                style: TextStyle(
                                    fontFamily: 'Kufi',
                                    fontSize:
                                        MediaQuery.of(context).size.width / 35,
                                    color: Colors.green,
                                    fontWeight: FontWeight.bold)),
                          ],
                        )
                      ],
                    )
                  ]),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
              child: InkWell(
                  child: new Text(' سياسة الخصوصية -',
                      style: TextStyle(
                          fontFamily: 'Kufi',
                          fontSize: MediaQuery.of(context).size.width / 28,
                          fontWeight: FontWeight.bold)),
                  onTap: () => launch(
                      'https://examensdz.blogspot.com/2021/05/privacy-policy-nadji-thabet-built.html')),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
              child: InkWell(
                  child: new Text(' قيمنا على متجر التطبيقات -',
                      style: TextStyle(
                          fontFamily: 'Kufi',
                          fontSize: MediaQuery.of(context).size.width / 28,
                          fontWeight: FontWeight.bold)),
                  onTap: () => launch(
                      'https://play.google.com/store/apps/details?id=com.Secondaire.ExamensDZ')),
            ),
            //Divider(height: 10, endIndent: 50, indent: 50, color: Colors.white),
            Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
                child: Container(
                  height: 30,
                  width: 275,
                  decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(5)),
                  child: Row(
                    children: [
                      TextButton.icon(
                          onPressed: () => _launchURL(
                              'https://play.google.com/store/apps/details?id=com.Moyenne.ExamensDZ'),
                          icon: Icon(
                            Icons.file_download,
                            color: Colors.orange,
                          ),
                          label: Text('')),
                      Text('  تحميل تطبيقنا الخاص بالتعليم المتوسط    ',
                          textDirection: TextDirection.rtl,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize:
                                  MediaQuery.of(context).size.height * 0.012,
                              fontFamily: 'Kufi',
                              fontWeight: FontWeight.bold)),
                    ],
                  ),
                )),
            Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
                child: Container(
                  height: 30,
                  width: 275,
                  decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(5)),
                  child: Row(
                    children: [
                      TextButton.icon(
                          onPressed: () => _launchURL(
                              'https://play.google.com/store/apps/details?id=com.Premaire.ExamensDZ'),
                          icon: Icon(
                            Icons.file_download,
                            color: Colors.orange,
                          ),
                          label: Text('')),
                      Text('  تحميل تطبيقنا الخاص بالتعليم الإبتدائي    ',
                          textDirection: TextDirection.rtl,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize:
                                  MediaQuery.of(context).size.height * 0.012,
                              fontFamily: 'Kufi',
                              fontWeight: FontWeight.bold)),
                    ],
                  ),
                )),

            //padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
            Divider(height: 10, endIndent: 50, indent: 50, color: Colors.white),
            Center(
                child: Text(now + '  ExamensDZ  جميع الحقوق محفوظة    ',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: 'Kufi',
                        fontSize: MediaQuery.of(context).size.height * 0.012,
                        fontWeight: FontWeight.bold))),
          ]),
        ),
      );
    });
  }
}
