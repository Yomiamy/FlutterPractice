

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_practice/gen/assets_config.dart';
import 'package:flutter_practice/homework/Practice_227API.dart';

class Practice227 extends StatefulWidget {
  const Practice227({super.key});

  @override
  State<Practice227> createState() => _Practice227State();
}

class _Practice227State extends State<Practice227> {
  @override
  Widget build(BuildContext context) {
    practice_227APIClient.getQuestionInfo(10, "boolean").then((quiz) {
      debugPrint("");
    }).catchError((error) {
      switch(error.runtimeType) {
        case DioException _:
          final res = (error as DioException).response;
          debugPrint('Got error : ${res?.statusCode} -> ${res?.statusMessage}');
          break;
        default:
          break;
      }
    });
    
    
    return CupertinoPageScaffold(
        navigationBar: const CupertinoNavigationBar(
          padding: EdgeInsetsDirectional.zero,
          middle: Text("Practice227"),
        ),
        child: SafeArea(child: Container(
          padding: const EdgeInsets.fromLTRB(15, 40, 15, 20),
          width: MediaQuery.sizeOf(context).width,
          height: MediaQuery.sizeOf(context).height,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImageRes.classroom.provider(),
                fit: BoxFit.fill
            )
          ),
          child: Column(
            children: [
              AssetImageRes.openlight.imageFile,
              CupertinoButton(
                  padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 50),
                  color: CupertinoColors.activeGreen,
                  child: const Text('START'),
                  onPressed: () {
                    Navigator.of(context).push(CupertinoPageRoute(builder: (context) => QuizPage()));
                  }
              )
            ]
          )
        )));
  }
}

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          middle: const Text("QuizPage"),
        ),
        child: Container(
          child: const Text("QuizPage")
        ));
  }
}

