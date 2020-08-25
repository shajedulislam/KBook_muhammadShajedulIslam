import 'package:flutter/material.dart';
import 'package:kbook/reusables/enums/my_colors.dart';

class BookList extends StatefulWidget {
  @override
  _BookListState createState() => _BookListState();
}

class _BookListState extends State<BookList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.theme,
      ),
    );
  }
}
