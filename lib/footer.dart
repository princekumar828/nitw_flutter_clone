import 'package:flutter/material.dart';
class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      color: Colors.grey.shade200,
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "NIT Warangal ©2025",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text("Contact Us:"),
                  Text("Email: contact@nitw.ac.in"),
                  Text("Phone: +91-123-456-7890"),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text("Rankings:"),
                  Text("Engineering: 21"),
                  Text("Overall: 53"),
                ],
              ),
            ],
          ),
        ],
      ),
    );

  }
}
