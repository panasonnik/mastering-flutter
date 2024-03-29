import 'package:flutter/material.dart';
import 'package:my_app/widgets/photo_info.dart';
import 'package:cached_network_image/cached_network_image.dart';

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
                transitionDuration: const Duration(seconds: 1),
                reverseTransitionDuration: const Duration(seconds: 1),
                pageBuilder: (_, __, ___) =>
                    PhotoInfo(imgUrl: imgUrl, tag: tag),
              ),
            ),
            child: CachedNetworkImage(
              imageUrl: imgUrl,
              placeholder: (context, url) => const SizedBox(
                height: 10.0,
                width: 10.0,
                child: CircularProgressIndicator(
                  color: Colors.deepOrange,
                ),
              ),
              errorWidget: (context, url, error) => const Icon(Icons.error),
              height: 180.0,
              width: 180.0,
              fit: BoxFit.contain,
            ),
            // Image(
            //   image: CachedNetworkImageProvider(imgUrl),
            //   height: 180.0,
            //   width: 180.0,
            //   fit: BoxFit.contain,
            // ),
          ),
        ),
        const SizedBox(
          height: 6.0,
        ),
        Text(title),
        Ink(
          decoration: const BoxDecoration(
            color: Colors.deepOrange,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.all(Radius.circular(12.0)),
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
