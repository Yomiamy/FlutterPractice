// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';

part 'Quiz.g.dart';

@JsonSerializable()
class Quiz {
  @JsonKey(name: "response_code")
  final int responseCode;
  @JsonKey(name: "results")
  final List<Result>? results;

  Quiz({
    required this.responseCode,
    required this.results,
  });

  factory Quiz.fromJson(Map<String, dynamic> json) => _$QuizFromJson(json);

  Map<String, dynamic> toJson() => _$QuizToJson(this);
}

@JsonSerializable()
class Result {
  final String? type;
  final String? difficulty;
  final String? category;
  final String? question;
  @JsonKey(name: "correct_answer")
  final String? correctAnswer;
  @JsonKey(name: "incorrect_answers")
  final List<String>? incorrectAnswers;

  Result({
    required this.type,
    required this.difficulty,
    required this.category,
    required this.question,
    required this.correctAnswer,
    required this.incorrectAnswers,
  });

  factory Result.fromJson(Map<String, dynamic> json) => _$ResultFromJson(json);

  Map<String, dynamic> toJson() => _$ResultToJson(this);
}
