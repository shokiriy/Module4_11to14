import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:four_apps/constants.dart';
import 'package:four_apps/custom_button.dart';
import 'package:four_apps/homework_11/BottomnavBar.dart';
import 'package:four_apps/homework_11/Item.dart';
import 'package:four_apps/homework_11/models/VegItem.dart';
import 'package:four_apps/homework_11/models/VegetablesTitle.dart';

class Vegetables extends StatelessWidget {
  const Vegetables({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const BottomNavBar(),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 50, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    SvgPicture.asset("assets/icons/vector.svg"),
                  ],
                ),
                const SizedBox(height: 10),
                const Text("Vegetables", style: kHeadingextStyle),
                Container(
                  // margin: const EdgeInsets.symmetric(vertical: 30),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                  height: 60,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: const Color(0xFFF5F5F7),
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: Row(
                    children: <Widget>[
                      SvgPicture.asset("assets/icons/search.svg"),
                      const SizedBox(width: 16),
                      const Text(
                        "Search",
                        style: TextStyle(
                          fontSize: 18,
                          color: Color(0xFFA0A5BD),
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                const SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Column(
                    children: [
                      Row(
                        children: <Widget>[
                          CategoryTitle(
                              title: "Сabbage and lettuce (14)", active: true),
                          CategoryTitle(title: "Сucumbers and tomatoes (10)"),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          CategoryTitle(title: "Oinons and garlic (8)"),
                          CategoryTitle(title: "Peppers (7)"),
                          CategoryTitle(title: "Potatoes and carrots (4)"),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                Expanded(
                  child: SingleChildScrollView(
                    // crossAxisCount: 1,
                    // childAspectRatio: .85,
                    // crossAxisSpacing: 20,
                    // mainAxisSpacing: 20,
                    child: Column(
                      children: [
                        GestureDetector(
                          child: Item(
                            name: "Boston",
                            price: "1.10",
                            image: "assets/images/BostonLettuce.png",
                            press: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return const ItemBoston();
                                  },
                                ),
                              );
                            },
                          ),
                        ),
                        const SizedBox(height: 10),
                        Item(
                          name: "Purple",
                          price: "1.85",
                          image: "assets/images/Purple.png",
                          press: () {},
                        ),
                        const SizedBox(height: 10),
                        Item(
                          name: "Savoy",
                          price: "1.45",
                          image: "assets/images/Savoy.png",
                          press: () {},
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
                MaterialPageRoute(builder: (context) => ItemBoston()),
              );
            },
          ),
        ],
      ),
    );
  }
}
