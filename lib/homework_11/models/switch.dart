import 'package:flutter/material.dart';

class YesNoSwitch extends StatefulWidget {
  @override
  _YesNoSwitchState createState() => _YesNoSwitchState();
}

class _YesNoSwitchState extends State<YesNoSwitch> {
  bool isYes = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isYes = !isYes;
        });
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        width: 70,
        height: 30,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: isYes ? Colors.green : Colors.red,
        ),
        child: Stack(
          children: [
            AnimatedPositioned(
              duration: Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              left: isYes ? 40 : 0,
              right: isYes ? 0 : 40,
              child: Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
            ),
            Center(
              child: Text(
                isYes ? "Yes" : "No",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
