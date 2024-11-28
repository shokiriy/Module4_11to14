import 'package:flutter/material.dart';
import 'package:four_apps/custom_button.dart';
import 'package:four_apps/homework_14/HomeScreen14.dart';

class OTPVerificationPage extends StatefulWidget {
  @override
  _OTPVerificationPageState createState() => _OTPVerificationPageState();
}

class _OTPVerificationPageState extends State<OTPVerificationPage> {
  final List<TextEditingController> _controllers =
      List.generate(4, (index) => TextEditingController());
  final List<FocusNode> _focusNodes = List.generate(4, (index) => FocusNode());

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    for (var focusNode in _focusNodes) {
      focusNode.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text(
                      "OTP Verification",
                      style: TextStyle(fontSize: 26),
                    ),
                    Text(
                      "Please check your email to see the verification code",
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "OTP Code",
                      style: TextStyle(
                        fontSize: 22,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: List.generate(4, (index) {
                        return SizedBox(
                          width: 50,
                          child: TextFormField(
                            controller: _controllers[index],
                            focusNode: _focusNodes[index],
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.center,
                            maxLength: 1,
                            decoration: InputDecoration(
                              counterText: '', // Removes character counter
                              border: OutlineInputBorder(),
                            ),
                            onChanged: (value) {
                              if (value.isNotEmpty) {
                                if (index < 3) {
                                  FocusScope.of(context)
                                      .requestFocus(_focusNodes[index + 1]);
                                } else {
                                  FocusScope.of(context)
                                      .unfocus(); // Dismiss keyboard on last field
                                }
                              }
                            },
                          ),
                        );
                      }),
                    ),
                  ],
                ),
                Column(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        String otp = _controllers
                            .map((controller) => controller.text)
                            .join();
                        if (otp.length == 4) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("OTP Verified: $otp")),
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                                content: Text("Please enter all 4 digits")),
                          );
                        }
                      },
                      child: Text(
                        "Verify",
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
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Resend code in",
                          style: TextStyle(color: Colors.grey),
                        ),
                        Text(
                          "01:26",
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                  ],
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
                MaterialPageRoute(builder: (context) => HomeScreen14()),
              );
            },
          ),
        ],
      ),
    );
  }
}
