import 'package:flutter/material.dart';

import 'gridCard.dart';
class Gridsection extends StatelessWidget {
  const Gridsection({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        GridCard(
          title: "Workshops & Conferences",
          description:
          "A 10 Days Online FDP on From Research to Reality: Translating AI and ML Innovations..... ",
        ),
        GridCard(
          title: "NIRF Rankings",
          description: "Engineering: 21 | Overall: 53",
        ),
        GridCard(
          title: "Awards",
          description:
          "Best Young Scientist Award at the International Bioprocess Conference.",
        ),
        GridCard(
          title: "Our Placements",
          description: "2023 CTC: ₹88 LPA | 2024 Expected: ₹140 LPA",
        ),
      ],
    );

  }
}
