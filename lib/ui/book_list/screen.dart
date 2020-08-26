import 'package:flutter/material.dart';
import 'package:kbook/blocs/bloc_access.dart';
import 'package:kbook/blocs/book_list/model.dart';
import 'package:kbook/reusables/enums/my_colors.dart';
import 'package:kbook/ui/book_list/components/appbar.dart';
import 'package:kbook/ui/book_list/components/body.dart';

class BookList extends StatefulWidget {
  @override
  _BookListState createState() => _BookListState();
}

class _BookListState extends State<BookList> {
  ScrollController _scrollController = new ScrollController();
  int loadMoreBookIndex = 20;
  List<BoookItems> bookItems = [];
  @override
  void initState() {
    fetchBooksBloc.request(maxResults: 20, startIndex: 0);
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        _loadMoreBooks();
      }
    });
    super.initState();
  }

  _loadMoreBooks() {
    fetchBooksBloc.request(maxResults: 20, startIndex: loadMoreBookIndex);
    loadMoreBookIndex = loadMoreBookIndex + 20;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.bg,
      appBar: bookListAppBar(),
      body: bookListBody(_scrollController),
    );
  }
}
