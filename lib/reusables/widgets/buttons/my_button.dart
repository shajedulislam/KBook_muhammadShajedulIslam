import 'package:flutter/material.dart';
import 'package:kbook/reusables/enums/my_colors.dart';
import 'package:kbook/reusables/objects.dart';
import 'package:kbook/reusables/widgets/box_decoration/shadow_box.dart';
import 'package:kbook/reusables/widgets/text/my_text.dart';

Widget myButton({
  String buttonText,
  double width,
  double height,
  double paddingArroundText,
  Color color,
  double borderRadius,
  Color borderColor,
  Color splashColor,
  double fontSize,
  FontWeight fontWeight,
  Color fontColor,
  TextAlign textAlign,
  bool withShadow,
  Color shadowColor,
  Offset shadowOffset,
  double blurRadius,
  double spreadRadius,
  Function function,
  BorderRadius customBorderRadius,
  Widget customChild,
}) {
  return Container(
    height: height ?? rconfig.horizontal(12),
    decoration: withShadow == false
        ? null
        : myShadowBox(
            borderRadius: borderRadius,
            blurRadius: blurRadius,
            shadowOffset: shadowOffset,
            shadowColor: shadowColor,
            spreadRadius: spreadRadius,
          ),
    width: width ?? rconfig.horizontal(40),
    child: RaisedButton(
      padding: EdgeInsets.all(
        paddingArroundText ?? rconfig.horizontal(0),
      ),
      color: color ?? MyColors.theme,
      highlightColor: Colors.transparent,
      elevation: 0,
      focusElevation: 0,
      highlightElevation: 0,
      splashColor: splashColor ?? Colors.white.withOpacity(0.1),
      shape: RoundedRectangleBorder(
        side: BorderSide(color: borderColor ?? Colors.transparent),
        borderRadius: customBorderRadius ??
            BorderRadius.circular(
              borderRadius ?? 4,
            ),
      ),
      child: customChild ??
          myText(
            text: buttonText ?? 'Button',
            color: fontColor ?? Colors.white,
            fontSize: fontSize ?? rconfig.fontSize(16),
            fontWeight: fontWeight ?? FontWeight.bold,
            textAlign: textAlign ?? TextAlign.center,
          ),
      onPressed: function ?? () {},
    ),
  );
}
