import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
      height: 80,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          BottomNavItem(
            svgScr: "assets/icons/grid.svg",
            press: () {},
          ),
          BottomNavItem(
            svgScr: "assets/icons/shopping-cart.svg",
            isActive: true,
            press: () {},
          ),
          BottomNavItem(
            svgScr: "assets/icons/user.svg",
            press: () {},
          ),
        ],
      ),
    );
  }
}

class BottomNavItem extends StatelessWidget {
  final String svgScr;
  final Function press;
  final bool isActive;
  const BottomNavItem({
    super.key,
    required this.svgScr,
    required this.press,
    this.isActive = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SvgPicture.asset(
            svgScr,
            // color: isActive ? kActiveIconColor : kTextColor,
          ),
        ],
      ),
    );
  }
}
