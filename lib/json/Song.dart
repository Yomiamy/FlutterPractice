
import 'package:json_annotation/json_annotation.dart';
part 'Song.g.dart';

@JsonSerializable()
class Song {
  final String title;
  final String lyrics;

  Song(this.title, this.lyrics);

  factory Song.fromJson(Map<String, dynamic> json) {
      return _$SongFromJson(json);
    }

  Map<String, dynamic> toJson() => _$SongToJson(this);

  @override
  String toString() {
    return "[TITLE]:: $title\n[CONTENT]::$lyrics";
  }
}