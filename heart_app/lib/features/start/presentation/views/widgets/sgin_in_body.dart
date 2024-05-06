import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:heart_app/constants.dart';
import 'package:heart_app/core/utils/styles.dart';
import 'package:heart_app/features/help/presentation/views/help.dart';
import 'package:heart_app/features/start/presentation/views/widgets/sign_in_form.dart';

class SginInBody extends StatelessWidget {
  const SginInBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                onPressed: () {
                  context.pushNamed(HelpView.id);
                },
                icon: const Icon(
                  FontAwesomeIcons.circleInfo,
                  color: kSpecialColor,
                ),
              ),
            ],
          ),
          Text(
            "Fill Form",
            style: Styles.logoTextSyle.copyWith(
              fontSize: 50,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Expanded(
            child: SginInForm(),
          ),
        ],
      ),
    );
  }
}
