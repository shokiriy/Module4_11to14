import 'package:flutter/material.dart';

class CustomFloatingButton extends StatelessWidget {
  final VoidCallback onPressed; // Callback for button action

  const CustomFloatingButton({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 16,
      right: 16,
      child: FloatingActionButton(
        onPressed: onPressed,
        backgroundColor: Colors.blue,
        child: Icon(Icons.arrow_forward),
      ),
    );
  }
}
