import 'package:flutter/material.dart';

class CarouselSection extends StatefulWidget {
  @override
  _CarouselSectionState createState() => _CarouselSectionState();
}

class _CarouselSectionState extends State<CarouselSection> {
  // Variables to hold images and active page state
  final List<String> _carouselImages = [
    'assets/image/s1.jpg',
    'assets/image/s2.jpg',
    'assets/image/s3.jpg',
  ];
  int _currentPage = 0;

  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Carousel (Slider)
        SizedBox(
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
