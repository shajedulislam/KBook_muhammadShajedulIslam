import 'package:flutter/material.dart';
import 'package:kbook/reusables/enums/my_colors.dart';
import 'package:kbook/reusables/widgets/text/my_text.dart';

Widget bookDetailAppBar() {
  return AppBar(
    backgroundColor: MyColors.theme,
    title: myText(
      text: "Book Detail",
      color: Colors.white,
    ),
  );
}
