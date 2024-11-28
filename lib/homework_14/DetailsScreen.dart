import 'package:flutter/material.dart';
import 'package:four_apps/custom_button.dart';
import 'package:four_apps/homework_14/ViewScreen14.dart';

class DetailsScreen14 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image Section
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Image.asset(
              "assets/images/Niladri.png",
              fit: BoxFit.cover,
              height: 250,
            ),
          ),
          // Back and Bookmark Icons
          Positioned(
            top: 40,
            left: 16,
            child: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () => Navigator.pop(context),
            ),
          ),
          Positioned(
            top: 40,
            right: 16,
            child: Icon(Icons.bookmark_border, color: Colors.white),
          ),
          // Bottom Content
          Positioned(
            top: 200,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title and Location
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Niladri Reservoir',
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Row(
                            children: [
                              Icon(Icons.location_on,
                                  size: 16, color: Colors.grey),
                              SizedBox(width: 4),
                              Text(
                                'Tekergat, Sunamganj',
                                style: TextStyle(color: Colors.grey),
                              ),
                            ],
                          ),
                        ],
                      ),
                      CircleAvatar(
                        backgroundImage:
                            NetworkImage('https://via.placeholder.com/50'),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  // Ratings and Price
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.orange, size: 20),
                      SizedBox(width: 4),
                      Text(
                        '4.7 (2498)',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Spacer(),
                      Text(
                        '\$59/Person',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  // About Destination
                  Text(
                    'About Destination',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'You will get a complete travel package on the beaches. Packages in the form of airline tickets, recommended hotel rooms, transportation...',
                    style: TextStyle(color: Colors.grey),
                  ),
                  SizedBox(height: 8),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'Read More',
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
                  SizedBox(height: 16),
                  // Book Now Button
                  Center(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 40, vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24),
                        ),
                      ),
                      onPressed: () {},
                      child: Text(
                        'Book Now',
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          CustomFloatingButton(
            onPressed: () {
             
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ViewScreen14()),
              );
            },
          ),
        ],
      ),
    );
  }
}
