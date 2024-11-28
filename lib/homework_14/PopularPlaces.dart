import 'package:flutter/material.dart';
import 'package:four_apps/custom_button.dart';
import 'package:four_apps/homework_14/Profile.dart';

class PopularPlacesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Popular Places',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Section Title
                Text(
                  'All Popular Places',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 16),
                // Grid of Popular Places
                Expanded(
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, // Two cards per row
                      mainAxisSpacing: 16,
                      crossAxisSpacing: 16,
                      childAspectRatio: 3 / 4, // Adjust card size ratio
                    ),
                    itemCount: popularPlaces.length,
                    itemBuilder: (context, index) {
                      final place = popularPlaces[index];
                      return PopularPlaceCard(place: place);
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
                MaterialPageRoute(builder: (context) => ProfileScreen()),
              );
            },
          ),
        ],
      ),
    );
  }
}

// Data Model for a Popular Place
class PopularPlace {
  final String imageUrl;
  final String title;
  final String location;
  final String price;
  final double rating;

  PopularPlace({
    required this.imageUrl,
    required this.title,
    required this.location,
    required this.price,
    required this.rating,
  });
}

// Sample Data
final List<PopularPlace> popularPlaces = [
  PopularPlace(
    imageUrl: 'assets/images/Niladri.jpg',
    title: 'Niladri Reservoir',
    location: 'Tekergat, Sunamganj',
    price: '\$459/Person',
    rating: 4.7,
  ),
  PopularPlace(
    imageUrl: 'assets/images/Casa.jpg',
    title: 'Casa Las Tortugas',
    location: 'Av Damero, Mexico',
    price: '\$894/Person',
    rating: 4.8,
  ),
  PopularPlace(
    imageUrl: 'assets/images/Aonang.jpg',
    title: 'Ao Nang Villa Resort',
    location: 'Bastola, Islampur',
    price: '\$761/Person',
    rating: 4.3,
  ),
  PopularPlace(
    imageUrl: 'assets/images/Ranguati.jpg',
    title: 'Rangauti Resort',
    location: 'Sylhet, Airport Road',
    price: '\$857/Person',
    rating: 4.5,
  ),
];

// Widget for Each Popular Place Card
class PopularPlaceCard extends StatelessWidget {
  final PopularPlace place;

  const PopularPlaceCard({required this.place});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Handle navigation or actions
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 8,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Place Image
            ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
              child: Image.asset(
                place.imageUrl,
                height: 120,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            // Place Details
            Padding(
              padding:
                  const EdgeInsets.only(top: 2, right: 8, left: 8, bottom: 2),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    place.title,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 4),
                  Text(
                    place.location,
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 4),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Price
                      Text(
                        place.price,
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                        ),
                      ),
                      // Rating
                      Row(
                        children: [
                          Icon(Icons.star, size: 12, color: Colors.amber),
                          SizedBox(width: 2),
                          Text(
                            place.rating.toString(),
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
