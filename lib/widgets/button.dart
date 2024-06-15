import 'package:flutter/material.dart';

class Button1 extends StatelessWidget {
  const Button1({
    super.key,
    this.iconData, // Make IconData optional (use null for no icon)
    required this.onPressed,
    required this.btname,
  });

  final IconData? iconData; // Add the question mark (?)
  final VoidCallback onPressed;
  final String btname;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: TextButton(
        // style: ButtonStyle(
        //   fixedSize: WidgetStateProperty.all<Size>(const Size(250.0, 30.0)),
        //   shape: WidgetStateProperty.all<RoundedRectangleBorder>(
        //     RoundedRectangleBorder(
        //       borderRadius: BorderRadius.circular(5), // Adjust as needed
        //     ),
        //   ),
        //   backgroundColor:
        //       WidgetStateProperty.all(const Color.fromARGB(255, 7, 123, 130)),
        // ),
        onPressed: onPressed,
        child: Row(
          children: [
            if (iconData != null) // Only include Icon if iconData is provided
              Container(
                height: 40,
                width: 40,
                color: Color.fromARGB(255, 1, 60, 64),
                child: Icon(iconData!),
              ),
            Padding(
              padding: const EdgeInsets.only(left: 5),
              child: Text(
                btname,
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontFamily: 'Font1', // Ensure font availability
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
