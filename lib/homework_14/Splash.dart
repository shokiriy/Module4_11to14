import 'package:flutter/material.dart';
import 'package:four_apps/homework_14/SignIn.dart';

class SplashScreen14 extends StatelessWidget {
  const SplashScreen14({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const OnboardingScreen()),
      );
    });

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 0, 0, 255),
      body: Center(
        child: Text(
          'Travener',
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<Map<String, String>> _onboardData = [
    {
      'image': 'assets/images/onBoard1.png', // Replace with your image paths
      'title': 'wide',
      'prefix': 'Life is short and the world is ',
      'suffix': '',
      'description':
          'At Friends tours and travel, we customize reliable and trustworthy educational tours to destinations all over the world.',
    },
    {
      'image': 'assets/images/onBoard2.jpg',
      'title': 'explore',
      'prefix': 'It’s a big world out there, go ',
      'suffix': '',
      'description':
          'To get the best of your adventure, you just need to leave and go where you like, we are waiting for you.',
    },
    {
      'image': 'assets/images/onBoard3.jpg',
      'title': 'people',
      'prefix': 'People don’t take trips, trips take ',
      'suffix': '',
      'description':
          'To get the best of your adventure, you just need to leave and go where you like, we are waiting for you.',
    },
  ];

  void _nextPage() {
    if (_currentPage < _onboardData.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  _currentPage = index;
                });
              },
              itemCount: _onboardData.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    // Display the image
                    Image.asset(
                      _onboardData[index]['image']!,
                      height: MediaQuery.of(context).size.height / 2,
                      fit: BoxFit.cover,
                    ),
                    const SizedBox(height: 20),

                    // Styled title with underline
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Column(
                        children: [
                          RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              style: const TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                              children: [
                                TextSpan(text: _onboardData[index]['prefix']!),
                                TextSpan(
                                  text: _onboardData[index]['title']!,
                                  style: const TextStyle(
                                    color: Colors.orange,
                                  ),
                                ),
                                TextSpan(text: _onboardData[index]['suffix']!),
                              ],
                            ),
                          ),
                          const SizedBox(height: 10),

                          // Add the underline below the styled word
                          SizedBox(
                            height: 4,
                            child: Center(
                              child: Container(
                                height: 2, // Thickness of the underline
                                width: 60, // Width of the underline
                                color: Colors.orange, // Color of underline
                              ),
                            ),
                          ),

                          const SizedBox(height: 20),

                          // Onboarding description
                          Text(
                            _onboardData[index]['description']!,
                            style: const TextStyle(fontSize: 16),
                            textAlign: TextAlign.center,
                          ),

                          const SizedBox(height: 20),

                          // Navigation button
                          if (index < _onboardData.length - 1)
                            ElevatedButton(
                              onPressed: _nextPage,
                              child: const Text(
                                'Next',
                                style: TextStyle(color: Colors.white),
                              ),
                              style: ElevatedButton.styleFrom(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 90, vertical: 15),
                                textStyle: TextStyle(fontSize: 18),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15)),
                                backgroundColor:
                                    const Color.fromARGB(255, 0, 0, 255),
                              ),
                            )
                          else
                            ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => SignInPage(),
                                  ),
                                );
                              },
                              child: const Text(
                                'Get Started',
                                style: TextStyle(color: Colors.white),
                              ),
                              style: ElevatedButton.styleFrom(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 90, vertical: 15),
                                textStyle: TextStyle(fontSize: 18),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15)),
                                backgroundColor:
                                    const Color.fromARGB(255, 0, 0, 255),
                              ),
                            ),
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
          ),

          // Page indicator
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              _onboardData.length,
              (index) => AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                margin: const EdgeInsets.symmetric(horizontal: 4),
                width: _currentPage == index ? 12 : 8,
                height: 8,
                decoration: BoxDecoration(
                  color: _currentPage == index ? Colors.blue : Colors.grey[400],
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
