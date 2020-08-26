import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:kbook/reusables/enums/image_paths.dart';
import 'package:kbook/reusables/objects.dart';

Widget myImage({
  double height,
  double width,
  bool isNetworkImage,
  bool isMemoryImage,
  String imagePath,
  Uint8List imagebyteCode,
  BoxFit boxFit,
  Alignment alignment,
  Widget child,
}) {
  return Container(
    height: height ?? null,
    width: width ?? null,
    decoration: new BoxDecoration(
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(rconfig.horizontal(1)),
        bottomRight: Radius.circular(rconfig.horizontal(1)),
      ),
      image: new DecorationImage(
        fit: boxFit ?? BoxFit.cover,
        alignment: alignment ?? Alignment.center,
        image: isNetworkImage == true
            ? NetworkImage(imagePath ??
                "https://upload.wikimedia.org/wikipedia/commons/f/fc/No_picture_available.png")
            : isMemoryImage == true
                ? MemoryImage(imagebyteCode)
                : AssetImage(imagePath ?? MyImagePaths.no_image),
      ),
    ),
    child: child ?? SizedBox.shrink(),
  );
}
