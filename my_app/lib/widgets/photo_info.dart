import 'package:flutter/material.dart';
import 'app_bar.dart';
import 'back_button.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:shimmer/shimmer.dart';

class PhotoInfo extends StatelessWidget {
  const PhotoInfo({super.key, required this.imgUrl, required this.tag});
  final String imgUrl;
  final String tag;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Hero(
              tag: tag,
              child: CachedNetworkImage(
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
            ),
            const Text("Some info about image",
                style: TextStyle(fontSize: 20.0)),
            const SizedBox(height: 20.0),
            const CustomElevatedButton(),
          ],
        ),
      ),
    );
  }
}
