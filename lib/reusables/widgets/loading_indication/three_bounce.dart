import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:kbook/reusables/enums/my_colors.dart';
import 'package:kbook/reusables/objects.dart';

Widget loadingIndicator({
  BuildContext context,
  Color color,
  double size,
}) {
  double loaderSize = rconfig.horizontal(8);
  return Center(
    child: SpinKitThreeBounce(
      color: color ?? MyColors.theme,
      size: size ?? loaderSize,
    ),
  );
}
