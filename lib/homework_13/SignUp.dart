import 'package:flutter/material.dart';
import 'package:four_apps/custom_button.dart';
import 'package:four_apps/homework_13/HomeScreen.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool passwordVisible = false;
  bool confirmPasswordVisible = false;
  bool agreeToTerms = false;

  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Padding(
            padding:
                const EdgeInsets.only(top: 30, left: 16, right: 16, bottom: 16),
            child: Column(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset('assets/images/logo.png', height: 50),
                    SizedBox(height: 20),
                    Text(
                      'Create a',
                      style:
                          TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 20),
                    Text(
                      'new account',
                      style:
                          TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      decoration:
                          InputDecoration(labelText: 'Email or Phone Number'),
                      keyboardType: TextInputType.emailAddress,
                    ),
                    SizedBox(height: 10),
                    TextFormField(
                      controller: passwordController,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        suffixIcon: IconButton(
                          icon: Icon(passwordVisible
                              ? Icons.visibility
                              : Icons.visibility_off),
                          onPressed: () {
                            setState(() {
                              passwordVisible = !passwordVisible;
                            });
                          },
                        ),
                      ),
                      obscureText: !passwordVisible,
                    ),
                    SizedBox(height: 10),
                    TextFormField(
                      controller: confirmPasswordController,
                      decoration: InputDecoration(
                        labelText: 'Confirm Password',
                        suffixIcon: IconButton(
                          icon: Icon(confirmPasswordVisible
                              ? Icons.visibility
                              : Icons.visibility_off),
                          onPressed: () {
                            setState(() {
                              confirmPasswordVisible = !confirmPasswordVisible;
                            });
                          },
                        ),
                      ),
                      obscureText: !confirmPasswordVisible,
                    ),
                    SizedBox(height: 20),
                    Row(
                      children: [
                        Checkbox(
                          value: agreeToTerms,
                          onChanged: (value) {
                            setState(() {
                              agreeToTerms = value!;
                            });
                          },
                        ),
                        Expanded(
                          child: Text('I agree to the Terms and Conditions'),
                        ),
                      ],
                    ),
                  ],
                ),
                ElevatedButton(
                  onPressed: agreeToTerms &&
                          passwordController.text ==
                              confirmPasswordController.text &&
                          passwordController.text.length >= 8 &&
                          passwordController.text.length <= 16
                      ? () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HomeScreenCourse(),
                            ),
                          );
                        }
                      : null,
                  child: Text(
                    'Create Account',
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 70, vertical: 8),
                    textStyle: TextStyle(fontSize: 18),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    backgroundColor: const Color.fromARGB(255, 0, 0, 255),
                  ),
                ), // Replace with logo.
              ],
            ),
          ),
          CustomFloatingButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomeScreenCourse()),
              );
            },
          ),
        ],
      ),
    );
  }
}
