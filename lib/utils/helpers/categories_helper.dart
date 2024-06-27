import 'package:flutter/material.dart';

class CategoriesHelper {
  static Color getContainerColor(int index) {
    const List<Color> colors = [
      Color(0xffa4e2db),
      Color(0xfffda98a),
      Color(0xff9ebff0),
      Color(0xfff79ed6),
      Color(0xff8786fb),
      Color(0xfff58d8e),
      Color(0xff8bddf8),
      Color(0xffbca1f2),
      Color(0xff8dd5cb),
    ];
    int size = colors.length;

    return colors[index % size];
  }
}
