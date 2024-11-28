import 'package:flutter/material.dart';
import 'package:four_apps/custom_button.dart';
import 'package:four_apps/homework_14/Splash.dart';

class HomeScreenCourse extends StatelessWidget {
  final List<Map<String, String>> recommendedCourses = [
    {
      'image': 'assets/images/course1.png',
      'name': 'Junior Scholars Institute',
      'author': 'Jos Brown',
      'rating': '4.5',
      'price': '\$24'
    },
    {
      'image': 'assets/images/course2.png',
      'name': 'Junior Scholars Institute',
      'author': 'Jos Brown',
      'rating': '4.7',
      'price': '\$24'
    },
  ];

  final List<Map<String, String>> trendingCourses = [
    {
      'image': 'assets/images/course3.png',
      'name': 'Python for AI',
      'author': 'Mark Lee',
      'rating': '4.8',
      'price': '\$24'
    },
    {
      'image': 'assets/images/course4.png',
      'name': 'Data Science',
      'author': 'Anna Bell',
      'rating': '4.6',
      'price': '\$24'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Padding(
            padding:
                const EdgeInsets.only(top: 25, right: 16, left: 16, bottom: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Recommended Courses',
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                SizedBox(height: 10),
                Container(
                  height: 150,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: recommendedCourses.length,
                    itemBuilder: (context, index) {
                      return buildCourseCard(recommendedCourses[index]);
                    },
                  ),
                ),
                SizedBox(height: 20),
                Text('Top Trending',
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                SizedBox(height: 10),
                Container(
                  height: 150,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: trendingCourses.length,
                    itemBuilder: (context, index) {
                      return buildCourseCard(trendingCourses[index]);
                    },
                  ),
                ),
                SizedBox(height: 20),
                Text('Our Top Picks for You',
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                SizedBox(height: 10),
                Expanded(
                  child: PageView.builder(
                    itemCount: recommendedCourses.length,
                    itemBuilder: (context, index) {
                      return buildCourseCard(recommendedCourses[index]);
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
                MaterialPageRoute(builder: (context) => SplashScreen14()),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget buildCourseCard(Map<String, String> course) {
    return Card(
      margin: EdgeInsets.only(right: 10),
      child: Container(
        width: 180,
        // padding: EdgeInsets.all(5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(course['image']!,
                height: 75, width: double.infinity, fit: BoxFit.cover),
            SizedBox(height: 2),
            Padding(
              padding:
                  const EdgeInsets.only(left: 8, top: 2, bottom: 2, right: 2),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(course['name']!,
                      style:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                  Text('${course['author']}'),
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.amber, size: 16),
                      Text('${course['rating']}'),
                    ],
                  ),
                  Text(course['price']!, style: TextStyle(color: Colors.green)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
