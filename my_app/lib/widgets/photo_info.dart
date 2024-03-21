import 'package:flutter/material.dart';
import 'app_bar.dart';
import 'back_button.dart';

class PhotoInfo extends StatefulWidget {
  const PhotoInfo({Key? key, required this.imgUrl, required this.tag})
      : super(key: key);
  final String imgUrl;
  final String tag;
  @override
  State<PhotoInfo> createState() => _PhotoInfoState();
}

class _PhotoInfoState extends State<PhotoInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Hero(
              tag: widget.tag,
              child: Image(
                image: NetworkImage(widget.imgUrl),
                height: 400.0,
                width: MediaQuery.of(context).size.width * 0.8,
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(width: 16.0),
            const Text("Some info about image"),
            const CustomElevatedButton(),
          ],
        ),
      ),
    );
  }
}
