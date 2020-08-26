import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:kbook/blocs/book_list/model.dart';
import 'package:kbook/reusables/enums/image_paths.dart';
import 'package:kbook/reusables/objects.dart';
import 'package:kbook/reusables/widgets/card/my_card.dart';
import 'package:kbook/reusables/widgets/media/my_image.dart';
import 'package:kbook/reusables/widgets/sizebox/my_sizebox.dart';
import 'package:kbook/reusables/widgets/text/my_text.dart';

Widget bookDetailBody({BoookItems boookItems}) {
  return SingleChildScrollView(
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
                child: boookItems.volumeInfo.imageLinks != null
                    ? boookItems.volumeInfo.imageLinks.thumbnail != null
                        ? myImage(
                            isNetworkImage: true,
                            imagePath:
                                boookItems.volumeInfo.imageLinks.thumbnail,
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
              gapY(y: 4),
              myText(
                text: boookItems.volumeInfo.title,
                fontSize: rconfig.fontSize(16),
                textAlign: TextAlign.center,
              ),
              gapY(y: 2),
              myText(
                text: boookItems.volumeInfo.authors.toString(),
                fontSize: rconfig.fontSize(14),
                color: Colors.black.withOpacity(0.7),
              )
            ],
          ),
          boookItems.volumeInfo.description != null
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    gapY(y: 10),
                    myText(
                      text: "Description",
                      fontSize: rconfig.fontSize(14),
                      fontWeight: FontWeight.w600,
                    ),
                    gapY(y: 2),
                    ExpandableText(
                      boookItems.volumeInfo.description,
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
  );
}
