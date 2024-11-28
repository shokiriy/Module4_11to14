import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Item extends StatelessWidget {
  final String image;
  final String name;
  final String price;
  final void Function()? press;
  const Item({
    super.key,
    required this.press,
    required this.image,
    required this.name,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(13),
      child: Container(
        // padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
            color: const Color.fromARGB(255, 233, 232, 232),
            borderRadius: BorderRadius.circular(13),
            boxShadow: const [
              BoxShadow(
                offset: Offset(0, 17),
                blurRadius: 17,
                spreadRadius: -23,
                //color: kShadowColor,
              )
            ]),
        child: Material(
          color: Colors.transparent,
          child: GestureDetector(
            onTap: press,
            child: Padding(
              padding: const EdgeInsets.all(0),
              child: Row(
                children: [
                  Image.asset(
                    image,
                    fit: BoxFit.fill,
                  ),
                  Column(
                    children: [
                      Text(
                        name,
                        // textAlign: TextAlign.left,
                        style: Theme.of(context)
                            .textTheme
                            .titleSmall
                            ?.copyWith(fontSize: 15),
                      ),
                      // const Spacer(),
                      Text(
                        price + " S/kg",
                        // textAlign: TextAlign.start,
                        style: Theme.of(context)
                            .textTheme
                            .titleSmall
                            ?.copyWith(fontSize: 15),
                      ),
                      // const Spacer(),
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 8, horizontal: 14),
                            color: Colors.white,
                            child: SvgPicture.asset("assets/icons/heart.svg"),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 6, horizontal: 12),
                            color: Colors.green,
                            child: SvgPicture.asset(
                                "assets/icons/shopping-cart.svg"),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
