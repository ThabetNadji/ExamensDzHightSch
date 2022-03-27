import 'package:flutter/material.dart';

class CustomAlertDialog extends StatelessWidget {
  final Color bgColor;
  final String title;
  final String message;
  final String positiveBtnText;
  final String negativeBtnText;
  final Function onPostivePressed;
  final Function onNegativePressed;
  final double circularBorderRadius;

  CustomAlertDialog({
    this.title,
    this.message,
    this.circularBorderRadius = 30.0,
    this.bgColor = Colors.black87,
    this.positiveBtnText,
    this.negativeBtnText,
    this.onPostivePressed,
    this.onNegativePressed,
  })  : assert(bgColor != null),
        assert(circularBorderRadius != null);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: Text(message),
      backgroundColor: bgColor,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(circularBorderRadius)),
      actions: <Widget>[
        negativeBtnText != null
            ? FlatButton(
                child: Text(negativeBtnText),
                textColor: Theme.of(context).accentColor,
                onPressed: () {
                  Navigator.of(context).pop();
                  if (onNegativePressed != null) {
                    onNegativePressed();
                  }
                },
              )
            : null,
        positiveBtnText != null
            ? FlatButton(
                child: Text(positiveBtnText),
                textColor: Theme.of(context).accentColor,
                onPressed: () {
                  if (onPostivePressed != null) {
                    onPostivePressed();
                    Navigator.of(context, rootNavigator: true).pop();
                  }
                },
              )
            : null,
      ],
    );
  }
}
