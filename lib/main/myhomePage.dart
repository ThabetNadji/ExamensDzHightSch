import 'package:flutter/material.dart';
import 'package:hidden_drawer_menu/hidden_drawer_menu.dart';
import 'package:myEduApp/main/theme.dart';
import 'package:provider/provider.dart';
import '../highSchool/showCoursesHighSchoole.dart';
import 'contactUs.dart';
import 'myHomePage2.dart';

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int estimateTs = DateTime(2023, 06, 12, 00, 00, 00).millisecondsSinceEpoch;
  List<ScreenHiddenDrawer> _pages = [];

  TextStyle myTextStyle = TextStyle(
    fontFamily: 'Kufi',
  );
  @override
  void initState() {
    super.initState();
    _pages = [
      ScreenHiddenDrawer(
          ItemHiddenMenu(
              name: '',
              baseStyle: myTextStyle,
              selectedStyle: myTextStyle,
              colorLineSelected: Colors.orange),
          myHomePage2()),
      ScreenHiddenDrawer(
          ItemHiddenMenu(
              name: 'الصفحة الرئيسية',
              baseStyle: myTextStyle,
              selectedStyle: myTextStyle,
              colorLineSelected: Colors.orange),
          myHomePage2()),
      ScreenHiddenDrawer(
          ItemHiddenMenu(
              name: 'أولى ثانوي   ',
              baseStyle: myTextStyle,
              selectedStyle: myTextStyle,
              colorLineSelected: Colors.orange),
          ShowCoursesHighSchoole(('أولى ثانوي'), ('3_high'))),
      ScreenHiddenDrawer(
          ItemHiddenMenu(
              name: 'الثانية ثانوي   ',
              baseStyle: myTextStyle,
              selectedStyle: myTextStyle,
              colorLineSelected: Colors.orange),
          ShowCoursesHighSchoole('ثانية ثانوي', ('3_high'))),
      ScreenHiddenDrawer(
          ItemHiddenMenu(
              name: 'الثالثة ثانوي   ',
              baseStyle: myTextStyle,
              selectedStyle: myTextStyle,
              colorLineSelected: Colors.orange),
          ShowCoursesHighSchoole('الثالثة ثانوي', ('3_high'))),
      ScreenHiddenDrawer(
          ItemHiddenMenu(
              name: 'تواصل معنا   ',
              baseStyle: myTextStyle,
              selectedStyle: myTextStyle,
              colorLineSelected: Colors.orange),
          contactUs())
    ];
  }

  @override
  Widget build(BuildContext context) {
    contactUs contactUS = new contactUs();
    return Consumer<ThemeProvider>(builder: (context, value, child) {
      return new MaterialApp(
          theme: value.getTheme(),
          home: HiddenDrawerMenu(
            backgroundColorContent: Colors.white,
            backgroundMenu: DecorationImage(
              scale: MediaQuery.of(context).size.width / 135,
              alignment: Alignment.topLeft,
              //isAntiAlias: false,
              //fit: BoxFit.contain,
              image: AssetImage("assets/images/myNewLogo5.png"),
            ),
            verticalScalePercent: 75.0,
            contentCornerRadius: 10.0,
            enableShadowItensMenu: true,
            withShadow: true,
            isTitleCentered: true,
            backgroundColorMenu: Color.fromARGB(0, 63, 60, 60),
            initPositionSelected: 1,
            slidePercent: MediaQuery.of(context).size.width / 5.5,
            screens: _pages,
          ));
    });
  }
}
