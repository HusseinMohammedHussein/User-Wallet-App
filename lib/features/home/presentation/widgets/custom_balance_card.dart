import 'dart:core';

import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/app_text_styles.dart';

class CustomBalanceCard extends StatefulWidget {
  final String? cardTitle;
  final String? balance;
  final String? balanceState;
  final String? date;
  final Color headColor;
  final String? assetsImage;
  final double? icHeight;
  final double? icWidth;

  const CustomBalanceCard(
      {super.key,
      required this.cardTitle,
      required this.balance,
      required this.balanceState,
      required this.date,
      required this.headColor,
      required this.assetsImage,
      required this.icHeight,
      required this.icWidth});

  @override
  State<CustomBalanceCard> createState() => _CustomBalanceCardState();
}

class _CustomBalanceCardState extends State<CustomBalanceCard> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SizedBox(
      width: size.width * 0.4, //180
      height: size.height * 0.24, //230
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColors.white,
        ),
        margin: const EdgeInsets.only(top: 20),
        child: Column(
          children: [
            Container(
              width: 200,
              alignment: Alignment.center,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: widget.headColor,
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10))),
              child: Text(widget.cardTitle!,
                  style:
                      CustomTextStyles.style21.copyWith(color: Colors.white)),
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const RotatedBox(
                    quarterTurns: 3,
                    child: Text(AppStrings.egp),
                  ),
                  Column(
                    children: [
                      Image.asset(widget.assetsImage!,
                          width: widget.icWidth, height: widget.icHeight),
                      5.height,
                      Text(widget.balance!, style: CustomTextStyles.style50Bold),
                      Text("${widget.balanceState}${widget.date}")
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
