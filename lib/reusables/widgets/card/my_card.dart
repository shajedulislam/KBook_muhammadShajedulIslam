import 'package:flutter/material.dart';
import 'package:kbook/reusables/objects.dart';

Widget myCard({
  double width,
  double height,
  Widget child,
  Color backgroundColor,
  double borderRadius,
  double paddingVertical,
  double paddingHorizontal,
  bool withBorder,
  Color borderColor,
  double borderWidth,
  bool withShadow,
  Color shadowColor,
  Offset shadowOffset,
  double blurRadius,
  double spreadRadius,
}) {
  return Container(
    width: width ?? null,
    height: height ?? null,
    padding: EdgeInsets.symmetric(
      vertical: paddingVertical != null ? paddingVertical : rconfig.px(15),
      horizontal:
          paddingHorizontal != null ? paddingHorizontal : rconfig.px(15),
    ),
    decoration: BoxDecoration(
      color: backgroundColor != null ? backgroundColor : Colors.white,
      border: withBorder != null
          ? Border.all(
              color: borderColor != null ? borderColor : Colors.black,
              width: borderWidth != null ? borderWidth : 1,
            )
          : null,
      borderRadius: BorderRadius.all(
          Radius.circular(borderRadius != null ? borderRadius : 5)),
      boxShadow: withShadow != false
          ? [
              BoxShadow(
                color: shadowColor != null
                    ? shadowColor
                    : Colors.black.withOpacity(0.06),
                offset: shadowOffset != null ? shadowOffset : Offset(0, 1),
                blurRadius: blurRadius != null ? blurRadius : 3,
                spreadRadius: spreadRadius != null ? spreadRadius : 0,
              ),
            ]
          : [],
    ),
    child: child,
  );
}
