import 'package:flutter/material.dart';
import 'package:heart_app/features/splash/presentation/views/widgets/splah_view_body.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});
  static String id = "Splash View";

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SplashViewBody(),
    );
  }
}
