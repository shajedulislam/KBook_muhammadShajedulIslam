import 'package:flutter/material.dart';

void push({BuildContext context, Widget screen}) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => screen,
    ),
  );
}

void pop({BuildContext context}) {
  Navigator.pop(context);
}

void popWith({BuildContext context, bool value}) {
  Navigator.pop(context, value);
}
