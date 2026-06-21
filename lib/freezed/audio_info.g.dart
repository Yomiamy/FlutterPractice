// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'audio_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AudioInfo _$AudioInfoFromJson(Map<String, dynamic> json) => _AudioInfo(
      total: (json['total'] as num?)?.toInt(),
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => AudioItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AudioInfoToJson(_AudioInfo instance) =>
    <String, dynamic>{
      'total': instance.total,
      'data': instance.data,
    };
