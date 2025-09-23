import 'package:flutter/material.dart';
import 'pages/task_1.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Intern Tasks App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final tasks = List.generate(8, (index) => 'Task-${index + 1}');

    return Scaffold(
      appBar: AppBar(
        title: const Text('Tasks List'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ListView.builder(
          itemCount: tasks.length,
          itemBuilder: (context, index) {
            return Card(
              elevation: 4,
              margin: const EdgeInsets.symmetric(vertical: 8),
              child: ListTile(
                title: Text(
                  tasks[index],
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                trailing: const Icon(Icons.arrow_forward),
                onTap: () {
                    // Navigate to Task-1 page
                  if (tasks[index] == 'Task-1') {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Task1Page()),
                    );
                  }// Here we will navigate to task details page later
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
