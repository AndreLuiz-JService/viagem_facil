import 'package:flutter/material.dart';

class ClipHome extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(size.width, 0.0);
    path.lineTo(size.width, size.height * 0.1);
    path.lineTo(size.width * 0.98, size.height * 0.15);
    path.lineTo(size.width * 0.4, size.height);
    path.lineTo(0.0, size.height);
    return path;
    throw UnimplementedError();
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return oldClipper != this;
    throw UnimplementedError();
  }
}