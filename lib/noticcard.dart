import 'package:flutter/material.dart';
class NoticeCard extends StatelessWidget {
  final String title;
  final String date;

  const NoticeCard({Key? key, required this.title, required this.date})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.all(8),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 6),
            Text(date),
          ],
        ),
      ),
    );
  }
}
