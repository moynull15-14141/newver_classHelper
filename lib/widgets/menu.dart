import 'package:flutter/material.dart';

class menu extends StatelessWidget {
  const menu({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 60,
      ),
      child: Container(
        height: 50,
        width: 50,
        color: const Color.fromARGB(255, 187, 203, 122),
        child: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.grid_view,
            size: 35,
            color: Color.fromARGB(255, 1, 60, 64),
          ),
        ),
      ),
    );
  }
}
