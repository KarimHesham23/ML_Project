import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:heart_app/constants.dart';
import 'package:heart_app/core/helpers/api.dart';
import 'package:heart_app/core/models/patient.dart';

part 'predict_state.dart';

class PredictCubit extends Cubit<PredictState> {
  PredictCubit() : super(PredictInitial());

  Future<void> sendPrediction(Patient patient) async {
    emit(PredictLoading());
    try {
      String jsonData = jsonEncode({
        "age": [patient.age],
        "sex": [patient.sex],
        "chest pain type": [patient.chestPainType],
        "resting bp s": [patient.restingBp],
        "cholesterol": [patient.cholesterol],
        "fasting blood sugar": [patient.fastingBloodSuger],
        "resting ecg": [patient.restingEcg],
        "max heart rate": [patient.maxHeartRate],
        "exercise angina": [patient.exerciseAngina],
        "oldpeak": [patient.oldPeak],
        "ST slope": [patient.sTSlop]
      });
      Map<String, dynamic> result = await Api().post(url: kUrl, body: jsonData);
      emit(PredictSuccess(diagnos: result["prediction"][0]));
    } catch (e) {
      emit(PredictFaileur(errorMessage: e.toString()));
    }
  }
}
