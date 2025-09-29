import 'package:flutter/material.dart';

class Task6Page extends StatelessWidget {
  const Task6Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Task 6"), centerTitle: true),
      body: Row(
        children: [
          // Left container → flex = 3
          Expanded(
            flex: 3,
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

          // Right container → flex = 2
          Expanded(
            flex: 2,
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
