import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:heart_app/constants.dart';
import 'package:heart_app/core/helpers/functions.dart';
import 'package:heart_app/core/helpers/show_message.dart';
import 'package:heart_app/core/models/patient.dart';
import 'package:heart_app/core/utils/styles.dart';
import 'package:heart_app/core/widgets/create_animate_dialog.dart';
import 'package:heart_app/features/start/presentation/cubits/predict_cubit/predict_cubit.dart';
import 'package:heart_app/features/start/presentation/views/widgets/custom_border_text_form_filed.dart';
import 'package:heart_app/features/start/presentation/views/widgets/drop_down.dart';
import 'package:heart_app/features/start/presentation/views/widgets/reset_button.dart';
import 'package:heart_app/features/start/presentation/views/widgets/result_content.dart';
import 'package:heart_app/features/start/presentation/views/widgets/sgin_in_button.dart';

class SginInForm extends StatefulWidget {
  const SginInForm({super.key});

  @override
  State<SginInForm> createState() => _SginInFormState();
}

class _SginInFormState extends State<SginInForm> {
  String? age;
  String? sex;
  String? chestPainType;
  String? restingBp;
  String? cholesterol;
  String? fastingBloodSuger;
  String? restingEcg;
  String? maxHeartRate;
  String? exerciseAngina;
  String? oldPeak;
  String? sTSlop;
  GlobalKey<FormState> fromKey = GlobalKey();

  AutovalidateMode autoValidate = AutovalidateMode.disabled;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PredictCubit, PredictState>(
      listener: (context, state) async {
        if (state is PredictFaileur) {
          context.pop();
          showMessage(context, message: state.errorMessage);
        }
        if (state is PredictSuccess) {
          await AppFuctions.createGeneralDialog(
            context,
            barrierLabel: "heart",
            dialogWidget: CreateAnimatedDialog(
              backgroundColor: state.diagnos == 1
                  ? const Color(0xffB50000)
                  : const Color(0xff00A4BD),
              dialogBody: ResultContent(
                res: state.diagnos,
              ),
            ),
          );
        }
      },
      builder: (context, state) {
        return state is PredictLoading
            ? const Center(
                child: CircularProgressIndicator(
                  color: kSpecialColor,
                ),
              )
            : Form(
                key: fromKey,
                autovalidateMode: autoValidate,
                child: CustomScrollView(
                  cacheExtent: 2000,
                  physics: const BouncingScrollPhysics(),
                  slivers: [
                    SliverList(
                      delegate: SliverChildListDelegate(
                        [
                          Text(
                            "Age",
                            style: Styles.styleText16,
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          CustomBorderTextFormFiled(
                            hintText: "Enter Your Age",
                            onSaved: (p0) {
                              age = p0;
                            },
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          Text(
                            "Sex",
                            style: Styles.styleText16,
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          DropdownWidget(
                            hintText: "Select Your Gender",
                            onChanged: (p0) {},
                            onSaved: (p0) {
                              sex = p0;
                            },
                            items: const ["male", "female"],
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          Text(
                            "Chest pain Type",
                            style: Styles.styleText16,
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          DropdownWidget(
                            hintText: "Select Your pain",
                            onChanged: (p0) {},
                            onSaved: (p0) {
                              chestPainType = p0;
                            },
                            items: const [
                              "typical angina",
                              "atypical angina",
                              "non-anginal pain",
                              "asymptomatic"
                            ],
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          Text(
                            "Resting blood pressure",
                            style: Styles.styleText16,
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          CustomBorderTextFormFiled(
                            hintText: "Enter resting bp s",
                            onSaved: (p0) {
                              restingBp = p0;
                            },
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          Text(
                            "Serum Cholesterol",
                            style: Styles.styleText16,
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          CustomBorderTextFormFiled(
                            hintText: "Enter cholesterol value",
                            onSaved: (p0) {
                              cholesterol = p0;
                            },
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          Text(
                            "Fasting Blood Sugar",
                            style: Styles.styleText16,
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          DropdownWidget(
                            hintText: "fasting blood sugar",
                            onChanged: (p0) {},
                            onSaved: (p0) {
                              fastingBloodSuger = p0;
                            },
                            items: const ["yes", "No"],
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          Text(
                            "Resting Electrocardiogram Results",
                            style: Styles.styleText16,
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          DropdownWidget(
                            hintText: "Enter resting ecg",
                            onChanged: (p0) {},
                            onSaved: (p0) {
                              restingEcg = p0;
                            },
                            items: const [
                              "normal",
                              "Showing possible hypertrophy",
                              "having ST-T wave abnormality"
                            ],
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          Text(
                            "Maximum Heart Rate Achieved",
                            style: Styles.styleText16,
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          CustomBorderTextFormFiled(
                            hintText: "max heart rate",
                            onSaved: (p0) {
                              maxHeartRate = p0;
                            },
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          Text(
                            "Exercise Induced Angina",
                            style: Styles.styleText16,
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          DropdownWidget(
                            hintText: "exercise angina",
                            onChanged: (p0) {},
                            onSaved: (p0) {
                              exerciseAngina = p0;
                            },
                            items: const ["yes", "No"],
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          Text(
                            "OldPeak =ST",
                            style: Styles.styleText16,
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          CustomBorderTextFormFiled(
                            hintText: "enter oldpeak",
                            onSaved: (p0) {
                              oldPeak = p0;
                            },
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          Text(
                            "The slope of the peak exercise ST segment",
                            style: Styles.styleText16,
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          DropdownWidget(
                            hintText: "ST slope",
                            onChanged: (p0) {},
                            onSaved: (p0) {
                              sTSlop = p0;
                            },
                            items: const ["flat", "upsloping", "downsloping"],
                          ),
                          const SizedBox(
                            height: 32,
                          ),
                          RestButton(
                            onPressed: () {
                              setState(() {
                                fromKey.currentState?.reset();
                              });
                            },
                          ),
                          SginInButton(
                            onPressed: () async {
                              validataMethod(context);
                            },
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              );
      },
    );
  }

  void validataMethod(BuildContext context) async {
    if (fromKey.currentState!.validate()) {
      fromKey.currentState!.save();
      Patient obj = Patient(
          age: int.parse(age!),
          sex: sex!,
          chestPainType: chestPainType!,
          restingBp: int.parse(restingBp!),
          cholesterol: int.parse(cholesterol!),
          fastingBloodSuger: fastingBloodSuger!,
          restingEcg: restingEcg!,
          maxHeartRate: int.parse(maxHeartRate!),
          exerciseAngina: exerciseAngina!,
          oldPeak: int.parse(oldPeak!),
          sTSlop: sTSlop!);
      BlocProvider.of<PredictCubit>(context).sendPrediction(obj);
    } else {
      setState(
        () {
          autoValidate = AutovalidateMode.always;
        },
      );
    }
  }
}
