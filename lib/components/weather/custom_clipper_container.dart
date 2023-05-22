import 'package:flutter/material.dart';
import 'dart:math' as math;

class CustomClipperContainer extends StatelessWidget {
  final Widget child;

  const CustomClipperContainer({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      clipper: MyCustomClipper(
        clipHeight: MediaQuery.of(context).size.height - 220,
      ),
      child: child,
    );
  }
}

class MyCustomClipper extends CustomClipper<Rect> {
  final double clipHeight;

  MyCustomClipper({required this.clipHeight});

  @override
  getClip(Size size) {
    double top = math.max(size.height - clipHeight, 0);
    Rect rect = Rect.fromLTRB(0.0, top, size.width, size.height);
    return rect;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) {
    return false;
  }
}
