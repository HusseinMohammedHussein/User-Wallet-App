import 'package:digital_secure_assignment/core/database/api/end_points.dart';
import 'package:digital_secure_assignment/core/utils/app_assets.dart';
import 'package:digital_secure_assignment/features/home/presentation/cubit/home_cubit.dart';
import 'package:digital_secure_assignment/features/home/presentation/cubit/home_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../../../core/functions/date_service.dart';
import '../../../../../core/utils/app_text_styles.dart';

class HeaderSection extends StatelessWidget {
  const HeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    String welcomeMessage = getWelcomeMessageBasedOnTime();
    return BlocConsumer<HomeCubit, HomeState>(builder: (context, state) {
      var userModel = context.read<HomeCubit>().userModel;
      return Column(
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Image.asset(Assets.imagesIcNotification,
                    width: 30, height: 30),
                15.width,
                Image.asset(Assets.imagesIcMenu, width: 30, height: 30),
              ],
            ),
          ),
          Row(
            children: [
              Image.asset(Assets.imagesPersonProfileImg,
                  width: 100, height: 100),
              20.width,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("$welcomeMessage,", style: CustomTextStyles.style25),
                  Text("${userModel.username}", style: CustomTextStyles.style25Bold),
                ],
              )
            ],
          )
        ],
      );
    }, listener: (context, state) {});
  }
}
