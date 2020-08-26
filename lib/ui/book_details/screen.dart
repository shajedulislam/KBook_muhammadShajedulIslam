import 'package:flutter/material.dart';
import 'package:kbook/blocs/book_list/model.dart';
import 'package:kbook/reusables/enums/my_colors.dart';
import 'package:kbook/ui/book_details/components/appbar.dart';
import 'package:kbook/ui/book_details/components/body.dart';

class BookDetails extends StatefulWidget {
  final BoookItems boookItems;
  BookDetails({this.boookItems});
  @override
  _BookDetailsState createState() => _BookDetailsState();
}

class _BookDetailsState extends State<BookDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.bg,
      appBar: bookDetailAppBar(),
      body: bookDetailBody(boookItems: widget.boookItems),
    );
  }
}
