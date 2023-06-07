import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:simple_calendar/theme/spacing.dart';

class NetworkImageContainer extends StatelessWidget {
  final String imageUrl;
  final double width;
  final double height;

  const NetworkImageContainer({
    super.key,
    required this.imageUrl,
    required this.width,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      fit: BoxFit.cover,
      width: width,
      height: height,
      placeholder: (context, url) {
        return SizedBox(
          width: width,
          height: height,
          child: const Center(
            child: SizedBox(
              width: Spacing.l,
              height: Spacing.l,
              child: CircularProgressIndicator(),
            ),
          ),
        );
      },
      errorWidget: (context, url, error) {
        return Image.asset(
          'statics/images/default.jpg',
          fit: BoxFit.cover,
          width: width,
          height: height,
        );
      },
    );
  }
}
