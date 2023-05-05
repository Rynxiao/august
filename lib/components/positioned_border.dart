import 'package:flutter/material.dart';

import '../theme/spacing.dart';

class PositionedBorder extends StatelessWidget {
  final Color color;
  final double width;

  const PositionedBorder(
      {super.key, required this.color, this.width = Spacing.two});

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
        child: Container(
      margin: const EdgeInsets.all(Spacing.xxs),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Spacing.xs),
        border: Border.all(
          color: color,
          width: width,
        ),
      ),
    ));
  }
}
