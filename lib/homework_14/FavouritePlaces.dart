import 'package:flutter/material.dart';
import 'package:four_apps/custom_button.dart';
import 'package:four_apps/homework_14/Messages.dart';

class FavoritePlacesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Favorite Places',
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
                  "Favorite Places",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 16),
                Expanded(
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                      childAspectRatio: 0.8,
                    ),
                    itemCount: favoritePlaces.length,
                    itemBuilder: (context, index) {
                      final place = favoritePlaces[index];
                      return _buildFavoritePlaceCard(
                        imageUrl: place['imageUrl']!,
                        name: place['name']!,
                        location: place['location']!,
                        rating: place['rating']!,
                        price: place['price']!,
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          CustomFloatingButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MessagesScreen()),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildFavoritePlaceCard({
    required String imageUrl,
    required String name,
    required String location,
    required double rating,
    required String price,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 6,
            spreadRadius: 1,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
            child: Image.asset(
              imageUrl,
              height: 100,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Place Name
                Text(
                  name,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 4),
                // Location
                Text(
                  location,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Dummy data for Favorite Places
final List<Map<String, dynamic>> favoritePlaces = [
  {
    "imageUrl": "assets/images/Niladri.jpg",
    "name": "Niladri Reservoir",
    "location": "Tekerghat, Sunamganj",
    "rating": 4.7,
    "price": "\$459",
  },
  {
    "imageUrl": "assets/images/Casa.jpg",
    "name": "Casa Las Tortugas",
    "location": "Av Damero, Mexico",
    "rating": 4.8,
    "price": "\$894",
  },
  {
    "imageUrl": "assets/images/Aonang.jpg",
    "name": "Ao Nang Villa Resort",
    "location": "Bastola, Islamapur",
    "rating": 4.3,
    "price": "\$761",
  },
  {
    "imageUrl": "assets/images/Ranguati.jpg",
    "name": "Rangauti Resort",
    "location": "Sylhet, Airport Road",
    "rating": 4.5,
    "price": "\$857",
  },
  {
    "imageUrl": "assets/images/Casa.jpg",
    "name": "Kachura Resort",
    "location": "Velima, Island",
    "rating": 4.6,
    "price": "\$730",
  },
  {
    "imageUrl": "assets/images/Shakardu.png",
    "name": "Shakardu Resort",
    "location": "Shakardu, Pakistan",
    "rating": 4.4,
    "price": "\$680",
  },
];
