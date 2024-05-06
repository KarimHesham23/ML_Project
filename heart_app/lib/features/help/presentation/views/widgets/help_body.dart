import 'package:flutter/material.dart';
import 'package:heart_app/constants.dart';
import 'package:heart_app/core/helpers/functions.dart';
import 'package:heart_app/core/widgets/create_animate_dialog.dart';
import 'package:heart_app/core/widgets/custom_app_bar.dart';
import 'package:heart_app/features/help/presentation/views/widgets/dialog_content.dart';

class HelpBody extends StatelessWidget {
  const HelpBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: <Widget>[
        const SliverAppBar(
          automaticallyImplyLeading: false,
          backgroundColor: kPrimaryColor,
          elevation: 0,
          pinned: true,
          expandedHeight: 50.0,
          flexibleSpace: CustomAppBar(),
        ),
        SliverList(
          delegate: SliverChildListDelegate(
            [
              _buildDataRow(
                context,
                'Age',
                'Age of the patient.',
              ),
              _buildDataRow(
                context,
                'Sex',
                'Gender of the patient (Male/Female).',
              ),
              _buildDataRow(
                context,
                'Chest Pain Type',
                'Different types of chest pain:\n'
                    '- Typical Angina: Chest pain caused by reduced blood flow to the heart muscle.\n'
                    '- Atypical Angina: Chest discomfort similar to angina but with different symptoms.\n'
                    '- Non-anginal Pain: Chest discomfort not caused by reduced blood flow to the heart.\n'
                    '- Asymptomatic: Without chest pain symptoms.',
              ),
              _buildDataRow(
                context,
                'Fasting Blood Sugar',
                'The level of glucose in the bloodstream after a period of fasting.\n'
                    'True: fasting blood sugar > 120 mg/dl\n'
                    'False: fasting blood sugar < 120 mg/dl',
              ),
              _buildDataRow(
                context,
                'Resting ECG Results',
                'Results of the resting electrocardiogram (ECG):\n'
                    '- Normal: No significant abnormalities in heart function.\n'
                    '- ST-T Wave Abnormality: Deviations in the ST-T wave segment.\n'
                    '- Left Ventricular Hypertrophy: Thickening of the left ventricle wall.',
              ),
              _buildDataRow(
                context,
                'Exercise Induced Angina',
                'Indicates whether chest pain is experienced during physical exertion or exercise.',
              ),
              _buildDataRow(
                context,
                'Oldpeak',
                'Magnitude of ST depression observed on an electrocardiogram (ECG) during exercise stress testing.',
              ),
              _buildDataRow(
                context,
                'Slope of Peak Exercise ST Segment',
                'Describes the direction and pattern of change in the ST segment during peak exercise.',
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildDataRow(BuildContext context, String label, String tooltip) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 8.0,
        horizontal: 16,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Tooltip(
            message: tooltip,
            child: Text(
              label,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
              ),
            ),
          ),
          IconButton(
            icon: const Icon(
              Icons.help_outline,
              color: kSpecialColor,
            ),
            onPressed: () async {
              await AppFuctions.createGeneralDialog(
                context,
                barrierLabel: "definition",
                dialogWidget: CreateAnimatedDialog(
                  dialogBody: HelpDialogContent(
                    content: tooltip,
                    label: label,
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
