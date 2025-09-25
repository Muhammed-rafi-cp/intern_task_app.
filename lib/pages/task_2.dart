import 'package:flutter/material.dart';

class Task2Page extends StatelessWidget {
  Task2Page({super.key});

  // A list of image sources (mix local + network)
  final List<String> images = [
    "assets/images/img1.jpg",
    "assets/images/img2.jpg",
    "assets/images/img3.jpg",
    // Direct image links (replace with real .jpg/.png URLs)
    "https://cdn.pixabay.com/photo/2013/07/21/13/00/rose-165819_960_720.jpg",
    "https://cdn.pixabay.com/photo/2015/04/19/08/32/rose-729509_960_720.jpg",
    "https://cdn.pixabay.com/photo/2013/07/21/13/00/rose-165819_960_720.jpg",
  ];

  // ✅ Using ValueNotifier instead of setState
  final ValueNotifier<Set<int>> favoriteIndexes = ValueNotifier<Set<int>>({});
  final ValueNotifier<bool> showOnlyFavorites = ValueNotifier<bool>(false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Task 2"),
        centerTitle: true,
      ),
      // ✅ Listen to both favorites & filter toggle
      body: ValueListenableBuilder(
        valueListenable: favoriteIndexes,
        builder: (context, favs, _) {
          return ValueListenableBuilder(
            valueListenable: showOnlyFavorites,
            builder: (context, filter, _) {
              // Filter images if needed
              final displayImages = filter
                  ? images
                      .asMap()
                      .entries
                      .where((e) => favs.contains(e.key))
                      .toList()
                  : images.asMap().entries.toList();
                  
              return GridView.builder(
                padding: const EdgeInsets.all(8),
                itemCount: displayImages.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, // adjust number of images per row
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                  childAspectRatio: 1, // square shape
                ),
                itemBuilder: (context, index) {
                  final entry = displayImages[index];
                  final realIndex = entry.key; // original index
                  final path = entry.value;
                  final isFavorite = favs.contains(realIndex);

                  return Stack(
                    children: [
                      // Image widget (asset or network)
                      Positioned.fill(
                        child: path.startsWith("http")
                            ? Image.network(path, fit: BoxFit.cover)
                            : Image.asset(path, fit: BoxFit.cover),
                      ),
                      // Heart icon overlay
                     Positioned(
                        top: 15                                                                                                                                                                                                                                                                                                                                                                                             ,
                        right: 15,
                        child: GestureDetector(
                          onTap: () {
                            final updated = Set<int>.from(favs);
                            if (isFavorite) {
                              updated.remove(realIndex);
                            } else {
                              updated.add(realIndex);
                            }
                            favoriteIndexes.value = updated; // notify listeners
                          },
                          child: Icon(
                            isFavorite
                                ? Icons.favorite
                                : Icons.favorite_border,
                            color: isFavorite ? Colors.red : Colors.white,
                            size: 38,
                          ),
                        ),
                      ),
                    ],
                  );
                },
              );
            },
          );
        },
      ),

      floatingActionButton: ValueListenableBuilder(
        valueListenable: showOnlyFavorites,
        builder: (context, filter, _) {
          return FloatingActionButton(
            onPressed: () {
              showOnlyFavorites.value = !filter; // toggle filter
            },
            child: Icon(
              filter ? Icons.filter_alt_off : Icons.filter_alt,
            ),
          );
        },
      ),
    );
  }
}
