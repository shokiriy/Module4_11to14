import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:four_apps/constants.dart';
import 'package:four_apps/custom_button.dart';
import 'package:four_apps/homework_11/BottomnavBar.dart';
import 'package:four_apps/homework_11/Vegetables.dart';
import 'package:four_apps/homework_11/models/category.dart';

class Categories extends StatelessWidget {
  const Categories({super.key});

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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    SvgPicture.asset("assets/icons/vector.svg"),
                  ],
                ),
                const SizedBox(height: 30),
                const Text("Categories", style: kHeadingextStyle),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 30),
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
                const SizedBox(height: 30),
                Expanded(
                  child: GridView.count(
                    crossAxisCount: 2,
                    childAspectRatio: .85,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
                    children: [
                      CategoryCard11(
                        title: "Vegetables",
                        title2: "(43)",
                        svgSrc: "assets/images/vegetables.png",
                        press: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) {
                              return Vegetables();
                            }),
                          );
                        },
                      ),
                      CategoryCard11(
                        title: "Fruits",
                        title2: "(32)",
                        svgSrc: "assets/images/fruits.png",
                        press: () {},
                      ),
                      CategoryCard11(
                        title: "Bread",
                        title2: "(22)",
                        svgSrc: "assets/images/breads.png",
                        press: () {},
                      ),
                      CategoryCard11(
                        title: "Sweets",
                        title2: "(50)",
                        svgSrc: "assets/images/sweets.png",
                        press: () {},
                      ),
                      CategoryCard11(
                        title: "Pasta",
                        title2: "(26)",
                        svgSrc: "assets/images/pasta.png",
                        press: () {},
                      ),
                      CategoryCard11(
                        title: "Drinks",
                        title2: "(18)",
                        svgSrc: "assets/images/drinks.png",
                        press: () {},
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          CustomFloatingButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Vegetables()),
              );
            },
          ),
        ],
      ),
    );
  }
}
