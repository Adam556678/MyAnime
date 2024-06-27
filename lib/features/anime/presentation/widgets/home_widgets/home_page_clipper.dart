import 'package:flutter/material.dart';

class HomePageClipper extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height / 4);

    var firstCtrlPoint = Offset(size.width / 4, size.height / 3);
    var firstCtrlEndPoint = Offset(size.width / 2, size.height / 3 - 60);

    var secondCtrlPoint = Offset(3 * size.width / 4, size.height / 4 - 65);
    var secondCtrlEndPoint = Offset(size.width, size.height / 3 - 40);

    path.quadraticBezierTo(firstCtrlPoint.dx, firstCtrlPoint.dy,
        firstCtrlEndPoint.dx, firstCtrlEndPoint.dy);

    path.quadraticBezierTo(secondCtrlPoint.dx, secondCtrlPoint.dy,
        secondCtrlEndPoint.dx, secondCtrlEndPoint.dy);

    path.lineTo(size.width, 0);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper oldClipper) {
    return false;
  }
}
