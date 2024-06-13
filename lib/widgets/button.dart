import 'package:flutter/material.dart';

class Button1 extends StatelessWidget {
  const Button1({super.key, required this.siupButtonPressed, required this.btname});

  final String btname;
  final Function siupButtonPressed; // This should be a function, not a variable

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 185,
      child: ElevatedButton(
        style: ButtonStyle(
          elevation:
              const WidgetStatePropertyAll(0.0), // Adjust elevation as needed
          backgroundColor: const WidgetStatePropertyAll(
            Color.fromARGB(255, 7, 123, 130),
          ),
          shape: WidgetStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
        ),
        onPressed: () {}, // Call the function passed as `onpressed`
        child: Text(
          btname,
          style: const TextStyle(fontSize: 17, color: Colors.white),
        ),
      ),
    );
  }
}

void siupButtonPressed() {
  // Your button press logic here (e.g., print a message, navigate, etc.)
}
