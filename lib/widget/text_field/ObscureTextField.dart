import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ObsecureTextField extends StatelessWidget {

  const ObsecureTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('ObsecureTextField'),
        ),
        body: Container(
          child: const TextField(
            obscureText: true,
            maxLines: 1,
          ),
        ));
  }
}
