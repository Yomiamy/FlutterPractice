import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String id;

  const User(this.id);

  const User.empty() : this("-");

  @override
  List<Object?> get props => [id];
}
