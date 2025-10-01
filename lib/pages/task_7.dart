import 'package:flutter/material.dart';

class Task7Page extends StatelessWidget {
  Task7Page({super.key});

  
  final ValueNotifier<bool> _isLoading = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Task 7 - Loading Button"),
        centerTitle: true,
      ),
      body: Center(
        child: ValueListenableBuilder<bool>(
          valueListenable: _isLoading,
          builder: (context, loading, _) {
            return ElevatedButton(
              onPressed: loading
                  ? null // disable button when loading
                  : () async {
                      _isLoading.value = true; 
                      await Future.delayed(const Duration(seconds: 2));
                      _isLoading.value = false; 
                    },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                    horizontal: 24, vertical: 14),
              ),
              child: loading
                  ? const SizedBox(
                      height: 20,
                      width: 20,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        color: Colors.white,
                      ),
                    )
                  : const Text("Submit"),
            );
          },
        ),
      ),
    );
  }
}
