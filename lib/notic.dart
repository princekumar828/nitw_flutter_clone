import 'package:flutter/material.dart';

import 'noticcard.dart';
class Notic extends StatelessWidget {
  const Notic({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        color: Colors.blue.shade50,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Notice",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  NoticeCard(title: "Upcoming Exam", date: "2025-02-12"),
                  NoticeCard(title: "Tender Supply", date: "2025-02-14"),
                  NoticeCard(title: "Book Fair 2025", date: "2025-01-30"),
                ],
              ),
            ),
          ],
        ),
      ),
    );

  }
}
