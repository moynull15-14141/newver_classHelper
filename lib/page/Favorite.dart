import 'package:flutter/material.dart';

class Favorite extends StatelessWidget {
  const Favorite({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Text(
        "Favorite",
        style: TextStyle(fontFamily: 'Font1', fontSize: 40),
      ),
    );
  }
}
