import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController textEditingController;
  final String hintText;

  const CustomTextFormField({
    super.key,
    required this.textEditingController,
    required this.hintText
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textAlign: TextAlign.center,
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
