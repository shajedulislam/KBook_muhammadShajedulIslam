import 'package:flutter/material.dart';
import 'package:kbook/reusables/objects.dart';

Widget gapX({double x}) {
  return SizedBox(
    width: rconfig.horizontal(x),
  );
}

Widget gapY({double y}) {
  return SizedBox(
    height: rconfig.horizontal(y),
  );
}

Widget margin({double x, double y}) {
  return x == null
      ? SizedBox(
          height: rconfig.px(y),
        )
      : SizedBox(
          width: rconfig.px(x),
        );
}
