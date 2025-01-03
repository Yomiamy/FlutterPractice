import 'package:equatable/equatable.dart';

final class Post extends Equatable {

  final int? id;
  final String? title;
  final String? body;

  const Post({this.id, this.title, this.body});

  @override
  List<Object?> get props => [id, title, body];
}