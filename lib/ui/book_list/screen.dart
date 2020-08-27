import 'package:flutter/material.dart';
import 'package:kbook/blocs/bloc_access.dart';
import 'package:kbook/blocs/book_list/model.dart';
import 'package:kbook/reusables/enums/my_colors.dart';
import 'package:kbook/reusables/functions/shared_preferences.dart';
import 'package:kbook/reusables/objects.dart';
import 'package:kbook/reusables/widgets/buttons/my_button.dart';
import 'package:kbook/reusables/widgets/loading_indication/three_bounce.dart';
import 'package:kbook/reusables/widgets/sizebox/my_sizebox.dart';
import 'package:kbook/reusables/widgets/text/my_text.dart';
import 'package:kbook/ui/book_list/components/books_grid.dart';

class BookList extends StatefulWidget {
  @override
  _BookListState createState() => _BookListState();
}

class _BookListState extends State<BookList> {
  List<String> kbookFavsId = [];
  ScrollController _scrollController = new ScrollController();
  int loadMoreBookIndex = 20;
  List<BoookItems> bookItems = [];
  List<BoookItems> bookItemsFavs = [];
  bool isLoad = true;
  bool isShowFavs = false;

  @override
  void initState() {
    SharedPreferenceManager.instance.getStringList('kbook_favs').then((value) {
      kbookFavsId = value;
      print(kbookFavsId.length);
    });

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
    isLoad = true;
    fetchBooksBloc.request(maxResults: 20, startIndex: loadMoreBookIndex);
    loadMoreBookIndex = loadMoreBookIndex + 20;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.bg,
      appBar: AppBar(
        backgroundColor: MyColors.theme,
        title: myText(
          text: "KBook",
          color: Colors.white,
        ),
        actions: [],
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          StreamBuilder(
            stream: fetchBooksBloc.fetch,
            builder: (context, AsyncSnapshot<BookModel> results) {
              if (results.hasData) {
                if (results.data == null ||
                    results.data.items == null && bookItems.length == 0) {
                  return Center(child: myText(text: "No data!"));
                } else {
                  if (results.data.items != null && isLoad == true) {
                    bookItems.addAll(results.data.items);

                    print(bookItems.length);

                    for (String favId in kbookFavsId) {
                      for (BoookItems item in results.data.items) {
                        if (item.id == favId) {
                          bookItemsFavs.add(item);
                        }
                      }
                    }
                    isLoad = false;
                  }

                  return booksGrid(
                      scrollController: _scrollController,
                      bookItems: isShowFavs ? bookItemsFavs : bookItems);
                }
              } else if (results.hasError) {
                return Center(child: myText(text: "Something Went Wrong!"));
              }
              return loadingIndicator();
            },
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              myButton(
                width: rconfig.px(110),
                height: rconfig.px(30),
                withShadow: false,
                buttonText: isShowFavs ? "Hide favourites" : "Show favourites",
                fontSize: rconfig.fontSize(12),
                function: () {
                  setState(() {
                    isShowFavs ? isShowFavs = false : isShowFavs = true;
                  });
                  print(bookItemsFavs.length);
                },
              ),
              gapY(y: 8),
            ],
          )
        ],
      ),
    );
  }
}
