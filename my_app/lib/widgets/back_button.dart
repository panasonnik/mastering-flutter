import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Ink(
      decoration: ShapeDecoration(
        color: Colors.deepOrange,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
      child: InkWell(
        onTap: () {
          Navigator.pop(context);
        },
        child: SizedBox(
          height: 48.0, // Adjust height as needed
          width:
              MediaQuery.of(context).size.width * 0.8, // Adjust width as needed
          child: const Center(
            child: Text(
              'Back',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
