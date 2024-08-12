import 'package:flutter/material.dart';

class BuildOptionIcon extends StatelessWidget {
  const BuildOptionIcon({
    super.key,
    required this.icon,
  });

  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Icon(
        icon,
        size: 25,
        color: Colors.grey[800],
      ),
    );
  }
}