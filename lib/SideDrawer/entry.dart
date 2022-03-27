import 'package:flutter/material.dart';

class Entry {
  final String title;

  final List<Widget> children;

  Entry(this.title, [this.children = const <Widget>[]]);
}
