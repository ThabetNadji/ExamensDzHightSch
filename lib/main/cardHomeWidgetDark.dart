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
        height: 165,
        width: 310,
        decoration: BoxDecoration(
          image: DecorationImage(
            alignment: Alignment.centerLeft,
            image: AssetImage(
              widget.image,
            ),
            //fit: BoxFit.none,
          ),
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
          borderRadius: BorderRadius.circular(10), //border corner radius
        ),
        child: Column(
          children: <Widget>[
            Align(
              alignment: Alignment.topRight,
              child: Container(
                // color: Colors.white,
                // ignore: deprecated_member_use
                child: Text(widget.textDetail,
                    textDirection: TextDirection.rtl,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontFamily: 'Kufi',
                        fontWeight: FontWeight.bold)),
              ),
            ),
            Spacer(),
            Align(
              alignment: Alignment.bottomRight,
              child: Container(
                // ignore: deprecated_member_use
                child: RaisedButton(
                  onPressed: () {
                    branch br = new branch(get_year(), get_level());
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) => br));
                  },
                  shape: RoundedRectangleBorder(
                      side: BorderSide(color: Colors.green, width: 1)),
                  padding: EdgeInsets.all(1.0),
                  child: Ink(
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            const Color(0xFF166D3B),
                            const Color(0xFF166D3B),
                          ],
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                        ),
                        borderRadius: BorderRadius.circular(00.0)),
                    child: Container(
                      constraints: BoxConstraints(
                          maxWidth: 100.0, minHeight: 35.0), // button size
                      alignment: Alignment.center,
                      child: RichText(
                        text: TextSpan(
                          children: [
                            WidgetSpan(
                              child: Icon(Icons.arrow_back_ios_sharp, size: 20),
                            ),
                            TextSpan(
                                text: ' ' + widget.textButton,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontFamily: 'Kufi',
                                    fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
