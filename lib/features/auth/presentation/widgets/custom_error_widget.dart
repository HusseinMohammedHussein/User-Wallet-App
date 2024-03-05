import 'package:digital_secure_assignment/core/utils/app_assets.dart';
import 'package:flutter/cupertino.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_strings.dart';

class CustomErrorWidget extends StatelessWidget {
  const CustomErrorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.7,
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
          color: AppColors.red,
          borderRadius: const BorderRadius.all(Radius.circular(10))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(Assets.imagesIcCancel, height: 30, width: 30),
          10.width,
          Column(
            children: [
              Text(
                AppStrings.credentialsAreIncorrect,
                style: TextStyle(color: AppColors.white, fontSize: 18),
              ),
            ],
          )
        ],
      ),
    );
  }
}
