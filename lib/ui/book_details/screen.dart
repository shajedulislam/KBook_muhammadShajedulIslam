import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:kbook/blocs/book_list/model.dart';
import 'package:kbook/reusables/enums/image_paths.dart';
import 'package:kbook/reusables/enums/my_colors.dart';
import 'package:kbook/reusables/functions/navigation.dart';
import 'package:kbook/reusables/functions/shared_preferences.dart';
import 'package:kbook/reusables/objects.dart';
import 'package:kbook/reusables/widgets/buttons/my_button.dart';
import 'package:kbook/reusables/widgets/card/my_card.dart';
import 'package:kbook/reusables/widgets/media/my_image.dart';
import 'package:kbook/reusables/widgets/sizebox/my_sizebox.dart';
import 'package:kbook/reusables/widgets/text/my_text.dart';

class BookDetails extends StatefulWidget {
  final BoookItems boookItems;
  BookDetails({this.boookItems});
  @override
  _BookDetailsState createState() => _BookDetailsState();
}

class _BookDetailsState extends State<BookDetails> {
  List<String> kbookFavs = [];
  bool isFav = false;
  @override
  void initState() {
    _checkForFav();
    super.initState();
  }

  _checkForFav() {
    SharedPreferenceManager.instance.getStringList('kbook_favs').then((value) {
      setState(() {
        kbookFavs = value;
        if (kbookFavs.contains(widget.boookItems.id)) {
          isFav = true;
        } else {
          isFav = false;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: MyColors.bg,
        appBar: AppBar(
          backgroundColor: MyColors.theme,
          centerTitle: true,
          title: myText(
            text: "Book Detail",
            color: Colors.white,
            fontSize: rconfig.fontSize(18),
          ),
          leading: myButton(
              width: rconfig.px(45),
              withShadow: false,
              customChild: Icon(
                Icons.arrow_back,
                color: Colors.white,
                size: rconfig.fontSize(24),
              ),
              function: () {
                popWith(context: context, value: true);
              }),
          actions: [
            myButton(
              function: () {
                if (isFav) {
                  kbookFavs.remove(widget.boookItems.id);
                  SharedPreferenceManager.instance
                      .setStringList('kbook_favs', kbookFavs)
                      .then((_) {
                    setState(() {
                      isFav = false;
                    });
                  });
                } else {
                  kbookFavs.add(widget.boookItems.id);
                  SharedPreferenceManager.instance
                      .setStringList('kbook_favs', kbookFavs)
                      .then((_) {
                    setState(() {
                      isFav = true;
                    });
                  });
                }
              },
              width: rconfig.px(45),
              withShadow: false,
              customChild: Icon(
                isFav ? Icons.favorite : Icons.favorite_border,
                color: Colors.white,
                size: rconfig.fontSize(24),
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          physics: ClampingScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.all(rconfig.px(20)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    myCard(
                      width: rconfig.px(200),
                      height: rconfig.px(250),
                      child: widget.boookItems.volumeInfo.imageLinks != null
                          ? widget.boookItems.volumeInfo.imageLinks.thumbnail !=
                                  null
                              ? myImage(
                                  isNetworkImage: true,
                                  imagePath: widget.boookItems.volumeInfo
                                      .imageLinks.thumbnail,
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
                    widget.boookItems.volumeInfo.title != null
                        ? Column(
                            children: [
                              gapY(y: 4),
                              myText(
                                text: widget.boookItems.volumeInfo.title,
                                fontSize: rconfig.fontSize(16),
                                color: Colors.black,
                                textAlign: TextAlign.center,
                              ),
                            ],
                          )
                        : SizedBox.shrink(),
                    widget.boookItems.volumeInfo.authors != null
                        ? Column(
                            children: [
                              gapY(y: 4),
                              myText(
                                text: widget.boookItems.volumeInfo.authors
                                    .join(', '),
                                fontSize: rconfig.fontSize(14),
                                color: Colors.black.withOpacity(0.5),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          )
                        : SizedBox.shrink(),
                    gapY(y: 2),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        myText(
                          text: "Rating : ",
                          fontSize: rconfig.fontSize(14),
                          color: Colors.black.withOpacity(0.7),
                        ),
                        myText(
                          text: widget.boookItems.volumeInfo.averageRating ??
                              "No ratings",
                          fontSize: rconfig.fontSize(14),
                          color: Colors.black.withOpacity(0.7),
                        )
                      ],
                    )
                  ],
                ),
                gapY(y: 4),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    widget.boookItems.volumeInfo.previewLink != null
                        ? myButton(
                            height: rconfig.px(30),
                            color: Colors.transparent,
                            withShadow: false,
                            borderColor: MyColors.theme,
                            width: rconfig.px(80),
                            buttonText: "Preview",
                            fontColor: MyColors.theme,
                            fontSize: rconfig.fontSize(14),
                            function: () {
                              launchURL(
                                widget.boookItems.volumeInfo.previewLink
                                    .toString(),
                              );
                            })
                        : SizedBox.shrink(),
                    widget.boookItems.saleInfo.buyLink != null &&
                            widget.boookItems.volumeInfo.previewLink != null
                        ? gapX(x: 2)
                        : SizedBox.shrink(),
                    widget.boookItems.saleInfo.buyLink != null
                        ? myButton(
                            height: rconfig.px(30),
                            color: Colors.transparent,
                            withShadow: false,
                            borderColor: MyColors.theme,
                            width: rconfig.px(80),
                            buttonText: "Buy Now",
                            fontColor: MyColors.theme,
                            fontSize: rconfig.fontSize(14),
                            function: () {
                              launchURL(widget.boookItems.saleInfo.buyLink
                                  .toString());
                            })
                        : SizedBox.shrink(),
                  ],
                ),
                widget.boookItems.volumeInfo.description != null
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          gapY(y: 6),
                          myText(
                            text: "Description",
                            fontSize: rconfig.fontSize(14),
                            fontWeight: FontWeight.w600,
                          ),
                          gapY(y: 2),
                          ExpandableText(
                            widget.boookItems.volumeInfo.description,
                            expandText: 'show more',
                            collapseText: 'show less',
                            maxLines: 10,
                            linkColor: Colors.blue,
                          )
                        ],
                      )
                    : SizedBox.shrink(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
