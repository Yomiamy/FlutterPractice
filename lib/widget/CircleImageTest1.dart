import 'package:flutter/material.dart';

import '../gen/assets_config.dart';

class CircleImageTest1 extends StatefulWidget {
  const CircleImageTest1({super.key});

  @override
  State<CircleImageTest1> createState() => _CircleImageTest1State();
}

class _CircleImageTest1State extends State<CircleImageTest1> {
  static const SizedBox DIVIDER = SizedBox(height: 10);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("CircleImageTest1"),
        ),
        body: SingleChildScrollView(
          child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImageRes.threePigPage1.fileProvider
                ),

                DIVIDER,

                ClipOval(
                    child: SizedBox(
                      width: 100,
                      height: 100,
                      child: AssetImageRes.threePigPage2.imageFile,
                    )
                ),

                DIVIDER,

                ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: SizedBox(
                      width: 100,
                      height: 100,
                      child: AssetImageRes.threePigPage3.imageFile,
                    )
                ),

                DIVIDER,

                Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: AssetImageRes.threePigPage4.fileProvider,
                        )
                    )
                ),

                DIVIDER,

                Container(
                    width: 100,
                    height: 100,
                    decoration: ShapeDecoration(
                        shape: const CircleBorder(side: BorderSide(width: 2, color: AssetColorRes.black)),
                        image: DecorationImage(
                          image: AssetImageRes.threePigPage5.fileProvider,
                        )
                    )
                ),

                DIVIDER,

                Container(
                  width: 100,
                  height: 100,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle
                  ),
                  clipBehavior: Clip.antiAlias,
                  child: AssetImageRes.threePigPage6.imageFile,
                ),

                DIVIDER,

                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100)
                  ),
                  clipBehavior: Clip.antiAlias,
                  child: AssetImageRes.threePigPage8.imageFile,
                ),

                DIVIDER,

                Container(
                  width: 100,
                  height: 100,
                  decoration: const ShapeDecoration(
                      shape: CircleBorder()
                  ),
                  clipBehavior: Clip.antiAlias,
                  child: AssetImageRes.threePigPage9.imageFile,
                )
              ]
          ))
        );
  }
}
