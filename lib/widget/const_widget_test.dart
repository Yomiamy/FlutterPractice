import 'package:flutter/material.dart';

class ConstWidgetTest extends StatelessWidget {
  const ConstWidgetTest({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('ConstWidgetTest'),
        ),
        body: Stack(
          children: [
            // buildWelcomeBackgroundPageView(),
            Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Column(children: [
                  buildWelcomeInfoWidget(),
                  buildWelcomeIndicatorWidget(),
                  buildWelcomeBottomWidget(),
                ]))
          ],
        ));
  }

  Widget buildWelcomeBackgroundPageView() => Container(color: Colors.green);

  Widget buildWelcomeInfoWidget() => const Text("buildWelcomeInfoWidget");

  Widget buildWelcomeIndicatorWidget() =>
      const Text("buildWelcomeIndicatorWidget");

  Widget buildWelcomeBottomWidget() => const Text("buildWelcomeBottomWidget");
}
