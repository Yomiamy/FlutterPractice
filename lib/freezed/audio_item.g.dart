// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'audio_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AudioItem _$AudioItemFromJson(Map<String, dynamic> json) => _AudioItem(
      id: (json['id'] as num?)?.toInt(),
      title: json['title'] as String?,
      summary: json['summary'] as String?,
      url: json['url'] as String?,
      fileExt: json['fileExt'] as String?,
      modified: json['modified'] as String?,
    );

Map<String, dynamic> _$AudioItemToJson(_AudioItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'summary': instance.summary,
      'url': instance.url,
      'fileExt': instance.fileExt,
      'modified': instance.modified,
    };
