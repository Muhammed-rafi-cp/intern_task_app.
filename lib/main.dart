import 'package:flutter/material.dart';
import 'pages/task_1.dart';
import 'pages/task_2.dart'; 
import 'pages/task_3.dart';
import 'pages/task_4.dart';
import 'pages/task_5.dart';
import 'pages/task_6.dart';
import 'pages/task_7.dart';
import 'pages/task_8.dart';
import 'pages/task_5_add.dart';


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
    final tasks = List.generate(10, (index) => 'Task-${index + 1}');

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
                      MaterialPageRoute(builder: (context) =>  Task3Page()),
                    );
                  }else if (index == 3) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) =>  Task4Page()),
                    );
                  }else if (index == 4) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => Task5Page()),
                    );
                  }else if (index == 5) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) =>  Task6Page()),
                    );
                  }else if (index == 6) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => Task7Page()),
                    );
                  }else if (index == 7) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => Task8Page()),
                    );
                  }else if (index == 8) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => Task5addPage()),
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
