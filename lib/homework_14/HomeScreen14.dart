import 'package:flutter/material.dart';
import 'package:four_apps/custom_button.dart';
import 'package:four_apps/homework_14/DetailsScreen.dart';

class HomeScreen14 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CircleAvatar(
                backgroundImage: AssetImage("assets/images/Leonardo.png")),
            Icon(Icons.notifications),
          ],
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        titleSpacing: 16,
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Explore the',
                  style: TextStyle(fontSize: 24),
                ),
                Text(
                  'Beautiful world!',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.orange,
                  ),
                ),
                SizedBox(height: 16),
                Text('Best Destination'),
                SizedBox(height: 8),
                Expanded(
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetailsScreen14(),
                            ),
                          );
                        },
                        child: Card(
                          margin: EdgeInsets.only(right: 16),
                          child: SizedBox(
                            width: 150,
                            height: 400,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.asset("assets/images/Niladri.png"),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    'Niladri Reservoir',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      Icon(Icons.star,
                                          color: Colors.orange, size: 16),
                                      Text('4.7'),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          CustomFloatingButton(
            onPressed: () {
              // Navigate to another screen
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => DetailsScreen14()),
              );
            },
          ),
        ],
      ),
    );
  }
}
