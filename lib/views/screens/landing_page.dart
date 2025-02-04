import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  final List<String> images = [
    'assets/images/image1.png',
    'assets/images/image2.png',
    'assets/images/image3.png',
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

  void _nextPage() {
    if (_currentIndex < images.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      // Navigate to the home/authentication screen
      Navigator.pushReplacementNamed(context, "/auth");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'assets/images/background1.png',
            fit: BoxFit.cover,
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 30.0),
                child: Image.asset(
                  'assets/images/Logo.png',
                  width: 120,
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
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: Image.asset(
                              images[index],
                              width: 361,
                              height: 308,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(height: 24),
                          Text(
                            titles[index],
                            textAlign: TextAlign.left,
                            style: const TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF641D15),
                            ),
                          ),
                          const SizedBox(height: 12),
                          Text(
                            subtexts[index],
                            textAlign: TextAlign.left,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.normal,
                              color: Colors.black,
                              height: 1.5,
                            ),
                          ),
                          if (index < images.length - 1) const SizedBox(height: 40),
                        ],
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 24.0, right: 24.0, bottom: 50.0), // Moved slightly higher
                child: Row(
                  children: [
                    SmoothPageIndicator(
                      controller: _pageController,
                      count: images.length,
                      effect: ExpandingDotsEffect(
                        dotWidth: 12.0,
                        dotHeight: 12.0,
                        expansionFactor: 1.6,
                        spacing: 8.0,
                        radius: 10.0,
                        dotColor: Colors.grey,
                        activeDotColor: const Color(0xFFF6CDCD),
                      ),
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: _nextPage,
                      child: Container(
                        width: _currentIndex == images.length - 1 ? 150 : 60, // Wider for "Get Started"
                        height: 60,
                        decoration: BoxDecoration(
                          color: const Color(0xFFF6CDCD),
                          borderRadius: BorderRadius.circular(30), // Rounded
                        ),
                        child: Center(
                          child: _currentIndex == images.length - 1
                              ? const Text(
                            "Get Started",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          )
                              : const Icon(Icons.arrow_forward_ios, color: Colors.white, size: 28),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
