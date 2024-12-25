import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class FilmImage extends StatelessWidget {
  final String imageUrl;
  final double width;
  final double? height;
  final BoxFit fit;

  const FilmImage ({
    super.key,
    required this.imageUrl,
    required this.width,
    this.height,
    this.fit = BoxFit.cover,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Image.network(
        imageUrl,
        width: width,
        height: height,
        fit: fit,
        loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
          if (loadingProgress == null) {
            return child;
          } else {
            return const Center(
              child: SpinKitSpinningLines(
                color: Colors.white,
                size: 100.0,
              ),
            );
          }
        },
      ),
    );
  }
}