import 'package:flutter/material.dart';
import 'app_bar.dart';
import 'back_button.dart';

class PhotoInfo extends StatefulWidget {
  const PhotoInfo({super.key, required this.imgUrl, required this.tag});
  final String imgUrl;
  final String tag;
  @override
  State<PhotoInfo> createState() => _PhotoInfoState();
}

class _PhotoInfoState extends State<PhotoInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(),
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
