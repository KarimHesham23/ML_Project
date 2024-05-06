import 'package:flutter/material.dart';

class HelpDialogContent extends StatelessWidget {
  const HelpDialogContent({
    super.key,
    required this.content,
    required this.label,
  });
  final String content;
  final String label;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              label,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              content,
              style: const TextStyle(fontSize: 16.0),
              textAlign: TextAlign.start,
            ),
          ],
        ),
      ),
    );
  }
}
