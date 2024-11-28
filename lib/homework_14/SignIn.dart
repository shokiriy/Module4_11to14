import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:four_apps/custom_button.dart';
import 'package:four_apps/homework_14/ForgotPassword.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _passwordVisible = false;

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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    Text(
                      "Sign in now",
                      style: TextStyle(fontSize: 24),
                    ),
                    Text("Please sign in to continue our app"),
                    SizedBox(height: 20),
                    TextFormField(
                      controller: _emailController,
                      decoration: InputDecoration(
                          labelText: "Email", border: OutlineInputBorder()),
                    ),
                    SizedBox(height: 15),
                    TextFormField(
                      controller: _passwordController,
                      obscureText: !_passwordVisible,
                      decoration: InputDecoration(
                        labelText: "Password",
                        suffixIcon: IconButton(
                          icon: Icon(_passwordVisible
                              ? Icons.visibility
                              : Icons.visibility_off),
                          onPressed: () {
                            setState(() {
                              _passwordVisible = !_passwordVisible;
                            });
                          },
                        ),
                        border: OutlineInputBorder(),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ForgotPasswordPage()),
                          );
                        },
                        child: Text("Forgot Password?"),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        // Add sign-in logic here
                      },
                      child: Text(
                        "Sign In",
                        style: TextStyle(color: Colors.white),
                      ),
                      style: ElevatedButton.styleFrom(
                        padding:
                            EdgeInsets.symmetric(horizontal: 90, vertical: 15),
                        textStyle: TextStyle(fontSize: 18),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        backgroundColor: const Color.fromARGB(255, 0, 0, 255),
                      ),
                    ),
                    Center(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SignUpPage()),
                          );
                        },
                        child: Text(
                          "Don't have an account? Sign Up",
                          style: TextStyle(color: Colors.blue),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Center(child: Text("Or connect")),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.facebook, color: Colors.blue),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.email, color: Colors.red),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.message, color: Colors.lightBlue),
                    ),
                  ],
                ),
              ],
            ),
          ),
          CustomFloatingButton(
            onPressed: () {
              // Navigate to another screen
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SignUpPage()),
              );
            },
          ),
        ],
      ),
    );
  }
}

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _passwordVisible = false;
  bool _isPasswordInvalid = false;

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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    Text(
                      "Sign up now",
                      style: TextStyle(fontSize: 24),
                    ),
                    Text("Please fill the details and create acoount"),
                    SizedBox(height: 20),
                    TextFormField(
                      controller: _nameController,
                      decoration: InputDecoration(labelText: "Name"),
                    ),
                    TextFormField(
                      controller: _emailController,
                      decoration: InputDecoration(labelText: "Email"),
                    ),
                    TextFormField(
                      controller: _passwordController,
                      obscureText: !_passwordVisible,
                      onChanged: (value) {
                        setState(() {
                          _isPasswordInvalid = value.length < 8;
                        });
                      },
                      decoration: InputDecoration(
                        labelText: "Password",
                        suffixIcon: IconButton(
                          icon: Icon(
                            _passwordVisible
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                          onPressed: () {
                            setState(() {
                              _passwordVisible = !_passwordVisible;
                            });
                          },
                        ),
                      ),
                    ),
                    if (_isPasswordInvalid)
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text(
                          "Password must be 8 characters",
                          style: TextStyle(color: Colors.red, fontSize: 12),
                        ),
                      ),
                  ],
                ),
                Column(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        if (_nameController.text.isNotEmpty &&
                            _emailController.text.isNotEmpty &&
                            _passwordController.text.length >= 8) {
                          Fluttertoast.showToast(msg: "Account Created!");
                          Navigator.pop(context); // Go back to the SignInPage
                        } else {
                          Fluttertoast.showToast(
                            msg:
                                "Please fill all fields and ensure password is valid",
                          );
                        }
                      },
                      child: Text(
                        "Sign Up",
                        style: TextStyle(color: Colors.white),
                      ),
                      style: ElevatedButton.styleFrom(
                        padding:
                            EdgeInsets.symmetric(horizontal: 90, vertical: 15),
                        textStyle: TextStyle(fontSize: 18),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        backgroundColor: const Color.fromARGB(255, 0, 0, 255),
                      ),
                    ),
                    Center(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pop(context); // Navigate back to SignInPage
                        },
                        child: Text(
                          "Already have an account? Sign In",
                          style: TextStyle(color: Colors.blue),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Center(child: Text("Or connect")),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.facebook, color: Colors.blue),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.email, color: Colors.red),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.message, color: Colors.lightBlue),
                    ),
                  ],
                ),
              ],
            ),
          ),
          CustomFloatingButton(
            onPressed: () {
              // Navigate to another screen
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ForgotPasswordPage()),
              );
            },
          ),
        ],
      ),
    );
  }
}
