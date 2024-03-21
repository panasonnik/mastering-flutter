import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
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
    );
  }
}
