import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

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

popListener({BuildContext context, Widget screen, Function function}) async {
  bool doSetState = false;
  doSetState = await Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => screen),
  );
  if (doSetState == true) {
    function();
  }
}

launchURL(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
