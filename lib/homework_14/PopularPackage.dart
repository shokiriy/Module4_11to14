import 'package:flutter/material.dart';
import 'package:four_apps/custom_button.dart';
import 'package:four_apps/homework_14/FavouritePlaces.dart';

class PopularPackageScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Popular Package',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "All Popular Trip Package",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 16),
                Expanded(
                  child: ListView(
                    children: [
                      _buildPackageItem(
                        title: "Santorini Island",
                        dateRange: "16 July - 28 July",
                        rating: 4.8,
                        price: "\$820",
                        personCount: 24,
                        imageUrl: "assets/images/Santorini.png",
                      ),
                      _buildPackageItem(
                        title: "Bukit Rayandro",
                        dateRange: "20 Sep - 29 Sep",
                        rating: 4.3,
                        price: "\$720",
                        personCount: 24,
                        imageUrl:
                            "assets/images/Bukita.png", // Replace with actual image
                      ),
                      _buildPackageItem(
                        title: "Cluster Omega",
                        dateRange: "14 Nov - 22 Nov",
                        rating: 4.9,
                        price: "\$942",
                        personCount: 26,
                        imageUrl:
                            "assets/images/Cluster.png", // Replace with actual image
                      ),
                      _buildPackageItem(
                        title: "Shajek Bandarban",
                        dateRange: "12 Dec - 18 Dec",
                        rating: 4.5,
                        price: "\$860",
                        personCount: 27,
                        imageUrl:
                            "assets/images/Shajek.png", // Replace with actual image
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          CustomFloatingButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => FavoritePlacesScreen()),
              );
            },
          ),
        ],
      ),
    );
  }

  // Helper function to build each package item
  Widget _buildPackageItem({
    required String title,
    required String dateRange,
    required double rating,
    required String price,
    required int personCount,
    required String imageUrl,
  }) {
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 6,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          // Image
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              imageUrl,
              width: 80,
              height: 80,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: 12),
          // Content
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 2),
                Text(
                  dateRange,
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
                SizedBox(height: 2),
                Row(
                  children: [
                    Icon(Icons.star, color: Colors.amber, size: 16),
                    SizedBox(width: 4),
                    Text(
                      rating.toString(),
                      style:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(height: 2),
                Row(
                  children: [
                    Icon(Icons.person, color: Colors.grey, size: 16),
                    SizedBox(width: 4),
                    Text(
                      "$personCount Person Joined",
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                  ],
                ),
              ],
            ),
          ),
          // Price and Person Count
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                price,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
