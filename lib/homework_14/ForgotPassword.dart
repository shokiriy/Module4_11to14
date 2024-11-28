import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:four_apps/custom_button.dart';
import 'package:four_apps/homework_14/Verification.dart';

class ForgotPasswordPage extends StatelessWidget {
  final _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(elevation: 0),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Forgot Password",
                      style: TextStyle(fontSize: 24),
                    ),
                    Text("Enter your email account to reset  your password"),
                    SizedBox(height: 20),
                    TextFormField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        labelText: "Email",
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ],
                ),
                ElevatedButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: Text("Check Your Email"),
                        content: Text(
                            "We have sent password recovery instructions to your email."),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context); // Close dialog
                              // Navigate to OTP Verification
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        OTPVerificationPage()),
                              );
                            },
                            child: Text("OK"),
                          ),
                        ],
                      ),
                    );
                  },
                  child: Text(
                    "Reset Password",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 80, vertical: 15),
                    textStyle: TextStyle(fontSize: 18),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    backgroundColor: const Color.fromARGB(255, 0, 0, 255),
                  ),
                ),
                SizedBox(height: 100),
              ],
            ),
          ),
          CustomFloatingButton(
            onPressed: () {
              // Navigate to another screen
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => OTPVerificationPage()),
              );
            },
          ),
        ],
      ),
    );
  }
}
