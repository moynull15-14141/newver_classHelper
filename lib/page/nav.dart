import 'package:flutter/material.dart';

class CustomBottomNavigationBarItem extends StatefulWidget {
  final IconData icon;
  final String label;
  final bool isSelected;

  const CustomBottomNavigationBarItem({
    required this.icon,
    required this.label,
    this.isSelected = false,
    super.key,
  });

  @override
  State<CustomBottomNavigationBarItem> createState() =>
      _CustomBottomNavigationBarItemState();
}

class _CustomBottomNavigationBarItemState
    extends State<CustomBottomNavigationBarItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          // Indicator circle (visible only when selected)
          if (widget.isSelected)
            CircleAvatar(
              backgroundColor: Colors.blue, // Customize color
              radius: 20.0, // Adjust radius
              child:
                  Icon(widget.icon, color: Colors.white), // Adjust icon color
            ),
          // Icon
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(widget.icon,
                  color: widget.isSelected
                      ? Colors.blue
                      : Colors.grey), // Adjust colors
              Text(widget.label,
                  style: TextStyle(
                      color: widget.isSelected
                          ? Colors.blue
                          : Colors.grey)), // Adjust colors
            ],
          ),
        ],
      ),
    );
  }
}
