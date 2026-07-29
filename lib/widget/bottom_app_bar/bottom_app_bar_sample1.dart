import 'dart:developer';

import 'package:flutter/material.dart';

class BottomAppBarSample1 extends StatefulWidget {
  const BottomAppBarSample1({super.key});

  @override
  State<BottomAppBarSample1> createState() => _BottomAppBarSample1State();
}

class _BottomAppBarSample1State extends State<BottomAppBarSample1> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('appbarTitle'),
        ),
        body: IndexedStack(
          index: _index,
          children: const [
            Text('IconButton0 pressed'),
            Text('IconButton1 pressed'),
            Text('IconButton2 pressed')
          ]
        ),
        bottomNavigationBar: Container(
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
            ),
            child: BottomAppBar(
              color: Colors.grey,
              shape: const CircularNotchedRectangle(),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  IconButton(
                      iconSize: 40,
                      onPressed: () {
                        log("IconButton0 pressed");
                        setState(() {
                          _index = 0;
                        });
                      },
                      icon: Icon(_index == 0 ? Icons.favorite_border : Icons.favorite)),
                  IconButton(
                      iconSize: 40,
                      onPressed: () {
                        log("IconButton1 pressed");
                        setState(() {
                          _index = 1;
                        });
                      },
                      icon: Icon(_index == 1 ? Icons.lightbulb_outline : Icons.lightbulb)),
                  IconButton(
                      iconSize: 40,
                      onPressed: () {
                        log("IconButton2 pressed");
                        setState(() {
                          _index = 2;
                        });
                      },
                      icon: Icon(_index == 2 ? Icons.person_outline : Icons.person))
                ]
            )
          )
        )
    );
  }
}
