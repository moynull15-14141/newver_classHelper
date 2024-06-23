import 'package:flutter/material.dart';

class Box2 extends StatelessWidget {
  const Box2({
    super.key,
    required this.box2name,
    required this.box2Icon,
    required this.onTap,
  });

  final String box2name;
  final Icon box2Icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12),
      child: InkWell(
        onTap: onTap,
        child: Container(
          height: 55,
          width: 325,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            color: Color.fromARGB(255, 223, 241, 149),
          ),
          child: ListTile(
            leading: box2Icon,
            iconColor: const Color.fromARGB(255, 1, 60, 64),
            title: Text(
              box2name,
              style: const TextStyle(
                fontFamily: 'Font2',
                color: Color.fromARGB(255, 1, 60, 64),
                fontSize: 20,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
