import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:four_apps/constants.dart';
import 'package:four_apps/custom_button.dart';
import 'package:four_apps/homework_11/Checkkout_ScrollView.dart';

class ItemBoston extends StatelessWidget {
  const ItemBoston({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/BostonLettuce1.png"),
                alignment: Alignment.topRight,
              ),
            ),
            child: Column(
              children: [
                const SizedBox(height: 240),
                Expanded(
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.white,
                    ),
                    child: Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(30),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                "Boston Lettuce",
                                style: kHeadingextStyle.copyWith(fontSize: 32),
                              ),
                              const SizedBox(height: 20),
                              Text(
                                "1.10 E/piece",
                                style: kHeadingextStyle.copyWith(fontSize: 28),
                              ),
                              const SizedBox(height: 15),
                              Text(
                                "~150 gr/piece",
                                style: kTitleTextStyle.copyWith(
                                    fontSize: 16, color: Colors.green),
                              ),
                              const SizedBox(height: 20),
                              Text(
                                "Spain",
                                style: kHeadingextStyle.copyWith(fontSize: 20),
                              ),
                              const SizedBox(height: 15),
                              Text(
                                "Lettuce is an annual plant of the daisy family, Asteraceae. It is most often grown as a leaf vegetable, but sometimes for its stem and seeds. Lettuce is most often used for salads, although it is also seen in other kinds of food, such as soups, sandwiches and wraps; it can also be grilled.",
                                style: kTitleTextStyle.copyWith(
                                    fontSize: 16, fontWeight: FontWeight.w100),
                              ),
                              const SizedBox(height: 30),
                            ],
                          ),
                        ),
                        Positioned(
                          right: 0,
                          left: 0,
                          bottom: 0,
                          child: Container(
                            padding: const EdgeInsets.all(20),
                            height: 100,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(40),
                              boxShadow: [
                                BoxShadow(
                                  offset: const Offset(0, 4),
                                  blurRadius: 50,
                                  color: kTextColor.withOpacity(.1),
                                ),
                              ],
                            ),
                            child: Row(
                              children: <Widget>[
                                Container(
                                  padding: const EdgeInsets.all(14),
                                  height: 56,
                                  width: 80,
                                  decoration: BoxDecoration(
                                    color: const Color(0xFFFFEDEE),
                                    borderRadius: BorderRadius.circular(40),
                                  ),
                                  child: SvgPicture.asset(
                                      "assets/icons/heart.svg"),
                                ),
                                const SizedBox(width: 20),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) {
                                          return Checkout();
                                        },
                                      ),
                                    );
                                  },
                                  child: Container(
                                    alignment: Alignment.centerRight,
                                    height: 56,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(40),
                                      color: kBlueColor,
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        SvgPicture.asset(
                                          "assets/icons/shopping-cart.svg",
                                          color: Colors.white,
                                        ),
                                        Text(
                                          "ADD TO CART",
                                          style: kSubheadingextStyle.copyWith(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          CustomFloatingButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Checkout()),
              );
            },
          ),
        ],
      ),
    );
  }
}
