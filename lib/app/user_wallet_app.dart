import 'package:flutter/material.dart';

import '../core/routes/app_router.dart';
import '../core/utils/app_colors.dart';

class UserWallet extends StatelessWidget {
  const UserWallet({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData(scaffoldBackgroundColor: AppColors.offWhite),
      debugShowCheckedModeBanner: false,
      routerConfig: router,
    );
  }
}
