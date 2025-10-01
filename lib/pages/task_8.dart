import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class Task8Page extends StatelessWidget {
  Task8Page({super.key});

  final ValueNotifier<Color> colorNotifier = ValueNotifier<Color>(Colors.red);
  final ValueNotifier<Size> sizeNotifier = ValueNotifier<Size>(const Size(100, 120));

  final Map<String, Color> colorOptions = {
    "Red": Colors.red,
    "Green": Colors.green,
    "Blue": Colors.blue,
  };

  final Map<String, Size> sizeOptions = {
    "4x5": const Size(100, 120),
    "4x6": const Size(100, 150),
    "5x7": const Size(120, 170),
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Task 8")),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // 🔹 Dropdowns section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Column(
                children: [
                  // Color Dropdown
                  ValueListenableBuilder<Color>(
                    valueListenable: colorNotifier,
                    builder: (context, selectedColor, _) {
                      return SizedBox(
                        width: 160, // 👈 fixed button-like width
                        child: DropdownButtonFormField<Color>(
                          value: selectedColor,
                          decoration: InputDecoration(
                            labelText: "Color",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                          ),
                          items: colorOptions.entries.map((entry) {
                            return DropdownMenuItem(
                              value: entry.value,
                              child: Text(entry.key),
                            );
                          }).toList(),
                          onChanged: (value) {
                            if (value != null) colorNotifier.value = value;
                          },
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 16),

                  // Size Dropdown
                  ValueListenableBuilder<Size>(
                    valueListenable: sizeNotifier,
                    builder: (context, selectedSize, _) {
                      return SizedBox(
                        width: 160, 
                        child: DropdownButtonFormField<Size>(
                          value: selectedSize,
                          decoration: InputDecoration(
                            labelText: "Size",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                          ),
                          items: sizeOptions.entries.map((entry) {
                            return DropdownMenuItem(
                              value: entry.value,
                              child: Text(entry.key),
                            );
                          }).toList(),
                          onChanged: (value) {
                            if (value != null) sizeNotifier.value = value;
                          },
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),

            const SizedBox(height: 40),

            // 🔹 Dynamic Container
            ValueListenableBuilder2<Color, Size>(
              first: colorNotifier,
              second: sizeNotifier,
              builder: (context, color, size, _) {
                return AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  width: size.width,
                  height: size.height,
                  color: color,
                  alignment: Alignment.center,
                  child: const Text(
                    "Preview Box",
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

// ✅ Helper for two ValueNotifiers
class ValueListenableBuilder2<A, B> extends StatelessWidget {
  final ValueListenable<A> first;
  final ValueListenable<B> second;
  final Widget Function(BuildContext, A, B, Widget?) builder;

  const ValueListenableBuilder2({
    super.key,
    required this.first,
    required this.second,
    required this.builder,
  });

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<A>(
      valueListenable: first,
      builder: (context, a, _) {
        return ValueListenableBuilder<B>(
          valueListenable: second,
          builder: (context, b, __) {
            return builder(context, a, b, null);
          },
        );
      },
    );
  }
}
