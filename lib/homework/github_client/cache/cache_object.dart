import 'package:dio/dio.dart';

class CacheObject {
  final Response response;
  final int timeStamp;

  CacheObject({required this.response}) : timeStamp = DateTime.now().millisecondsSinceEpoch;

  @override
  bool operator ==(Object other) => response.hashCode == other.hashCode;

  @override
  int get hashCode => response.realUri.hashCode;
}
