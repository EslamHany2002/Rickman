import 'package:flutter/material.dart';

class DeveloperCard extends StatelessWidget {
  // const DevelperApp({super.key});

  final String imagePath;
  final String name;

  const DeveloperCard({
    Key? key,
    required this.imagePath,
    required this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage(imagePath),
            ),
            const SizedBox(width: 15),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                // Add additional information if needed, e.g.,
                // Text(developer.role),
                // Text(developer.company),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
