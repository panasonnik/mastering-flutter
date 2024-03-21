import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
                    onTap: () => Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (context) =>
                              PhotoInfo(imgUrl: img1Url, tag: 'img1')),
                    ),
                    child: Image(
                      image: NetworkImage(img1Url),
                      height: 180.0,
                      width: 180.0,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                SizedBox(width: 16.0),
                Hero(
                  tag: 'img2',
                  child: GestureDetector(
                    onTap: () => Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (context) =>
                              PhotoInfo(imgUrl: img2Url, tag: 'img2')),
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
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateColor.resolveWith((states) {
                  if (states.contains(MaterialState.pressed)) {
                    return Colors.deepOrangeAccent; // Color when pressed
                  }
                  return Colors.deepOrange; // Default color
                }),
                alignment: Alignment.center,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text(
                'Back',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
