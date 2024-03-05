import 'package:digital_secure_assignment/core/utils/app_assets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/app_text_styles.dart';

class CustomUserCard extends StatelessWidget {
  const CustomUserCard({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Container(
          margin: EdgeInsets.only(top: 30),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                    color: AppColors.darkYellow,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10))),
                // width: size.width / 3.5,
                // height: size.height * 0.13,
                padding: EdgeInsets.symmetric(horizontal: 33, vertical: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    20.height,
                    Text("Username",
                        style: CustomTextStyles.style21
                            .copyWith(color: AppColors.white)),
                    5.height,
                    Text(AppStrings.totalSpending,
                        style: CustomTextStyles.style15Bold
                            .copyWith(fontWeight: FontWeight.normal)
                            .copyWith(color: Colors.white)),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                // width: size.width / 3.6,
                // height: size.height *  0.13,
                decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RotatedBox(quarterTurns: 3, child: Text("EGP")),
                    Column(
                      children: [
                        Text("1000", style: CustomTextStyles.style43Bold),
                        Text("Last Spend 12/1"),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: size.height * 0.01),
          alignment: Alignment.topCenter,
          child: Image.asset(Assets.imagesPersonProfileImg,
              height: 50, width: 50, alignment: Alignment.topCenter),
        )
      ],
    );
  }
}
