import 'package:flutter/material.dart';
import 'package:four_apps/custom_button.dart';
import 'package:four_apps/homework_11/Categories.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 182, 16, 197),
              image: DecorationImage(
                  image: AssetImage("assets/images/base.png"),
                  alignment: Alignment.topRight),
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 148),
              child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                    color: Color.fromARGB(255, 230, 222, 222)),
                child: Column(
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      width: 104,
                      height: 104,
                      margin: const EdgeInsets.only(top: 60),
                      child: const Icon(
                        Icons.check_box,
                        size: 40,
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      "Non-Contact \n   Deliveries",
                      style:
                          TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      "       When placing an order, select the option\n “Contactless delivery” and the courier will leave\n                your order at the door.",
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 20),
                    GestureDetector(
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return Categories();
                              },
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          minimumSize: const Size(370, 60),
                        ),
                        child: Text("ORDER NOW"),
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        "DISMISS",
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          CustomFloatingButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Categories()),
              );
            },
          ),
        ],
      ),
    );
  }
}
