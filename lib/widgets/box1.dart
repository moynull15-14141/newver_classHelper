import 'package:flutter/material.dart';

class box1 extends StatefulWidget {
  const box1(
      {super.key,
      required this.height,
      required this.width,
      required this.heightIm,
      required this.widthIm,
      required this.imageUrl,
      required this.imageUrl2,
      required this.onTap,
      required this.text});
  final double height;
  final double width;
  final String imageUrl;
  final String imageUrl2;

  final String text;
  final double heightIm;
  final double widthIm;
  final Function onTap;

  @override
  State<box1> createState() => _box1State();
}

class _box1State extends State<box1> {
  bool _isTapped = false;

  @override
  Widget build(BuildContext context) {
    Color textColor = _isTapped
        ? const Color.fromARGB(255, 241, 255, 186)
        : const Color.fromARGB(255, 1, 60, 64);
    return Material(
      elevation: 4,
      borderRadius: BorderRadius.circular(10),
      child: GestureDetector(
        onTapDown: (_) {
          setState(() {
            _isTapped = true;
          });
        },
        onTapUp: (_) {
          setState(() {
            _isTapped = false;
          });
          widget.onTap();
        },
        onTapCancel: () {
          setState(() {
            _isTapped = false;
          });
        },
        child: Container(
          decoration: BoxDecoration(
              color: _isTapped
                  ? const Color.fromARGB(255, 1, 60, 64)
                  : const Color.fromARGB(255, 223, 241, 149),
              borderRadius: BorderRadius.circular(10)),
          height: widget.height,
          width: widget.width,
          child: Column(
            children: [
              const SizedBox(
                height: 15,
              ),
              SizedBox(
                height: widget.heightIm,
                width: widget.widthIm,
                child: Image.asset(
                  _isTapped ? widget.imageUrl2 : widget.imageUrl,
                  fit: BoxFit
                      .fill, // Optional: Adjust the fit based on your needs
                ),
              ),
              const SizedBox(
                  // height: 5,
                  ),
              Text(
                widget.text.toString(),
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontFamily: 'Font1',
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: textColor,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
