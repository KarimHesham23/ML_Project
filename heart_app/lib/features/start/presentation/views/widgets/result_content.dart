import 'package:flutter/material.dart';

class ResultContent extends StatelessWidget {
  const ResultContent({
    super.key,
    required this.res,
  });
  final int res;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              res == 1 ? "Heart Patient" : "No Heart Disease",
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24.0,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              res == 1
                  ? "Your well-being is our priority. CardiAI suggests there may be indicators of a heart condition. Following up with a medical professional for a detailed assessment is important. Taking action now can make all the difference."
                  : "Great news! Based on the information provided, it seems like you're not at immediate risk of heart disease. However, it's still essential to maintain a healthy lifestyle, including regular exercise, balanced nutrition, and routine check-ups, to keep your heart in top shape. Keep up the good work, and remember that prevention is key to a long and healthy life!",
              style: const TextStyle(fontSize: 16.0),
              textAlign: TextAlign.start,
            ),
          ],
        ),
      ),
    );
  }
}
