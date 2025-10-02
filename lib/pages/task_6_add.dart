import 'package:flutter/material.dart';

class Task6addPage extends StatelessWidget {
  const Task6addPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    // If width < 600 → mobile/tablet → equal flex
    final isSmallScreen = screenWidth < 600;

    return Scaffold(
      appBar: AppBar(title: const Text("Task 6 screen-size"), centerTitle: true),
      body: Row(
        children: [
          Expanded(
            flex: isSmallScreen ? 1 : 3, //  Change flex based on screen size
            child: Container(
              color: Colors.red,
              child: const Center(
                child: Text(
                  "Left Container",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: isSmallScreen ? 1 : 2, // Equal on small screens
            child: Container(
              color: Colors.green,
              child: const Center(
                child: Text(
                  "Right Container",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
