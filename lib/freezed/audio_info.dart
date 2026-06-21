import 'package:freezed_annotation/freezed_annotation.dart';

import 'audio_item.dart';

part 'audio_info.freezed.dart';
part 'audio_info.g.dart';

// "https://www.travel.taipei/open-api/zh-tw/Media/Audio";

@freezed
abstract class AudioInfo with _$AudioInfo {
  const factory AudioInfo({
    int? total,
    List<AudioItem>? data,
  }) = _AudioInfo;
  factory AudioInfo.fromJson(Map<String, dynamic> json) =>
      _$AudioInfoFromJson(json);
}
