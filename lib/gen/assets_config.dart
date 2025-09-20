import 'package:flutter/material.dart';
import 'package:flutter_practice/gen/colors.gen.dart';

import '../gen/assets.gen.dart';

typedef AssetColorRes = ColorName;

$AssetsImagesGen AssetImageRes = Assets.images;

$AssetsVideoGen AssetVideoRes = Assets.video;

$AssetsAudioGen AssetAudioRes = Assets.audio;

extension AssetGenImageExtension on AssetGenImage {
  Image get imageFile => image(fit: BoxFit.cover);

  ImageProvider get fileProvider => provider();
}
