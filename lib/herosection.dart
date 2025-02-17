import 'dart:async';
import 'package:flutter/material.dart';

class CarouselSection extends StatefulWidget {
  @override
  _CarouselSectionState createState() => _CarouselSectionState();
}

class _CarouselSectionState extends State<CarouselSection> {
  final List<String> _carouselImages = [
    'assets/image/s1.jpg',
    'assets/image/s2.jpg',
    'assets/image/s3.jpg',
  ];
  int _currentPage = 0;

  final PageController _pageController = PageController();
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startAutoScroll();
  }

  // Function to start the timer for auto-scroll
  void _startAutoScroll() {
    _timer = Timer.periodic(const Duration(seconds: 2), (Timer timer) {
      if (_currentPage < _carouselImages.length - 1) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }
      _pageController.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    });
  }

  // Function to stop the timer
  void _stopAutoScroll() {
    _timer?.cancel();
  }

  @override
  void dispose() {
    _timer?.cancel(); // Cancel the timer to prevent memory leaks
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // GestureDetector to pause auto-scroll on user interaction
        GestureDetector(
          onTapDown: (details) {
            _stopAutoScroll(); // Stop scrolling when tapped
          },
          onTapUp: (details) {
            _startAutoScroll(); // Resume scrolling after releasing
          },
          onTapCancel: () {
            _startAutoScroll(); // Resume scrolling if tap is canceled
          },
          onPanDown: (details) {
            _stopAutoScroll(); // Stop scrolling when swiping
          },
          onPanCancel: () {
            _startAutoScroll(); // Resume scrolling after swipe is canceled
          },
          child: MouseRegion(
            onEnter: (event) {
              _stopAutoScroll(); // Stop scrolling when the cursor enters
            },
            onExit: (event) {
              _startAutoScroll(); // Resume scrolling when the cursor exits
            },
            child: SizedBox(
              height: 200, // Height of the slider
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() {
                    _currentPage = index;
                  });
                },
                itemCount: _carouselImages.length,
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(_carouselImages[index]),
                        fit: BoxFit.fill, // Fit images neatly
                      ),
                      borderRadius: BorderRadius.circular(8), // Rounded corners
                    ),
                  );
                },
              ),
            ),
          ),
        ),

        // Dots Indicator
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(_carouselImages.length, (index) {
            return AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              margin: const EdgeInsets.symmetric(horizontal: 4.0),
              height: _currentPage == index ? 10.0 : 8.0,
              width: _currentPage == index ? 10.0 : 8.0, // Active dot is larger
              decoration: BoxDecoration(
                color: _currentPage == index ? Colors.blue : Colors.grey,
                shape: BoxShape.circle,
              ),
            );
          }),
        ),
      ],
    );
  }
}
