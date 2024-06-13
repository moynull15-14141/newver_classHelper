import 'package:flutter/material.dart';

class TextFieldInput extends StatelessWidget {
  final TextEditingController textEditingController;
  final bool isPass;
  final String hintText;
  final TextInputType textInputType;
  final Icon icon;

  const TextFieldInput(
      {super.key,
      required this.textEditingController,
      this.isPass = false,
      required this.hintText,
      required this.textInputType,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    const blackBorder = OutlineInputBorder(
      borderSide: BorderSide(
        color: Color.fromARGB(255, 7, 123, 130), // Set border color to black
        width: 1.0, // Adjust border width (optional)
      ),
    );

    return Padding(
      padding: const EdgeInsets.only(left: 12.0, right: 12.0),
      child: TextField(
        cursorColor: Colors.white,
        style: const TextStyle(color: Colors.white),
        controller: textEditingController,
        decoration: InputDecoration(
          prefixIcon: Container(
            height: 20,
            width: 20,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              color: Color.fromARGB(255, 7, 123, 130),
            ),
            child: icon,
          ),
          fillColor: const Color.fromARGB(255, 3, 84, 89),
          hintText: hintText,
          hintStyle: const TextStyle(color: Color.fromARGB(135, 255, 255, 255)),
          border: blackBorder,
          focusedBorder: blackBorder,
          enabledBorder: blackBorder,
          filled: true,
          contentPadding: const EdgeInsets.all(8),
        ),
        keyboardType: textInputType,
        obscureText: isPass,
      ),
    );
  }
}
