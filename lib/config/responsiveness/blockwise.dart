import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:responsive_builder/responsive_builder.dart';

class ResponsiveConfiguration {
  static MediaQueryData _mediaQueryData;
  static double screenWidth;
  static double screenHeight;
  static double screenMagnitude;
  static double blockSizeHorizontal;
  static double blockSizeVertical;
  static double blockSizeMagnitude;
  static String deviceType;
  static Orientation orientation;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    blockSizeHorizontal = screenWidth / 100;
    blockSizeVertical = screenHeight / 100;

    var dType = getDeviceType(_mediaQueryData.size);
    switch (dType) {
      case DeviceScreenType.mobile:
        deviceType = 'mobile';
        break;
      case DeviceScreenType.tablet:
        deviceType = 'tab';
        break;
      default:
        deviceType = 'mobile';
        break;
    }
  }

  double horizontal(double blocks) {
    return blockSizeHorizontal * blocks;
  }

  double vertical(double blocks) {
    return blockSizeVertical * blocks;
  }

  double px(double blocks) {
    return blockSizeHorizontal * blocks * getSize();
  }

  num getSize() {
    var deviceType = getDeviceType(_mediaQueryData.size);
    var value;
    switch (deviceType) {
      case DeviceScreenType.mobile:
        value = 0.27;
        break;
      default:
        value = 0.20;
        break;
    }
    return value;
  }

  double fontSize(double size) {
    var deviceType = getDeviceType(_mediaQueryData.size);
    switch (deviceType) {
      case DeviceScreenType.mobile:
        return ScreenUtil().setSp(size);
        break;
      default:
        return ScreenUtil().setSp(size * 1.5);
        break;
    }
  }
}
