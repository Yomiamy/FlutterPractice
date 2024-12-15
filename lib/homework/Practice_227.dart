import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_practice/gen/assets_config.dart';
import 'package:flutter_practice/homework/Practice_227API.dart';
import 'package:flutter_practice/homework/Quiz.dart';

class Practice227 extends StatefulWidget {
  const Practice227({super.key});

  @override
  State<Practice227> createState() => _Practice227State();
}

class _Practice227State extends State<Practice227> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar: const CupertinoNavigationBar(
          padding: EdgeInsetsDirectional.zero,
          middle: Text("Practice227"),
        ),
        child: SafeArea(
            child: Container(
                padding: const EdgeInsets.fromLTRB(15, 40, 15, 20),
                width: MediaQuery.sizeOf(context).width,
                height: MediaQuery.sizeOf(context).height,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImageRes.classroom.provider(),
                        fit: BoxFit.fill)),
                child: Column(children: [
                  AssetImageRes.openlight.imageFile,
                  CupertinoButton(
                      padding: const EdgeInsets.symmetric(
                          vertical: 20, horizontal: 50),
                      color: CupertinoColors.activeGreen,
                      child: const Text('START'),
                      onPressed: () {
                        Navigator.of(context).push(CupertinoPageRoute(
                            builder: (context) => QuizPage()));
                      })
                ]))));
  }
}

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int _quizIndex = 0;
  set index(int newIndex) {
    _quizIndex = newIndex;
  }
  int get index {
    return _quizIndex;
  }

  late Quiz _quiz;

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar: const CupertinoNavigationBar(
          middle: Text("QuizPage"),
        ),
        child: FutureBuilder(
            future: fetchQuiz(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                _quiz = snapshot.data!;
                return SafeArea(
                    child: StatefulBuilder(builder: (context, setState) {
                  return Container(
                      padding: const EdgeInsets.fromLTRB(15, 40, 15, 20),
                      width: MediaQuery.sizeOf(context).width,
                      height: MediaQuery.sizeOf(context).height,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImageRes.classroom.provider(),
                              fit: BoxFit.fill)),
                      child: Column(children: [
                        Text("Q - ${_quizIndex}",
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: CupertinoColors.white,
                                fontSize: 26)),
                        const SizedBox(height: 40),
                        Text(
                            "${_quiz.results?[_quizIndex].question}",
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: CupertinoColors.white,
                                fontSize: 24)),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                                width: 50,
                                height: 50,
                                child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        _quizIndex = (_quizIndex <
                                                _quiz.results!.length - 1)
                                            ? ++_quizIndex
                                            : _quizIndex;
                                      });
                                    },
                                    child: AssetImageRes.o.imageFile)),
                            const SizedBox(width: 20),
                            SizedBox(
                                width: 50,
                                height: 50,
                                child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        _quizIndex = (_quizIndex <
                                                _quiz.results!.length - 1)
                                            ? ++_quizIndex
                                            : _quizIndex;
                                      });
                                    },
                                    child: AssetImageRes.x.imageFile))
                          ],
                        )
                      ]));
                }));
              } else {
                return const SafeArea(
                    child: Center(child: CircularProgressIndicator()));
              }
            }));
  }

  Future<Quiz> fetchQuiz() =>
      practice_227APIClient.getQuestionInfo(10, "boolean");
}
