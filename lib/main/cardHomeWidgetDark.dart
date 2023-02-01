import 'package:flutter/material.dart';

import 'branch.dart';

class cardHomeWidgetDark extends StatefulWidget {
  String image, textDetail, textButton, year, level;

  cardHomeWidgetDark(
      this.image, this.textDetail, this.textButton, this.year, this.level);
  @override
  _cardHomeWidgetState createState() => _cardHomeWidgetState();
}

class _cardHomeWidgetState extends State<cardHomeWidgetDark> {
  String get_year() {
    return widget.year;
  }

  String get_level() {
    return widget.level;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        height: MediaQuery.of(context).size.height * 0.28, //165, //235,
        width: MediaQuery.of(context).size.width * 0.9, //310
        decoration: BoxDecoration(
          image: DecorationImage(
            alignment: Alignment.centerLeft,
            image: AssetImage(
              widget.image,
            ),
            //fit: BoxFit.none,
          ),
          color: Color.fromARGB(199, 0, 0, 0),
          border: Border.all(width: 2, color: Color.fromARGB(179, 37, 37, 37)),
          borderRadius: BorderRadius.circular(7),

          gradient: LinearGradient(
            colors: [
              //	52, 67, 90
              Color(0x0028313B), //485461 2C3E50
              Color(0x002C3E50) //0x001A1A1B
              //add more colors for gradient
            ],
            begin: Alignment.topCenter, //begin of the gradient color
            end: Alignment.bottomCenter, //end of the gradient color
            //stops for individual color
            //set the stops number equal to numbers of color
          ),
          //border corner radius
        ),
        child: Column(
          children: <Widget>[
            Align(
              alignment: Alignment.topRight,
              child: Container(
                child: Padding(
                    padding: const EdgeInsets.only(
                      left: 7.0,
                      right: 7.0,
                    ),
                    child: Text(widget.textDetail,
                        textDirection: TextDirection.rtl,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: MediaQuery.of(context).size.height * 0.02,
                            fontFamily: 'Kufi',
                            fontWeight: FontWeight.bold))),
              ),
            ),
            Spacer(),
            Align(
              alignment: Alignment.bottomRight,
              child: InkWell(
                onTap: () {
                  branch br = new branch(get_year(), get_level());
                  Navigator.push(context,
                      MaterialPageRoute(builder: (BuildContext context) => br));
                },
                //shape: RoundedRectangleBorder(side: BorderSide(color: Colors.green, width: 1)),
                //padding: EdgeInsets.all(1.0),
                child: Ink(
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                            text: ' BAC ',
                            style: new TextStyle(
                                height: 1.5,
                                fontSize:
                                    MediaQuery.of(context).size.height * 0.025,
                                color: Colors.green,
                                fontFamily: 'Kufi',
                                fontWeight: FontWeight.bold)),
                        WidgetSpan(
                          child: Icon(
                            Icons.keyboard_arrow_right,
                            size: MediaQuery.of(context).size.height * 0.03,
                            color: Colors.green,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
