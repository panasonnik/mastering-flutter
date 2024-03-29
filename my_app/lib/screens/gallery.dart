import 'package:flutter/material.dart';
import 'package:my_app/widgets/item.dart';

class ImagesPage extends StatefulWidget {
  final Function addItemFunction;
  final Function saveItemFunction;
  const ImagesPage({
    super.key,
    required this.addItemFunction,
    required this.saveItemFunction,
  });

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
    return Center(
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
              Item(
                imgUrl: img1Url,
                tag: 'item1',
                addItemFunction: widget.addItemFunction,
                title: "Item2",
                saveItemFunction: widget.saveItemFunction,
              ),
              const SizedBox(width: 16.0),
              Item(
                imgUrl: img2Url,
                tag: 'item2',
                addItemFunction: widget.addItemFunction,
                title: "Item1",
                saveItemFunction: widget.saveItemFunction,
              ),
            ],
          ),
          // Container(
          //   margin: const EdgeInsets.only(top: 200.0),
          //   alignment: Alignment.bottomCenter,
          //   child: Ink(
          //     decoration: BoxDecoration(
          //       border: Border.all(color: Colors.deepOrange, width: 3.0),
          //       color: Colors.transparent,
          //       shape: BoxShape.rectangle,
          //       borderRadius: const BorderRadius.all(Radius.circular(16.0)),
          //     ),
          //     child: InkWell(
          //       onTap: () {
          //         Navigator.pop(context);
          //       },
          //       child: Ink(
          //         height: 48.0, // Adjust height as needed
          //         width: MediaQuery.of(context).size.width *
          //             0.8, // Adjust width as needed
          //         child: const Center(
          //           child: Text(
          //             'Back',
          //             style: TextStyle(
          //                 color: Colors.deepOrange,
          //                 fontWeight: FontWeight.bold),
          //           ),
          //         ),
          //       ),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
