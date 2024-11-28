import 'package:flutter/material.dart';
import 'package:four_apps/custom_button.dart';
import 'package:four_apps/homework_14/PopularPlaces.dart';

class ScheduleScreen extends StatelessWidget {
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
          'Schedule',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Calendar Section
              Container(
                color: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      '22 October',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: ['S', 'M', 'T', 'W', 'T', 'F', 'S']
                          .map(
                            (day) => Column(
                              children: [
                                Text(
                                  day,
                                  style: TextStyle(color: Colors.grey),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 4),
                                  width: 30,
                                  height: 30,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: day == 'T'
                                        ? Colors.blue
                                        : Colors.transparent,
                                    shape: BoxShape.circle,
                                  ),
                                  child: Text(
                                    '22',
                                    style: TextStyle(
                                      color: day == 'T'
                                          ? Colors.white
                                          : Colors.black,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                          .toList(),
                    ),
                  ],
                ),
              ),
              Divider(),
              // Schedule List
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.all(16),
                  children: [
                    ScheduleItem(
                      image: 'assets/images/Niladri.png',
                      title: 'Niladri Reservoir',
                      location: 'Tekergat, Sunamganj',
                      date: '26 January 2022',
                    ),
                    ScheduleItem(
                      image: 'assets/images/LaHotel.jpg',
                      title: 'High Tech Park',
                      location: 'Zero Point, Sylhet',
                      date: '26 January 2022',
                    ),
                    ScheduleItem(
                      image: 'assets/images/View14.jpg',
                      title: 'Darma Reservoir',
                      location: 'Darma, Kuningan',
                      date: '26 January 2022',
                    ),
                  ],
                ),
              ),
            ],
          ),
          CustomFloatingButton(
            onPressed: () {
              // Navigate to another screen
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PopularPlacesScreen()),
              );
            },
          ),
        ],
      ),
      // Bottom Navigation Bar
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1, // Assuming Calendar is the second tab
        onTap: (index) {
          // Navigate to the selected screen
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: 'Calendar',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
      ),
    );
  }
}

class ScheduleItem extends StatelessWidget {
  final String image;
  final String title;
  final String location;
  final String date;

  const ScheduleItem({
    required this.image,
    required this.title,
    required this.location,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      child: Row(
        children: [
          // Image
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              image,
              width: 80,
              height: 80,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: 16),
          // Details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  location,
                  style: TextStyle(color: Colors.grey),
                ),
                SizedBox(height: 8),
                Text(
                  date,
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ),
          Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
        ],
      ),
    );
  }
}
