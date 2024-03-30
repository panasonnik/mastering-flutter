import 'package:flutter/material.dart';
import 'package:my_app/screens/gallery.dart';
import 'package:my_app/widgets/item.dart';

class RowOfTwoItems extends StatelessWidget {
  const RowOfTwoItems({
    super.key,
    required this.img1Url,
    required this.widget,
    required this.img2Url,
    required this.tag1,
    required this.tag2,
  });

  final String img1Url;
  final ImagesPage widget;
  final String img2Url;
  final String tag1;
  final String tag2;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Item(
          imgUrl: img1Url,
          tag: tag1,
          addItemFunction: widget.addItemFunction,
          title: tag1,
          saveItemFunction: widget.saveItemFunction,
        ),
        const SizedBox(width: 16.0),
        Item(
          imgUrl: img2Url,
          tag: tag2,
          addItemFunction: widget.addItemFunction,
          title: tag2,
          saveItemFunction: widget.saveItemFunction,
        ),
      ],
    );
  }
}
