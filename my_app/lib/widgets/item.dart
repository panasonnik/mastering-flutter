import 'package:flutter/material.dart';
import 'package:my_app/widgets/photo_info.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:shimmer/shimmer.dart';

class Item extends StatelessWidget {
  const Item({
    super.key,
    required this.imgUrl,
    required this.tag,
    required this.title,
    required this.addItemFunction,
    required this.saveItemFunction,
  });

  final String imgUrl;
  final String tag;
  final String title;
  final Function addItemFunction;
  final Function saveItemFunction;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Hero(
          tag: tag,
          child: GestureDetector(
            onTap: () => Navigator.push(
              context,
              PageRouteBuilder(
                pageBuilder: (_, __, ___) =>
                    PhotoInfo(imgUrl: imgUrl, tag: tag),
              ),
            ),
            child: Stack(
              children: [
                CachedNetworkImage(
                  imageUrl: imgUrl,
                  height: 180.0,
                  width: 180.0,
                  fit: BoxFit.cover,
                  placeholder: (context, url) => Shimmer.fromColors(
                    baseColor: Colors.black12,
                    highlightColor: Colors.deepOrange.shade100,
                    child: Container(
                      width: 180.0,
                      height: 180.0,
                      color: Colors.black12,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 6.0,
        ),
        Text(title),
        Ink(
          decoration: BoxDecoration(
            color: Colors.deepOrange.shade400,
            shape: BoxShape.rectangle,
            borderRadius: const BorderRadius.all(Radius.circular(12.0)),
          ),
          child: InkWell(
            onTap: () {
              addItemFunction();
              saveItemFunction(title);
            },
            child: Ink(
              padding: const EdgeInsets.symmetric(
                  vertical: 8.0, horizontal: 24.0), // Adjust width as needed
              child: const Center(
                child: Row(
                  children: [
                    Icon(
                      Icons.shopping_cart_outlined,
                      color: Colors.white,
                    ),
                    SizedBox(width: 8.0),
                    Text(
                      'Add',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
