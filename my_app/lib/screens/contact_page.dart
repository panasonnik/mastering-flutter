import 'package:flutter/material.dart';

class ContactPageScreen extends StatelessWidget {
  const ContactPageScreen({
    super.key,
    required this.style,
  });

  final TextStyle style;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Contact Page',
            style: style,
          ),
        ],
      ),
    );
  }
}
