import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Notification',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          TextButton(
            onPressed: () {
              // Clear all notifications logic
            },
            child: Text(
              'Clear all',
              style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
      body: DefaultTabController(
        length: 3,
        child: Column(
          children: [
            // Tab Bar
            Container(
              color: Colors.white,
              child: TabBar(
                indicatorColor: Colors.blue,
                labelColor: Colors.black,
                unselectedLabelColor: Colors.grey,
                tabs: [
                  Tab(text: 'Recent'),
                  Tab(text: 'Earlier'),
                  Tab(text: 'Archived'),
                ],
              ),
            ),
            // TabBarView Content
            Expanded(
              child: TabBarView(
                children: [
                  _buildNotificationList(), // Recent notifications
                  _buildNotificationList(), // Earlier notifications
                  _buildNotificationList(), // Archived notifications
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget for notification list
  Widget _buildNotificationList() {
    return ListView.separated(
      padding: EdgeInsets.all(16),
      itemCount: 6,
      separatorBuilder: (context, index) =>
          Divider(height: 24, color: Colors.transparent),
      itemBuilder: (context, index) {
        return Row(
          children: [
            // Notification Avatar
            CircleAvatar(
              radius: 24,
              backgroundColor: Colors.grey.shade300,
              child: Image.asset("assets/images/Alexa.png"),
            ),
            SizedBox(width: 16),
            // Notification Content
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Super Offer',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'Get 60% off in our first booking',
                    style: TextStyle(color: Colors.grey, fontSize: 14),
                  ),
                ],
              ),
            ),
            SizedBox(width: 16),
            // Notification Time
            Text(
              'Sun, 12:40pm',
              style: TextStyle(color: Colors.grey, fontSize: 12),
            ),
          ],
        );
      },
    );
  }
}
