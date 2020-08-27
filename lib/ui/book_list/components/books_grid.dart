import 'package:flutter/material.dart';
import 'package:kbook/blocs/book_list/model.dart';
import 'package:kbook/reusables/enums/image_paths.dart';
import 'package:kbook/reusables/functions/navigation.dart';
import 'package:kbook/reusables/objects.dart';
import 'package:kbook/reusables/widgets/card/my_card.dart';
import 'package:kbook/reusables/widgets/loading_indication/three_bounce.dart';
import 'package:kbook/reusables/widgets/media/my_image.dart';
import 'package:kbook/ui/book_details/screen.dart';

Widget booksGrid({
  BuildContext context,
  ScrollController scrollController,
  List<BoookItems> bookItems,
  Function updateFavState,
  bool isShowFavs,
}) {
  return GridView.builder(
    controller: scrollController,
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
    ),
    itemCount: bookItems.length,
    itemBuilder: (context, i) {
      if (i == bookItems.length - 1 && !isShowFavs) {
        return loadingIndicator();
      }
      return InkWell(
        onTap: () {
          popListener(
            context: context,
            screen: BookDetails(
              boookItems: bookItems[i],
            ),
            function: updateFavState,
          );
        },
        child: Padding(
          padding: EdgeInsets.all(rconfig.px(8)),
          child: myCard(
            paddingHorizontal: 0,
            paddingVertical: rconfig.px(5),
            child: bookItems[i].volumeInfo.imageLinks != null
                ? bookItems[i].volumeInfo.imageLinks.thumbnail != null
                    ? myImage(
                        isNetworkImage: true,
                        imagePath: bookItems[i].volumeInfo.imageLinks.thumbnail,
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
    },
  );
}
