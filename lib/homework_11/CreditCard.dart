import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:four_apps/constants.dart';
import 'package:four_apps/custom_button.dart';
import 'package:four_apps/homework_12/HomeScreen.dart';

class Creditcard extends StatefulWidget {
  const Creditcard({super.key});

  @override
  State<Creditcard> createState() => _CreditcardState();
}

class _CreditcardState extends State<Creditcard> {
  String cardNum = "1234 1234 1234 1234";
  String cardName = "Alexandra Smith";
  String cardExpire = "07/21";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 170, 205, 240),
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 30, right: 20, left: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SvgPicture.asset("assets/icons/vector.svg"),
                Text("Credit /Debit Card", style: kHeadingextStyle),
                Container(
                  height: 150,
                  width: 400,
                  decoration: BoxDecoration(
                      color: Color.fromARGB(138, 233, 29, 233),
                      borderRadius: BorderRadius.circular(20)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(height: 40),
                        Text(
                          cardNum,
                          style: TextStyle(fontSize: 24),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              cardName,
                              style: TextStyle(fontSize: 20),
                            ),
                            Text(
                              cardExpire,
                              style: TextStyle(fontSize: 20),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 50),
                Column(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Name on card"),
                        SizedBox(
                          height: 44,
                          child: TextFormField(
                            onChanged: (value) {
                              setState(() {
                                cardName = value;
                              });
                            },
                            decoration: InputDecoration(
                              hintText: 'Alexandra Smith',
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 15),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Card number"),
                        SizedBox(
                          height: 44,
                          child: TextFormField(
                            onChanged: (value) {
                              setState(() {
                                cardNum = value;
                              });
                            },
                            decoration: InputDecoration(
                              hintText: '1234 1234 1234 1234',
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Expire date"),
                            SizedBox(
                              height: 44,
                              width: 90,
                              child: TextFormField(
                                onChanged: (value) {
                                  setState(() {
                                    cardExpire = value;
                                  });
                                },
                                decoration: InputDecoration(
                                  hintText: '07/21',
                                  border: OutlineInputBorder(),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(width: 100),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("CVC"),
                            SizedBox(
                              height: 44,
                              width: 50,
                              child: TextFormField(
                                decoration: InputDecoration(
                                  hintText: '474',
                                  border: OutlineInputBorder(),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 30),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(300, 40),
                        backgroundColor: Colors.green,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Text("USE THIS CARD"),
                    )
                  ],
                ),
              ],
            ),
          ),
          CustomFloatingButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomeScreen()),
              );
            },
          ),
        ],
      ),
    );
  }
}
