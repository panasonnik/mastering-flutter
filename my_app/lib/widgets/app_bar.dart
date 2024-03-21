import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text("Simple App"),
      backgroundColor: Colors.deepOrange,
      actions: const [
        Padding(
          padding: EdgeInsets.all(10.0),
          child: Icon(Icons.phone),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
