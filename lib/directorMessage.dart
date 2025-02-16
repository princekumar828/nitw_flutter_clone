import 'package:flutter/material.dart';

class Directormessage extends StatelessWidget {
  const Directormessage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue.shade50,
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            "Director's Message",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8),
          Text(
            "I am glad that I have been given an opportunity to serve as the Director of the National Institute of Technology Warangal...",
          ),
          SizedBox(height: 8),
          Text(
            "Read More",
            style: TextStyle(color: Colors.blue),
          ),
        ],
      ),
    );
  }
}
