import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/image.dart';
import 'package:flutter_practice/gen/colors.gen.dart';
import '../gen/assets.gen.dart';

typedef AssetColorRes = ColorName;

$AssetsImagesGen AssetImageRes = Assets.images;

extension AssetGenImageExtension on AssetGenImage {
  Image get imageFile => image(fit: BoxFit.cover);
  ImageProvider get fileProvider => provider();
}