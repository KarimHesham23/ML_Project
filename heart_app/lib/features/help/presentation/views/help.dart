import 'package:flutter/material.dart';
import 'package:heart_app/features/help/presentation/views/widgets/help_body.dart';

class HelpView extends StatelessWidget {
  const HelpView({super.key});
  static String id = "help View";

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: HelpBody(),
    );
  }
}
