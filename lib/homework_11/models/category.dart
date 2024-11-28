import 'package:flutter/material.dart';

class CategoryCard11 extends StatelessWidget {
  final String svgSrc;
  final String title;
  final String title2;
  final void Function()? press;
  const CategoryCard11({
    super.key,
    required this.svgSrc,
    required this.title,
    required this.press,
    required this.title2,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(13),
      child: Container(
        // padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
            color: Colors.white,
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
          child: InkWell(
            onTap: press,
            child: Padding(
              padding: const EdgeInsets.all(0),
              child: Column(
                children: [
                  Image.asset(
                    svgSrc,
                    fit: BoxFit.fill,
                  ),
                  const Spacer(),
                  Text(
                    title,
                    textAlign: TextAlign.left,
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall
                        ?.copyWith(fontSize: 15),
                  ),
                  const Spacer(),
                  Text(
                    title2,
                    textAlign: TextAlign.start,
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall
                        ?.copyWith(fontSize: 15),
                  ),
                  const Spacer(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
