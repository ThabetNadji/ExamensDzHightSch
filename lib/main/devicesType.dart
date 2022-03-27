import 'dart:ui' as ui;

// ignore: camel_case_types
class devicesType {
  bool isTablet;
  bool isPhone;

  final double devicePixelRatio = ui.window.devicePixelRatio;
  final ui.Size size = ui.window.physicalSize;

  String getDeviceType() {
    if (devicePixelRatio < 2 && (size.width >= 1000 || size.height >= 1000)) {
      isTablet = true;
      isPhone = false;
      return 'isTablet';
    } else if (devicePixelRatio == 2 &&
        (size.width >= 1920 || size.height >= 1920)) {
      isTablet = true;
      isPhone = false;
      return 'isTablet';
    } else {
      isTablet = false;
      isPhone = true;
      return 'isPhone';
    }
  }
}
