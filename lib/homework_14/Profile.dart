import 'package:flutter/material.dart';
import 'package:four_apps/custom_button.dart';
import 'package:four_apps/homework_14/PopularPackage.dart';

class ProfileScreen extends StatelessWidget {
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
          'Profile',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.edit, color: Colors.black),
            onPressed: () {
              // Add Edit Profile Action
            },
          ),
        ],
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Profile Picture and Name Section
                  SizedBox(height: 16),
                  CircleAvatar(
                      radius: 50,
                      backgroundImage:
                          AssetImage("assets/images/Leonardo.png")),
                  SizedBox(height: 12),
                  Text(
                    'Leonardo',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'leonardo@gmail.com',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(height: 20),
                  // Reward Points, Travel Trips, Bucket List
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildStats('Reward Points', '360'),
                      _buildStats('Travel Trips', '238'),
                      _buildStats('Bucket List', '473'),
                    ],
                  ),
                  SizedBox(height: 20),
                  Divider(),
                  // Profile Menu Options
                  ListView(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    children: [
                      _buildMenuOption(Icons.person, 'Profile', onTap: () {
                        // Add navigation to Profile
                      }),
                      _buildMenuOption(Icons.bookmark, 'Bookmarked', onTap: () {
                        // Add navigation to Bookmarked
                      }),
                      _buildMenuOption(Icons.history, 'Previous Trips',
                          onTap: () {
                        // Add navigation to Previous Trips
                      }),
                      _buildMenuOption(Icons.settings, 'Settings', onTap: () {
                        // Add navigation to Settings
                      }),
                      _buildMenuOption(Icons.help_outline, 'Support',
                          onTap: () {
                        // Add navigation to Support
                      }),
                      _buildMenuOption(Icons.logout, 'Log Out', onTap: () {
                        // Add Log Out functionality
                      }),
                    ],
                  ),
                ],
              ),
            ),
          ),
          CustomFloatingButton(
            onPressed: () {
              // Navigate to another screen
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PopularPackageScreen()),
              );
            },
          ),
        ],
      ),
    );
  }

  // Helper Widget for Stats Row
  Widget _buildStats(String label, String value) {
    return Column(
      children: [
        Text(
          value,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }

  // Helper Widget for Menu Options
  Widget _buildMenuOption(IconData icon, String label,
      {required VoidCallback onTap}) {
    return ListTile(
      leading: Icon(icon, color: Colors.blue),
      title: Text(
        label,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
      trailing: Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
      onTap: onTap,
    );
  }
}
