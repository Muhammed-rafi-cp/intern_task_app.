    import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class Task5addPage extends StatefulWidget {
  const Task5addPage({super.key});

  @override
  State<Task5addPage> createState() => _Task5PageState();
}

class _Task5PageState extends State<Task5addPage> {
  final ImagePicker _picker = ImagePicker();

  // store picked image for each user
  final Map<String, File?> userImages = {};

  // Helper function for consistent color
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
    int hash = name.codeUnits.fold(0, (prev, elem) => prev + elem);
    return colors[hash % colors.length];
  }

  // Build avatar widget
  Widget buildAvatar(String username, {String? defaultImageUrl, double size = 60}) {
    final pickedImage = userImages[username];

    return GestureDetector(
      onTap: () async {
        final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
        if (image != null) {
          setState(() {
            userImages[username] = File(image.path);
          });
        }
      },
      child: CircleAvatar(
        radius: size / 2,
        backgroundColor: pickedImage == null && (defaultImageUrl == null || defaultImageUrl.isEmpty)
            ? _getColorFromName(username)
            : null,
        backgroundImage: pickedImage != null
            ? FileImage(pickedImage)
            : (defaultImageUrl != null && defaultImageUrl.isNotEmpty
                ? NetworkImage(defaultImageUrl)
                : null) as ImageProvider<Object>?,
        child: (pickedImage == null && (defaultImageUrl == null || defaultImageUrl.isEmpty))
            ? Text(
                username[0].toUpperCase(),
                style: const TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              )
            : null,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Task 5 - Editable Avatar"), centerTitle: true),
      body: Center(
        child: Wrap(
          spacing: 20,
          runSpacing: 20,
          alignment: WrapAlignment.center,
          children: [
            buildAvatar("Rafi",
                defaultImageUrl:
                    "https://cdn.pixabay.com/photo/2013/07/21/13/00/rose-165819_960_720.jpg"),
            buildAvatar("Fouzan"),
            buildAvatar("Aisha"),
            buildAvatar("John"),
          ],
        ),
      ),
    );
  }
}
