class Patient {
  final int age;
  final String sex;
  final String chestPainType;
  final int restingBp;
  final int cholesterol;
  final String fastingBloodSuger;
  final String restingEcg;
  final int maxHeartRate;
  final String exerciseAngina;
  final int oldPeak;
  final String sTSlop;

  Patient(
      {required this.age,
      required this.sex,
      required this.chestPainType,
      required this.restingBp,
      required this.cholesterol,
      required this.fastingBloodSuger,
      required this.restingEcg,
      required this.maxHeartRate,
      required this.exerciseAngina,
      required this.oldPeak,
      required this.sTSlop});
}
