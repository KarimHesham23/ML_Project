import 'package:flutter/material.dart';
import 'package:heart_app/constants.dart';
import 'package:heart_app/core/utils/styles.dart';

class CustomBorderTextFormFiled extends StatelessWidget {
  const CustomBorderTextFormFiled({
    super.key,
    required this.onSaved,
    required this.hintText,
  });
  final void Function(String?) onSaved;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.number,
      validator: (value) {
        if (value?.isEmpty ?? true) {
          return "This Filed Required";
        } else if (!isNumeric(value!)) {
          return "Please enter a valid number";
        } else {
          return null;
        }
      },
      onSaved: onSaved,
      cursorColor: Colors.white,
      decoration: InputDecoration(
        filled: true,
        fillColor: kSecondaryColor,
        hintText: hintText,
        contentPadding: const EdgeInsets.symmetric(
          vertical: 6,
          horizontal: 16,
        ),
        hintStyle: Styles.styleText14.copyWith(color: Colors.white),
        prefixIconColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: Colors.transparent,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: kSpecialColor,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: Colors.red,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: kSpecialColor,
          ),
        ),
        errorStyle: const TextStyle(
          color: Colors.red,
        ),
      ),
    );
  }

  bool isNumeric(String str) {
    try {
      double.parse(str);
      return true;
    } catch (e) {
      return false;
    }
  }
}
