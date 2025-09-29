import 'package:flutter/material.dart';


class Task5Page extends StatelessWidget {
  const Task5Page({super.key});

  // A helper function to generate a consistent color for a username
  Color _getColorFromName(String name) {
    final colors = [
      Colors.blue,
      Colors.green,
      Colors.red,
      Colors.orange,
      Colors.purple,
      Colors.teal,
      Colors.brown,
      Colors.pink,
    ];

    // Create a hash from the name to always pick the same color
    int hash = name.codeUnits.fold(0, (prev, elem) => prev + elem);
    return colors[hash % colors.length];
  }

  // A reusable widget for avatar
  Widget buildAvatar(String username, {String? imageUrl, double size = 60}) {
    if (imageUrl != null && imageUrl.isNotEmpty) {
      // ✅ Show profile image
      return CircleAvatar(
        radius: size / 2,
        backgroundImage: NetworkImage(imageUrl),
      );
    } else {
      // ✅ Fallback with first letter + color
      return CircleAvatar(
        radius: size / 2,
        backgroundColor: _getColorFromName(username),
        child: Text(
          username[0].toUpperCase(),
          style: const TextStyle(
            fontSize: 24,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Task 5"), centerTitle: true),
      body: Center(
        child: Wrap(
          spacing: 20,
          runSpacing: 20,
          alignment: WrapAlignment.center,
          children: [
            // Example with image
            buildAvatar("Rafi",
                imageUrl:
                    "https://cdn.pixabay.com/photo/2013/07/21/13/00/rose-165819_960_720.jpg"),
            // Example without image
            buildAvatar("Fouzan"),
            buildAvatar("Aisha"),
            buildAvatar("John"),
          ],
        ),
      ),
    );
  }
}
