import 'package:flutter/material.dart';

// MediaQuery.devicePixelRatioOf(context)
// MediaQuery.textScaleFactorOf(context)
// MediaQuery.platformBrightnessOf(context)
// MediaQuery.paddingOf(context)
// MediaQuery.viewInsetsOf(context)
// MediaQuery.systemGestureInsetsOf(context)
// MediaQuery.viewPaddingOf(context)
// MediaQuery.alwaysUse24HourFormatOf(context)
// MediaQuery.accessibleNavigationOf(context)
// MediaQuery.invertColorsOf(context)
// MediaQuery.highContrastOf(context)
// MediaQuery.disableAnimationsOf(context)
// MediaQuery.boldTextOf(context)
// MediaQuery.navigationModeOf(context)
// MediaQuery.gestureSettingsOf(context)
// MediaQuery.displayFeaturesOf(context)

class MediaQueryWdiget extends StatelessWidget {
  const MediaQueryWdiget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('MediaQueryWdiget'),
        ),
        body: Container(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // Text("Size: ${MediaQuery.of(context).size}")
              Text("Size: ${MediaQuery.sizeOf(context)}"),
              // Text("PlatformBrightness: ${MediaQuery.of(context).platformBrightness}")
              Text("PlatformBrightness: ${MediaQuery.platformBrightnessOf(context)}"),
              // Text("Orientation: ${MediaQuery.of(context).orientation}")
              Text("Orientation: ${MediaQuery.orientationOf(context)}")
            ]
          )
        )
    );
  }
}
