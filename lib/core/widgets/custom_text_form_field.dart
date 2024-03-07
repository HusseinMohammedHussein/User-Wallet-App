import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nb_utils/nb_utils.dart';

import '../utils/app_colors.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController textEditingController;
  final String hintText;
  final bool isPassword;

  const CustomTextFormField(
      {super.key, required this.textEditingController, required this.hintText, this.isPassword = false});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: isPassword,
      textAlign: TextAlign.center,
      validator: (validate) => validate!.isEmpty ? "Field is Required!" : null,
      decoration: InputDecoration(
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(10),
          ),
          fillColor: AppColors.white,
          filled: true,
          hintText: hintText,
          hintStyle: const TextStyle(color: Colors.black26),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 10, vertical: 20)),
      controller: textEditingController,
    );
  }
}
