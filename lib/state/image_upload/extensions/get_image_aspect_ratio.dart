import 'dart:async' show Completer;

import 'package:flutter/material.dart'
    show Image, ImageConfiguration, ImageStreamListener;

extension GetImageAspectRaio on Image {
  Future<double> getAspectRatio() async {
    final completer = Completer<double>();

    image.resolve(const ImageConfiguration()).addListener(
      ImageStreamListener(
        (imageInfo, synchronousCall) {
          final aspectRatio = imageInfo.image.width / imageInfo.image.height;
          imageInfo.image.dispose();
          completer.complete(aspectRatio);
        },
      ),
    );
    return completer.future;
  }
}
