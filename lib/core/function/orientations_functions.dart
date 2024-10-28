import 'package:flutter/services.dart';

//Check If On Landscape Mode Function
Future<bool> isLandscapeMode() async {
  try {
    final List<DeviceOrientation>? orientations =
        await SystemChannels.platform.invokeMethod<List<DeviceOrientation>>(
      'SystemChrome.setPreferredOrientations',
      <String>[
        DeviceOrientation.landscapeLeft.toString(),
        DeviceOrientation.landscapeRight.toString(),
      ],
    );

    return orientations!.contains(DeviceOrientation.landscapeLeft) ||
        orientations.contains(DeviceOrientation.landscapeRight);
  } on PlatformException catch (e) {
    // Handle any platform exceptions
    // ignore: avoid_print
    print('Orientation Error: $e');
    return false;
  }
}

//Check If On Portrait Mode Function
Future<bool> isPortraitMode() async {
  try {
    final List<DeviceOrientation>? orientations =
        await SystemChannels.platform.invokeMethod<List<DeviceOrientation>>(
      'SystemChrome.setPreferredOrientations',
      <String>[
        DeviceOrientation.portraitUp.toString(),
        DeviceOrientation.portraitDown.toString(),
      ],
    );

    return orientations!.contains(DeviceOrientation.portraitUp) ||
        orientations.contains(DeviceOrientation.portraitDown);
  } on PlatformException catch (e) {
    // Handle any platform exceptions
    // ignore: avoid_print
    print('Orientation Error: $e');
    return false;
  }
}
