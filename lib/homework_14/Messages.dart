import 'package:flutter/material.dart';
import 'package:four_apps/custom_button.dart';
import 'package:four_apps/homework_14/ChatsScreen.dart';

class MessagesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Messages',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search, color: Colors.black),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.edit, color: Colors.black),
          ),
        ],
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Search for chats & messages',
                    prefixIcon: Icon(Icons.search, color: Colors.grey),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide.none,
                    ),
                    filled: true,
                    fillColor: Colors.grey.shade200,
                  ),
                ),
                SizedBox(height: 16),
                Expanded(
                  child: ListView.builder(
                    itemCount: messages.length,
                    itemBuilder: (context, index) {
                      final message = messages[index];
                      return _buildMessageTile(
                        profileImage: message['profileImage']!,
                        name: message['name']!,
                        lastMessage: message['lastMessage']!,
                        timestamp: message['timestamp']!,
                        isTyping: message['isTyping']!,
                        isUnread: message['isUnread']!,
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
                MaterialPageRoute(builder: (context) => ChatScreen()),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildMessageTile({
    required String profileImage,
    required String name,
    required String lastMessage,
    required String timestamp,
    required bool isTyping,
    required bool isUnread,
  }) {
    return ListTile(
      leading: CircleAvatar(
        radius: 24,
        backgroundImage: AssetImage(profileImage),
      ),
      title: Text(
        name,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Text(
        isTyping ? "Typing..." : lastMessage,
        style: TextStyle(
          fontSize: 14,
          color: isTyping ? Colors.blue : Colors.grey,
        ),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            timestamp,
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey,
            ),
          ),
          if (isUnread) SizedBox(height: 4),
          if (isUnread)
            Container(
              width: 8,
              height: 8,
              decoration: BoxDecoration(
                color: Colors.blue,
                shape: BoxShape.circle,
              ),
            ),
        ],
      ),
      onTap: () {
        // Navigate to individual chat
      },
    );
  }
}

// Dummy data for messages
final List<Map<String, dynamic>> messages = [
  {
    "profileImage": "assets/images/SajibRahmon.png",
    "name": "Sajib Rahman",
    "lastMessage": "Hi, John! How are you doing?",
    "timestamp": "09:45",
    "isTyping": false,
    "isUnread": true,
  },
  {
    "profileImage": "assets/images/Adom.png",
    "name": "Adom Shafi",
    "lastMessage": "",
    "timestamp": "09:42",
    "isTyping": true,
    "isUnread": true,
  },
  {
    "profileImage": "assets/images/Rumen.png",
    "name": "HR Rumen",
    "lastMessage": "Cool! Let's meet at 18:00 near the traveling!",
    "timestamp": "Yesterday",
    "isTyping": false,
    "isUnread": false,
  },
  {
    "profileImage": "assets/images/Anjelina.png",
    "name": "Anjelina",
    "lastMessage": "Hey, will you come to the party on Saturday?",
    "timestamp": "07:56",
    "isTyping": false,
    "isUnread": true,
  },
  {
    "profileImage": "assets/images/Alexa.png",
    "name": "Alexa Shorna",
    "lastMessage": "Thank you for coming! Your order is ready.",
    "timestamp": "05:52",
    "isTyping": false,
    "isUnread": false,
  },
];
