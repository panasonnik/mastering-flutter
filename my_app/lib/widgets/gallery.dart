import 'package:flutter/material.dart';
import 'app_bar.dart';
import 'package:my_app/widgets/photo_info.dart';

class ImagesPage extends StatefulWidget {
  const ImagesPage({super.key});

  @override
  State<ImagesPage> createState() => _ImagesPageState();
}

class _ImagesPageState extends State<ImagesPage> {
  static const TextStyle customTextStyle =
      TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold);
  String img1Url =
      'https://images.unsplash.com/photo-1469474968028-56623f02e42e?q=80&w=2074&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D';
  String img2Url =
      'https://images.unsplash.com/photo-1426604966848-d7adac402bff?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Images",
              style: customTextStyle,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Hero(
                  tag: 'img1',
                  child: GestureDetector(
                    onTap: () => Navigator.push(
                      context,
                      PageRouteBuilder(
                        transitionDuration: const Duration(seconds: 1),
                        reverseTransitionDuration: const Duration(seconds: 1),
                        pageBuilder: (_, __, ___) =>
                            PhotoInfo(imgUrl: img1Url, tag: 'img1'),
                      ),
                    ),
                    child: Image(
                      image: NetworkImage(img1Url),
                      height: 180.0,
                      width: 180.0,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                const SizedBox(width: 16.0),
                Hero(
                  tag: 'img2',
                  child: GestureDetector(
                    onTap: () => Navigator.push(
                      context,
                      PageRouteBuilder(
                        transitionDuration: const Duration(seconds: 1),
                        reverseTransitionDuration: const Duration(seconds: 1),
                        pageBuilder: (_, __, ___) =>
                            PhotoInfo(imgUrl: img2Url, tag: 'img2'),
                      ),
                    ),
                    child: Image(
                      image: NetworkImage(img2Url),
                      height: 180.0,
                      width: 180.0,
                      fit: BoxFit.contain,
                    ),
                  ),
                )
              ],
            ),
            Ink(
              decoration: ShapeDecoration(
                color: Colors.deepOrange, // Ink color
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                      8.0), // Adjust border radius as needed
                ),
              ),
              child: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Ink(
                  height: 48.0, // Adjust height as needed
                  width: MediaQuery.of(context).size.width *
                      0.8, // Adjust width as needed
                  child: const Center(
                    child: Text(
                      'Back',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
