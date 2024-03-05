import 'dart:developer';

import 'package:digital_secure_assignment/app/user_wallet_app.dart';
import 'package:digital_secure_assignment/core/database/api/parse_initialize.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'core/database/cache/cache_helper.dart';
import 'core/services/service_locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  setupServiceLocator();
  await getIt<ParseInitialize>().init().then((value) => {
    if(value.hasParseBeenInitialized()){
      log("is_parse_init: ${value.hasParseBeenInitialized()}")
    }
  });
  await getIt<CacheHelper>().init();
  runApp(const UserWallet());
}
