import 'package:flutter/material.dart';

class TextFieldStyle {
  static OutlineInputBorder appOutlineInputBorder(
      {Color? color, required double radius}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(radius),
      borderSide:
          BorderSide(width: 2, color: color ?? Colors.black.withOpacity(0.4)),
    );
  }
}
