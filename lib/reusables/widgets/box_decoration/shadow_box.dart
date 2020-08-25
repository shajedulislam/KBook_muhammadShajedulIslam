import 'package:flutter/material.dart';

BoxDecoration myShadowBox({
  Color backgroundColor,
  double borderRadius,
  bool withBorder,
  Color borderColor,
  double borderWidth,
  bool withShadow,
  Color shadowColor,
  Offset shadowOffset,
  double blurRadius,
  double spreadRadius,
  LinearGradient gradient,
  bool gradientEnable,
}) {
  return BoxDecoration(
    color: gradient == null && gradientEnable != true
        ? backgroundColor != null ? backgroundColor : Colors.white
        : null,
    gradient: gradient != null && gradientEnable == true ? gradient : null,
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
              offset: shadowOffset != null ? shadowOffset : Offset(0, 1.5),
              blurRadius: blurRadius != null ? blurRadius : 3,
              spreadRadius: spreadRadius != null ? spreadRadius : 0,
            ),
          ]
        : [],
  );
}
