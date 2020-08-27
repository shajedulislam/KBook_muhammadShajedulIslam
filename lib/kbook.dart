import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kbook/config/responsiveness/blockwise.dart';
import 'package:kbook/reusables/objects.dart';
import 'package:kbook/ui/book_list/screen.dart';

import 'reusables/functions/shared_preferences.dart';

class Kbook extends StatefulWidget {
  @override
  _KbookState createState() => _KbookState();
}

class _KbookState extends State<Kbook> {
  @override
  void initState() {
    SharedPreferenceManager.instance.create();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    rconfig.init(context);

    String deviceType = ResponsiveConfiguration.deviceType;

    double defaultScreenWidth;
    double defaultScreenHeight;

    if (deviceType == 'mobile') {
      defaultScreenWidth = 414.0;
      defaultScreenHeight = 996.0;
    } else if (deviceType == 'tab') {
      defaultScreenWidth = 768;
      defaultScreenHeight = 1024;
    }
    ScreenUtil.init(
      context,
      width: defaultScreenWidth,
      height: defaultScreenHeight,
      allowFontScaling: true,
    );

    return BookList();
  }
}
