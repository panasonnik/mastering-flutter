import 'package:flutter/material.dart';
import 'package:my_app/widgets/row_of_two_items.dart';

class ItemsPage extends StatefulWidget {
  final Function addItemFunction;
  final Function saveItemFunction;
  const ItemsPage({
    super.key,
    required this.addItemFunction,
    required this.saveItemFunction,
  });

  @override
  State<ItemsPage> createState() => _ItemsPageState();
}

class _ItemsPageState extends State<ItemsPage> {
  static const TextStyle customTextStyle =
      TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold);
  String img1Url =
      'https://images.unsplash.com/photo-1469474968028-56623f02e42e?q=80&w=2074&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D';
  String img2Url =
      'https://images.unsplash.com/photo-1426604966848-d7adac402bff?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D';

  String img3Url =
      'https://plus.unsplash.com/premium_photo-1666433656515-77386ea16d5a?q=80&w=1887&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D';
  String img4Url =
      'https://images.unsplash.com/photo-1711348260213-b4f6c9c1d6be?q=80&w=1886&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D';

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 30.0,
              ),
              const Text(
                "Items",
                style: customTextStyle,
              ),
              const SizedBox(
                height: 30.0,
              ),
              RowOfTwoItems(
                  img1Url: img1Url,
                  widget: widget,
                  img2Url: img2Url,
                  tag1: "Item 1",
                  tag2: "Item 2"),
              const SizedBox(height: 30.0),
              RowOfTwoItems(
                  img1Url: img3Url,
                  widget: widget,
                  img2Url: img4Url,
                  tag1: "Item 3",
                  tag2: "Item 4"),
            ],
          ),
        ],
      ),
    );
  }
}
