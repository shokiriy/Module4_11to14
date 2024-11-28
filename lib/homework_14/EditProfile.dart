import 'package:flutter/material.dart';
import 'package:four_apps/custom_button.dart';
import 'package:four_apps/homework_14/Notification.dart';

class EditProfileScreen extends StatelessWidget {
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
          'Edit Profile',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          TextButton(
            onPressed: () {
              // Save profile changes
            },
            child: Text(
              'Done',
              style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Profile Picture
                Center(
                  child: Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      CircleAvatar(
                        radius: 50,
                        backgroundImage:
                            AssetImage('assets/images/Leonardo.png'),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: GestureDetector(
                          onTap: () {
                            // Change profile picture
                          },
                          child: CircleAvatar(
                            radius: 16,
                            backgroundColor: Colors.blue,
                            child: Icon(Icons.camera_alt,
                                size: 16, color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 16),

                // Input Fields
                _buildEditableField('First Name', 'Leonardo', true),
                _buildEditableField('Last Name', 'Ahmed', true),
                _buildEditableField('Location', 'Sylhet, Bangladesh', true),
                _buildEditableField('Mobile Number', '+88 01758-000666', true),
              ],
            ),
          ),
          CustomFloatingButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => NotificationScreen()),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildEditableField(String label, String value, bool isEditable) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 20),
        Text(
          label,
          style: TextStyle(
              fontSize: 14, fontWeight: FontWeight.w500, color: Colors.grey),
        ),
        SizedBox(height: 8),
        TextFormField(
          initialValue: value,
          enabled: isEditable,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.grey.shade100,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Colors.grey.shade300),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Colors.blue, width: 1.5),
            ),
            suffixIcon: Icon(Icons.check, color: Colors.blue),
          ),
        ),
      ],
    );
  }
}
