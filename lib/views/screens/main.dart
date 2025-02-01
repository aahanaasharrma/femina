import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'auth_screen.dart'; // Make sure the AuthScreen import is correct

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const ImageSlider(),
      theme: ThemeData(
        fontFamily: 'Montserrat',  // Set default font for entire app
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF641D15),
        ),
        useMaterial3: true,
      ),
    );
  }
}

class ImageSlider extends StatefulWidget {
  const ImageSlider({super.key});

  @override
  State<ImageSlider> createState() => _ImageSliderState();
}

class _ImageSliderState extends State<ImageSlider> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;
  final List<String> images = [
    'assets/image1.png',
    'assets/image2.png',
    'assets/image3.png',
  ];
  final List<String> titles = [
    "Let's Learn!",
    "Track Your Cycle",
    "Find Products",
  ];
  final List<String> subtexts = [
    "Welcome to our period education hub! Let's dive into the world of periods together. Our AI chatbot is here to answer your questions and provide helpful tips along the way.",
    "Stay in sync effortlessly with Femina, your personal cycle companion. Log your cycle and symptoms and let us do the rest!",
    "With our app, easily locate nearby stores stocked with pads, menstrual cups, and tampons. Stay prepared and confident wherever you go!",
  ];

  void _onPageChanged(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'assets/background1.png',
            fit: BoxFit.cover,
          ),
          Column(
            children: [
              // Logo at the top of the screen
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 30.0),
                child: Image.asset(
                  'assets/Logo.png',
                  width: 120, // Adjust size as needed
                  height: 120,
                  fit: BoxFit.contain,
                ),
              ),
              Expanded(
                child: PageView.builder(
                  controller: _pageController,
                  onPageChanged: _onPageChanged,
                  itemCount: images.length,
                  itemBuilder: (context, index) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.start, // Align content to the top
                      children: [
                        // Centered Image
                        Center(
                          child: Image.asset(
                            images[index],
                            width: 361,
                            height: 308,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,  // Ensures the text is centered
                            children: [
                              Text(
                                titles[index],
                                style: const TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF641D15),
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                subtexts[index],
                                textAlign: TextAlign.center,  // Center the text for better alignment
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                        if (index < images.length - 1) const SizedBox(height: 60), // Add spacing for first two slides
                      ],
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: SmoothPageIndicator(
                  controller: _pageController,
                  count: images.length,
                  effect: const WormEffect(
                    dotWidth: 10.0,
                    dotHeight: 10.0,
                    spacing: 16.0,
                    radius: 10.0,
                    dotColor: Colors.grey,
                    activeDotColor: Color(0xFF641D15),
                  ),
                ),
              ),
              // Show the logo and button on the last slide
              if (_currentIndex == images.length - 1)
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(const Color(0xFFF6CDCD)),
                          foregroundColor: MaterialStateProperty.all(Colors.black),
                          padding: MaterialStateProperty.all(
                            const EdgeInsets.symmetric(vertical: 15.0, horizontal: 40.0),
                          ),
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                        ),
                        onPressed: () {
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (context) => const AuthScreen(), // Navigate to AuthScreen
                            ),
                          );
                        },
                        child: const Text(
                          "Get Started",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
            ],
          ),
        ],
      ),
    );
  }
}
