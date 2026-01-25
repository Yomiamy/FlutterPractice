import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_practice/gen/assets_config.dart';

class Practice220 extends StatefulWidget {
  const Practice220({super.key});

  @override
  State<Practice220> createState() => _Practice220State();
}

class _Practice220State extends State<Practice220> {
  int _curDiceValue = -1;
  bool _isCurPlayer1Round = true;
  int _play1Score = 0;
  int _play2Score = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Practice220")),
        body: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(width: 150, child: AssetImageRes.bgDiceGame.imageFile),
            Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
              _scoreInfoWidget("Player1", _play1Score),
              _scoreInfoWidget("Player2", _play2Score),
              const SizedBox(height: 10),
              SizedBox(
                  width: 50,
                  height: 50,
                  child: _getDiceImgByNum(_curDiceValue)),
              const SizedBox(height: 10),
              Row(
                children: [
                  Ink(
                      child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _curDiceValue =
                            Random(DateTime.now().millisecondsSinceEpoch)
                                    .nextInt(6) +
                                1;

                        if (_isCurPlayer1Round) {
                          if (_curDiceValue == 1) {
                            _play1Score = 0;
                            _isCurPlayer1Round = !_isCurPlayer1Round;
                          } else {
                            _play1Score += _curDiceValue;
                            _play1Score = min(_play1Score, 100);
                          }
                        } else {
                          if (_curDiceValue == 1) {
                            _play2Score = 0;
                            _isCurPlayer1Round = !_isCurPlayer1Round;
                          } else {
                            _play2Score += _curDiceValue;
                            _play2Score = min(_play2Score, 100);
                          }
                        }
                      });
                    },
                    child: const Text("Roll"),
                  )),
                  const SizedBox(width: 10),
                  Ink(
                      child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        if (_isCurPlayer1Round) {
                          _isCurPlayer1Round = false;
                        } else {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: const Text('WINNER INFO!'),
                                  content: Text("贏家是${(_play1Score > _play2Score) ? "Player1" : "Player2"}"),
                                  actions: <Widget>[
                                    TextButton(
                                      child: const Text('取消'),
                                      onPressed: () {
                                        Navigator.of(context).pop(); // 关闭对话框
                                      },
                                    ),
                                    TextButton(
                                      child: const Text('確認'),
                                      onPressed: () {
                                        Navigator.of(context).pop(); // 关闭对话框
                                        // 在这里执行操作
                                      },
                                    ),
                                  ],
                                );
                              });
                        }
                      });
                    },
                    child: const Text("Hold"),
                  ))
                ],
              )
            ]),
          ],
        ));
  }

  Widget _scoreInfoWidget(String title, int score) => Row(
        children: [
          Text(title),
          const SizedBox(width: 8),
          SizedBox(
              width: 100,
              child: LinearProgressIndicator(
                value: score / 100,
                backgroundColor: Colors.grey[300],
                color: Colors.red,
                minHeight: 10,
              )),
          const SizedBox(width: 8),
          Text("$score / 100")
        ],
      );

  Widget _getDiceImgByNum(int num) {
    switch (num) {
      case 1:
        return AssetImageRes.dice1.imageFile;
      case 2:
        return AssetImageRes.dice2.imageFile;
      case 3:
        return AssetImageRes.dice3.imageFile;
      case 4:
        return AssetImageRes.dice4.imageFile;
      case 5:
        return AssetImageRes.dice5.imageFile;
      case 6:
        return AssetImageRes.dice6.imageFile;
      default:
        return AssetImageRes.dice1.imageFile;
    }
  }
}
