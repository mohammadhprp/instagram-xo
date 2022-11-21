import 'dart:io' show File;

import 'package:flutter/material.dart' as material show Image;

import '../typedefs/file_path.dart';
import 'get_image_aspect_ratio.dart';

extension GetImageFileAspectRatio on FilePath {
  Future<double> getAspectRatio() {
    final file = File(this);
    final image = material.Image.file(file);
    return image.getAspectRatio();
  }
}
