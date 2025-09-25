import 'package:flutter/material.dart';

class Task3Page extends StatefulWidget {
  const Task3Page({super.key});

  @override
  State<Task3Page> createState() => _Task3PageState();
}

class _Task3PageState extends State<Task3Page> with TickerProviderStateMixin {
  bool _expanded = false;

  final String _longText = '''
Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur ut lacus in justo tristique hendrerit. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Integer suscipit, lorem vitae luctus ornare, lectus augue faucibus sem, non hendrerit arcu nibh et nibh. Aenean id risus eget lorem faucibus pretium. Sed vulputate, libero in hendrerit volutpat, mi sapien cursus velit, vitae gravida nisl augue id massa. Praesent vulputate, mauris non cursus tristique, sem erat iaculis velit, sed elementum felis felis eu lectus. Vivamus viverra, nibh vitae suscipit tincidunt, mi ex hendrerit lectus, eu laoreet urna dolor vitae turpis. Donec ac volutpat mi. Cras volutpat justo vel lectus hendrerit, et dictum ipsum faucibus. Nullam id magna a quam iaculis pharetra. Integer a volutpat mi. Suspendisse potenti. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas.
''';

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context);
    final screenWidth = mq.size.width;

    final cardMaxWidth = screenWidth < 600 ? screenWidth * 0.92 : 700.0;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Task 3"),
        centerTitle: true,
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Center(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                maxWidth: cardMaxWidth,
              ),
              child: Card(
                elevation: 6,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                margin: const EdgeInsets.symmetric(vertical: 24, horizontal: 12),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 8),
                        child: Text(
                          'Welcome to my app',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),

                      const SizedBox(height: 8),

                      // Expandable Text
                      AnimatedSize(
                        duration: const Duration(milliseconds: 600),
                        curve: Curves.easeInOut,
                        alignment: Alignment.topCenter,
                        child: Text(
                          _longText,
                          style: const TextStyle(fontSize: 16, height: 1.4),
                          textAlign: TextAlign.left,
                          maxLines: _expanded ? null : 3,        //  show 3 lines when collapsed
                          overflow: _expanded
                              ? TextOverflow.visible
                              : TextOverflow.ellipsis,           // add ellipsis
                        ),
                      ),

                      const SizedBox(height: 12),
                      Row(
                        children: [
                          const Spacer(),
                          TextButton(
                            onPressed: () {
                              setState(() {
                                _expanded = !_expanded;
                              });
                            },
                            child: Text(
                              _expanded ? 'Read Less' : 'Read More',
                              style: const TextStyle(fontSize: 14),
                            ),
                          ),
                        ],
                      ),
                    ],
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
