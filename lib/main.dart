import 'package:flutter/material.dart';
import 'pages/task_1.dart';
import 'pages/task_2.dart'; 
import 'pages/task_3.dart';
import 'pages/task_4.dart';
import 'pages/task_5.dart';
import 'pages/task_6.dart';


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
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
                trailing: const Icon(Icons.arrow_forward),
                onTap: () {
                  if (index == 0) {
                    // Task 1
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const Task1Page()),
                    );
                  } else if (index == 1) {
                    // Task 2
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) =>  Task2Page()),
                    );
                  } else if (index == 2) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Task3Page()),
                    );
                  }else if (index == 3) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const Task4Page()),
                    );
                  }else if (index == 4) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const Task5Page()),
                    );
                  }else if (index == 5) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const Task6Page()),
                    );
                  }
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
