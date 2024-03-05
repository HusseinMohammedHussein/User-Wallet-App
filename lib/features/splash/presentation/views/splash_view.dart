import 'package:digital_secure_assignment/core/services/service_locator.dart';
import 'package:digital_secure_assignment/core/utils/app_colors.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:flutter/material.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';

import '../../../../core/database/cache/cache_helper.dart';
import '../../../../core/functions/navigation.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/app_text_styles.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {

    var isUserLogged = getIt<CacheHelper>().getData(key: AppKeys.objectIdKey);
    log("getObjId__: $isUserLogged");
    if (isUserLogged != null) {
      delayedNavigate(context, "/home");
    } else {
      delayedNavigate(context, "/login");
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            AppStrings.splashFirstWord,
            style: CustomTextStyles.style25Bold
                .copyWith(color: AppColors.primaryColor),
          ),
        ],
      ).center(),
    );
  }
}

void delayedNavigate(context, path) {
  Future.delayed(
    const Duration(seconds: 1),
    () {
      customReplacementNavigate(context, path);
    },
  );
}
