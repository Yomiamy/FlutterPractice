/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/bg_dice_game.png
  AssetGenImage get bgDiceGame =>
      const AssetGenImage('assets/images/bg_dice_game.png');

  /// File path: assets/images/dice_1.png
  AssetGenImage get dice1 => const AssetGenImage('assets/images/dice_1.png');

  /// File path: assets/images/dice_2.png
  AssetGenImage get dice2 => const AssetGenImage('assets/images/dice_2.png');

  /// File path: assets/images/dice_3.png
  AssetGenImage get dice3 => const AssetGenImage('assets/images/dice_3.png');

  /// File path: assets/images/dice_4.png
  AssetGenImage get dice4 => const AssetGenImage('assets/images/dice_4.png');

  /// File path: assets/images/dice_5.png
  AssetGenImage get dice5 => const AssetGenImage('assets/images/dice_5.png');

  /// File path: assets/images/dice_6.png
  AssetGenImage get dice6 => const AssetGenImage('assets/images/dice_6.png');

  /// File path: assets/images/image.jpg
  AssetGenImage get image => const AssetGenImage('assets/images/image.jpg');

  /// File path: assets/images/search_icon.png
  AssetGenImage get searchIcon =>
      const AssetGenImage('assets/images/search_icon.png');

  /// File path: assets/images/three_pig_page1.jpg
  AssetGenImage get threePigPage1 =>
      const AssetGenImage('assets/images/three_pig_page1.jpg');

  /// File path: assets/images/three_pig_page10.jpg
  AssetGenImage get threePigPage10 =>
      const AssetGenImage('assets/images/three_pig_page10.jpg');

  /// File path: assets/images/three_pig_page2.jpg
  AssetGenImage get threePigPage2 =>
      const AssetGenImage('assets/images/three_pig_page2.jpg');

  /// File path: assets/images/three_pig_page3.jpg
  AssetGenImage get threePigPage3 =>
      const AssetGenImage('assets/images/three_pig_page3.jpg');

  /// File path: assets/images/three_pig_page4.jpg
  AssetGenImage get threePigPage4 =>
      const AssetGenImage('assets/images/three_pig_page4.jpg');

  /// File path: assets/images/three_pig_page5.jpg
  AssetGenImage get threePigPage5 =>
      const AssetGenImage('assets/images/three_pig_page5.jpg');

  /// File path: assets/images/three_pig_page6.jpg
  AssetGenImage get threePigPage6 =>
      const AssetGenImage('assets/images/three_pig_page6.jpg');

  /// File path: assets/images/three_pig_page7.jpg
  AssetGenImage get threePigPage7 =>
      const AssetGenImage('assets/images/three_pig_page7.jpg');

  /// File path: assets/images/three_pig_page8.jpg
  AssetGenImage get threePigPage8 =>
      const AssetGenImage('assets/images/three_pig_page8.jpg');

  /// File path: assets/images/three_pig_page9.jpg
  AssetGenImage get threePigPage9 =>
      const AssetGenImage('assets/images/three_pig_page9.jpg');

  /// List of all assets
  List<AssetGenImage> get values => [
        bgDiceGame,
        dice1,
        dice2,
        dice3,
        dice4,
        dice5,
        dice6,
        image,
        searchIcon,
        threePigPage1,
        threePigPage10,
        threePigPage2,
        threePigPage3,
        threePigPage4,
        threePigPage5,
        threePigPage6,
        threePigPage7,
        threePigPage8,
        threePigPage9
      ];
}

class Assets {
  Assets._();

  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage {
  const AssetGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
  });

  final String _assetName;

  final Size? size;
  final Set<String> flavors;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = true,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
