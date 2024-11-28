import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:four_apps/constants.dart';
import 'package:four_apps/custom_button.dart';
import 'package:four_apps/homework_11/BottomnavBar.dart';
import 'package:four_apps/homework_11/CreditCard.dart';
import 'package:four_apps/homework_11/models/switch.dart';

class Checkout extends StatelessWidget {
  const Checkout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const BottomNavBar(),
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(vertical: 50),
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SvgPicture.asset("assets/icons/vector.svg"),
                    const Text(
                      "Checkout",
                      style: kTitleTextStyle,
                    ),
                    GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return Creditcard();
                              },
                            ),
                          );
                        },
                        child: Icon(Icons.arrow_circle_right_outlined)),
                  ],
                ),
              ),
              SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Column(
                    children: [
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Payment method",
                                style: kTitleTextStyle.copyWith(
                                    fontSize: 24, fontWeight: FontWeight.bold),
                              ),
                              TextButton(
                                style: TextButton.styleFrom(
                                  textStyle: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                onPressed: () {},
                                child: const Text("CHANGE"),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              SvgPicture.asset("assets/icons/credit-card.svg"),
                              const Expanded(
                                child: TextField(
                                  decoration: InputDecoration(
                                      hintText: "**** **** **** 4747"),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Delivery address",
                                style: kTitleTextStyle.copyWith(
                                    fontSize: 24, fontWeight: FontWeight.bold),
                              ),
                              TextButton(
                                style: TextButton.styleFrom(
                                  textStyle: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                onPressed: () {},
                                child: const Text("CHANGE"),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              SvgPicture.asset("assets/icons/home.svg"),
                              Container(
                                // padding: const EdgeInsets.symmetric(
                                //     vertical: 30, horizontal: 60),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Alexandra Smith",
                                      style: kTitleTextStyle.copyWith(
                                          fontWeight: FontWeight.w300),
                                    ),
                                    Text(
                                      "Cesu 31 k-2 5.st, SIA Chili",
                                      style: kTitleTextStyle.copyWith(
                                          fontWeight: FontWeight.w300),
                                    ),
                                    Text(
                                      "Riga",
                                      style: kTitleTextStyle.copyWith(
                                          fontWeight: FontWeight.w300),
                                    ),
                                    Text(
                                      "LV-1012",
                                      style: kTitleTextStyle.copyWith(
                                          fontWeight: FontWeight.w300),
                                    ),
                                    Text(
                                      "Latvia",
                                      style: kTitleTextStyle.copyWith(
                                          fontWeight: FontWeight.w300),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Delivery options",
                            style: kTitleTextStyle.copyWith(
                                fontSize: 24, fontWeight: FontWeight.bold),
                          ),
                          TextButton(
                            style: TextButton.styleFrom(
                              textStyle: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            onPressed: () {},
                            child: const Text("CHANGE"),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Row(
                            children: [
                              Icon(Icons.directions_walk_outlined),
                              Text(
                                "I`ll pick it up myself",
                                style: kTitleTextStyle.copyWith(
                                    fontWeight: FontWeight.w300),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(Icons.directions_bike),
                              Text(
                                "By courier",
                                style: kTitleTextStyle.copyWith(
                                    fontWeight: FontWeight.w300),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(Icons.healing),
                              Text(
                                "By Drone",
                                style: kTitleTextStyle.copyWith(
                                    fontWeight: FontWeight.w300),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            "Non-contact-delivery",
                            style: kTitleTextStyle.copyWith(
                                fontSize: 24, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(width: 10),
                          YesNoSwitch(),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          CustomFloatingButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Creditcard()),
              );
            },
          ),
        ],
      ),
    );
  }
}
