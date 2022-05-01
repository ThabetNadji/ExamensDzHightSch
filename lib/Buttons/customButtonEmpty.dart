import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomButtonEmpty extends StatelessWidget {
  String courseName;
  IconData icon;
  String years;

  CustomButtonEmpty(this.courseName, this.icon, this.years);

  // ignore: unused_element
  void _showAlert(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              content: Text("useless button ... "),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(8),
        width: 130,
        height: 45,
        // ignore: deprecated_member_use
        child: ElevatedButton.icon(
          label: Text(
            courseName,
            style: TextStyle(color: Colors.white),
          ),
          icon: Icon(
            icon,
            color: Colors.white,
          ),
          style: ElevatedButton.styleFrom(
            primary: Color.fromARGB(255, 22, 133, 66),
            onPrimary: const Color(0xFF63d471),
          ),
          onPressed: () {
            _showAlert(context);
          },
        ));
  }
}
