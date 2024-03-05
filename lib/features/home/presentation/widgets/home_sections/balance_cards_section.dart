import 'package:digital_secure_assignment/core/database/api/end_points.dart';
import 'package:digital_secure_assignment/core/functions/custom_toast.dart';
import 'package:digital_secure_assignment/core/utils/app_assets.dart';
import 'package:digital_secure_assignment/core/utils/app_strings.dart';
import 'package:digital_secure_assignment/features/home/presentation/cubit/home_cubit.dart';
import 'package:digital_secure_assignment/features/home/presentation/cubit/home_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../../../core/utils/app_colors.dart';
import '../custom_balance_card.dart';

class BalanceCards extends StatefulWidget {
  const BalanceCards({super.key});

  @override
  State<BalanceCards> createState() => _BalanceCardsState();
}

class _BalanceCardsState extends State<BalanceCards> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(listener: (context, state) {
      if (state is HomeLoadingState) {
        showToast("Loading");
      } else if (state is HomeFailureState) {
        showToast(state.errMessage);
      }
    }, builder: (context, state) {
      var userModel = context
          .read<HomeCubit>()
          .userModel;
      log("check_get_result: ${userModel.toString()}");
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomBalanceCard(
              cardTitle: AppStrings.yourWallet,
              balance: userModel.walletBalance,
              balanceState: "${AppStrings.lastUpdate} ",
              date: userModel.walletUpdateDate,
              headColor: AppColors.darkGrey,
              assetsImage: Assets.imagesIcWallet,
              icHeight: 30,
              icWidth: 30),
          20.width,
          CustomBalanceCard(
              cardTitle: AppStrings.lastActivity,
              balance: userModel.transactionAmount,
              balanceState: "${AppStrings.transactionOn} ",
              date: userModel.transactionDate,
              headColor: AppColors.grey,
              assetsImage: Assets.imagesIcPayment,
              icHeight: 35,
              icWidth: 35)
        ],
      );
    });
  }
}
