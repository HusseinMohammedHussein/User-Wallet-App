import 'package:flutter/material.dart';

import 'app_colors.dart';

abstract class CustomTextStyles {
  static final style50Bold = TextStyle(
    fontSize: 50,
    fontWeight: FontWeight.bold,
    color: AppColors.black,
  );
  static final style43Bold = TextStyle(
    fontSize: 43,
    fontWeight: FontWeight.bold,
    color: AppColors.black,
  );
  static final style25Bold = TextStyle(
    fontSize: 25,
    fontWeight: FontWeight.bold,
    color: AppColors.white,
  );

  static final style25 = TextStyle(
    fontSize: 25,
    fontWeight: FontWeight.normal,
    color: AppColors.white,
  );

  static final style21 = TextStyle(
    fontSize: 21,
    fontWeight: FontWeight.bold,
    color: AppColors.black,
  );

  static const style15Bold = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );
  static const style14 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    color: Colors.black45,
  );
}
