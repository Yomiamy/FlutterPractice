
import 'package:dio/dio.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

import 'DioClient.dart';
import 'Quiz.dart';

part 'Practice_227API.g.dart';

@RestApi(baseUrl: "https://opentdb.com")
abstract class Practice_227API {

  factory Practice_227API(Dio dio, {String? baseUrl}) = _Practice_227API;
  
  @GET("/api.php")
  Future<Quiz> getQuestionInfo(@Query("amount") int amount, @Query("type") String type);

}


final dioClient = DioClient();
final practice_227APIClient = Practice_227API(dioClient.dio);