import 'package:freezed_annotation/freezed_annotation.dart';

part 'audio_item.freezed.dart';
part 'audio_item.g.dart';

@freezed
abstract class AudioItem with _$AudioItem {
  const factory AudioItem({
    int? id,
    String? title,
    String? summary,
    String? url,
    String? fileExt,
    String? modified,
  }) = _AudioItem;
  factory AudioItem.fromJson(Map<String, dynamic> json) =>
      _$AudioItemFromJson(json);
}
