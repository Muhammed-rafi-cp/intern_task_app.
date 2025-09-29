import 'package:flutter/material.dart';

class Task4Page extends StatefulWidget {
  const Task4Page({super.key});

  @override
  State<Task4Page> createState() => _Task4PageState();
}

class _Task4PageState extends State<Task4Page> {
  // List of chip labels
  final List<String> topics = ["Flutter", "Dart", "UI", "State", "Provider"];

  // Track which chips are selected
  final Set<String> selectedTopics = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Task 4"),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Wrap(   // Wrap makes chips go to next line if screen is small
            spacing: 8.0, // horizontal gap
            runSpacing: 8.0, // vertical gap
            children: topics.map((topic) {
              final isSelected = selectedTopics.contains(topic);
              return ChoiceChip(
                label: Text(topic),
                selected: isSelected,
                selectedColor: Colors.blue.shade300,
                backgroundColor: Colors.grey.shade200,
                labelStyle: TextStyle(
                  color: isSelected ? Colors.white : Colors.black,
                ),
                onSelected: (selected) {
                  setState(() {
                    if (selected) {
                      selectedTopics.add(topic);
                    } else {
                      selectedTopics.remove(topic);
                    }
                  });
                },
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
