import 'package:flutter/material.dart';

class Task1Page extends StatefulWidget {
  const Task1Page({super.key});

  @override
  State<Task1Page> createState() => _Task1PageState();
}

class _Task1PageState extends State<Task1Page> {
  // ========= List of tasks =========
  final List<TaskItem> tasks = List.generate(
    10,
    (index) => TaskItem(
      title: 'Task ${index + 1}',
      subtitle: 'Due tomorrow',
      isSelected: false,
    ),
  );

  //========= Function to handle selection toggle =========
  void _toggleSelection(int index) {
    setState(() {
      tasks[index].isSelected = !tasks[index].isSelected;
    });
  }

  //========= Function to handle long press delete =========
  void _deleteTask(int index) {
    setState(() {
      tasks.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Task 1'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          final task = tasks[index];

          return GestureDetector(
            onLongPress: () => _deleteTask(index), // long press to delete
            child: Center(
              child: SizedBox(
                width: 700, // card takes full width
                height: 100, // change this to your desired height
                child: Card(
                  color: task.isSelected ? Colors.blue.shade100 : Colors.white,
                  margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                 child: ListTile(
                    leading: Checkbox(
                      value: task.isSelected,
                      onChanged: (value) => _toggleSelection(index),
                    ),
                    title: Column(
                      mainAxisAlignment: MainAxisAlignment.center, // vertical center
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(task.title),
                        Text(task.subtitle),
                      ],
                    ),
                    onTap: () => _toggleSelection(index),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

//========= Reusable Task item model =========

class TaskItem {
  String title;
  String subtitle;
  bool isSelected;

  TaskItem({
    required this.title,
    required this.subtitle,
    this.isSelected = false,
  });
}
