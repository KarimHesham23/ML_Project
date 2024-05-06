import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:heart_app/core/utils/styles.dart';
import 'package:heart_app/core/widgets/custom_frame_app_bar.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomFrameAppBar(
      child: Row(
        children: [
          IconButton(
            onPressed: () {
              context.pop();
            },
            icon: const Icon(
              FontAwesomeIcons.arrowLeft,
              color: Colors.white,
            ),
          ),
          const SizedBox(
            width: 15,
          ),
          Text(
            "Help",
            style: Styles.styleText18,
          ),
        ],
      ),
    );
  }
}
