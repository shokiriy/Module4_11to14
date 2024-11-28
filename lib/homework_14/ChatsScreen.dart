import 'package:flutter/material.dart';
import 'package:four_apps/custom_button.dart';
import 'package:four_apps/homework_14/EditProfile.dart';

class ChatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Sajib Rahman',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            Text(
              'Active Now',
              style: TextStyle(fontSize: 14, color: Colors.green),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.call, color: Colors.black),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.video_call, color: Colors.black),
          ),
        ],
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: ListView(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  children: [
                    _buildMessageBubble(
                      message: 'Hello!',
                      timestamp: '9:24',
                      isSender: true,
                      isRead: true,
                    ),
                    _buildMessageBubble(
                      message:
                          'Thank you very much for your traveling, we really like the apartments. We will stay here for another 5 days...',
                      timestamp: '9:30',
                      isSender: false,
                      isRead: false,
                    ),
                    _buildMessageBubble(
                      message: 'I’m very glad you like it 👍',
                      timestamp: '9:35',
                      isSender: true,
                      isRead: true,
                    ),
                    _buildMessageBubble(
                      message:
                          'We are arriving today at 01:45, will someone be at home?',
                      timestamp: '9:37',
                      isSender: false,
                      isRead: false,
                    ),
                    _buildMessageBubble(
                      message: 'I will be at home',
                      timestamp: '9:39',
                      isSender: true,
                      isRead: true,
                    ),
                  ],
                ),
              ),
              _buildMessageInput(),
            ],
          ),
          CustomFloatingButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => EditProfileScreen()),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildMessageBubble({
    required String message,
    required String timestamp,
    required bool isSender,
    required bool isRead,
  }) {
    return Align(
      alignment: isSender ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 4),
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        constraints: BoxConstraints(maxWidth: 250),
        decoration: BoxDecoration(
          color: isSender ? Colors.blue : Colors.grey.shade200,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(12),
            topRight: Radius.circular(12),
            bottomLeft: isSender ? Radius.circular(12) : Radius.zero,
            bottomRight: isSender ? Radius.zero : Radius.circular(12),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              message,
              style: TextStyle(
                color: isSender ? Colors.white : Colors.black,
                fontSize: 14,
              ),
            ),
            SizedBox(height: 4),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  timestamp,
                  style: TextStyle(
                    fontSize: 12,
                    color:
                        isSender ? Colors.white.withOpacity(0.7) : Colors.grey,
                  ),
                ),
                if (isSender) ...[
                  SizedBox(width: 4),
                  Icon(
                    isRead ? Icons.done_all : Icons.check,
                    size: 14,
                    color: isRead
                        ? Colors.white.withOpacity(0.7)
                        : Colors.white.withOpacity(0.5),
                  ),
                ],
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMessageInput() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          top: BorderSide(color: Colors.grey.shade300),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Type your message',
                border: InputBorder.none,
              ),
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.send, color: Colors.blue),
          ),
        ],
      ),
    );
  }
}
