import 'package:flutter/material.dart';

class AboutPageScreen extends StatelessWidget {
  const AboutPageScreen({
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
            'About Page',
            style: style,
          ),
        ],
      ),
    );
  }
}
