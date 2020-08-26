import 'package:flutter/material.dart';
import 'package:kbook/blocs/bloc_access.dart';
import 'package:kbook/blocs/book_list/model.dart';
import 'package:kbook/reusables/enums/image_paths.dart';
import 'package:kbook/reusables/enums/my_colors.dart';
import 'package:kbook/reusables/functions/navigation.dart';
import 'package:kbook/reusables/objects.dart';
import 'package:kbook/reusables/widgets/card/my_card.dart';
import 'package:kbook/reusables/widgets/loading_indication/three_bounce.dart';
import 'package:kbook/reusables/widgets/media/my_image.dart';
import 'package:kbook/reusables/widgets/text/my_text.dart';
import 'package:kbook/ui/book_details/screen.dart';

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
      appBar: AppBar(
        backgroundColor: MyColors.theme,
        title: myText(
          text: "KBook",
          color: Colors.white,
        ),
      ),
      body: StreamBuilder(
        stream: fetchBooksBloc.fetch,
        builder: (context, AsyncSnapshot<BookModel> results) {
          if (results.hasData) {
            if (results.data != null) {
              bookItems.addAll(results.data.items);
              return GridView.builder(
                  controller: _scrollController,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ),
                  itemCount: bookItems.length,
                  itemBuilder: (context, i) {
                    return InkWell(
                      onTap: () {
                        push(
                          context: context,
                          screen: BookDetails(
                            boookItems: bookItems[i],
                          ),
                        );
                      },
                      child: Padding(
                        padding: EdgeInsets.all(rconfig.px(8)),
                        child: myCard(
                          paddingHorizontal: 0,
                          paddingVertical: rconfig.px(5),
                          child: bookItems[i].volumeInfo.imageLinks != null
                              ? bookItems[i].volumeInfo.imageLinks.thumbnail !=
                                      null
                                  ? myImage(
                                      isNetworkImage: true,
                                      imagePath: bookItems[i]
                                          .volumeInfo
                                          .imageLinks
                                          .thumbnail,
                                      boxFit: BoxFit.fitHeight,
                                    )
                                  : myImage(
                                      imagePath: MyImagePaths.no_image,
                                      boxFit: BoxFit.fitHeight,
                                    )
                              : myImage(
                                  imagePath: MyImagePaths.no_image,
                                  boxFit: BoxFit.fitHeight,
                                ),
                        ),
                      ),
                    );
                  });
            } else {
              return Center(child: myText(text: "No data!"));
            }
          } else if (results.hasError) {
            return Center(child: myText(text: "Something Went Wrong!"));
          }
          return loadingIndicator();
        },
      ),
    );
  }
}
