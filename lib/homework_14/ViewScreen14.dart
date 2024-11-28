import 'package:flutter/material.dart';
import 'package:four_apps/custom_button.dart';
import 'package:four_apps/homework_14/ScheduleScreen.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ViewScreen14 extends StatelessWidget {
  final LatLng destinationLocation =
      LatLng(23.6850, 90.3563); // Example location

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/View14.jpg',
              fit: BoxFit.cover,
            ),
          ),
          // Google Map
          GoogleMap(
            initialCameraPosition: CameraPosition(
              target: destinationLocation,
              zoom: 14.0,
            ),
            markers: {
              Marker(
                markerId: MarkerId('destination'),
                position: destinationLocation,
                infoWindow: InfoWindow(title: 'Niladri Reservoir'),
              ),
              Marker(
                markerId: MarkerId('hotel'),
                position: LatLng(23.6860, 90.3580),
                infoWindow: InfoWindow(title: 'La-Hotel'),
              ),
              Marker(
                markerId: MarkerId('restaurant'),
                position: LatLng(23.6845, 90.3550),
                infoWindow: InfoWindow(title: 'Lemon Garden'),
              ),
            },
          ),
          // Top Back Button
          Positioned(
            top: 40,
            left: 16,
            child: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.black),
              onPressed: () => Navigator.pop(context),
            ),
          ),
          // Tooltips for Markers
          Positioned(
            top: 80,
            right: 16,
            child: Column(
              children: [
                _buildTooltip(
                  context: context,
                  title: 'La-Hotel',
                  distance: '2.09 mi',
                  image: "assets/images/LaHotel.jpg",
                ),
                SizedBox(height: 16),
                _buildTooltip(
                  context: context,
                  title: 'Lemon Garden',
                  distance: '2.09 mi',
                  image: "assets/images/View14.jpg",
                ),
              ],
            ),
          ),
          // Destination Info Card
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 10,
                    spreadRadius: 2,
                  ),
                ],
              ),
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Destination Details
                  Row(
                    children: [
                      SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Niladri Reservoir',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 8),
                            Row(
                              children: [
                                Icon(Icons.location_on,
                                    color: Colors.grey, size: 16),
                                SizedBox(width: 4),
                                Text(
                                  'Tekergat, Sunamganj',
                                  style: TextStyle(color: Colors.grey),
                                ),
                              ],
                            ),
                            SizedBox(height: 8),
                            Row(
                              children: [
                                Icon(Icons.timer, color: Colors.grey, size: 16),
                                SizedBox(width: 4),
                                Text(
                                  '45 Minutes',
                                  style: TextStyle(color: Colors.grey),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  // See On The Map Button
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
                        'See On The Map',
                        style: TextStyle(fontSize: 16, color: Colors.white),
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
                MaterialPageRoute(builder: (context) => ScheduleScreen()),
              );
            },
          ),
        ],
      ),
    );
  }

  // Tooltip Widget
  Widget _buildTooltip({
    required BuildContext context,
    required String title,
    required String distance,
    required String image,
  }) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            spreadRadius: 1,
          ),
        ],
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              image,
              width: 50,
              height: 50,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 4),
              Text(
                distance,
                style: TextStyle(color: Colors.grey, fontSize: 12),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
