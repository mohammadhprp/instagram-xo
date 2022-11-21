import 'package:flutter/material.dart' show Image, immutable;

@immutable
class ImageWithAspectRatio {
  final Image image;
  final double aspectRatio;

  const ImageWithAspectRatio({
    required this.image,
    required this.aspectRatio,
  });
}
