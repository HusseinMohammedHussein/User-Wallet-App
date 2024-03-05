import 'dart:developer';

import 'package:digital_secure_assignment/core/services/service_locator.dart';
import 'package:digital_secure_assignment/core/utils/app_strings.dart';
import 'package:digital_secure_assignment/features/auth/presentation/cubit/auth_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';

import '../../../../core/database/cache/cache_helper.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(InitAuthState());

  var formKey = GlobalKey<FormState>();

  String? username,
      password,
      email,
      walletBalance,
      transactionAmount,
      walletUpdateDate,
      transactionDate;

  Future<void> createNewUser() async {
    try {
      emit(AuthLoadingState());

      var user = ParseUser.createUser(username ?? "", password, email ?? "")
        ..set("walletBalance", walletBalance)
        ..set("transactionAmount", transactionAmount)
        ..set("walletUpdateDate", walletUpdateDate)
        ..set("transactionDate", transactionDate);

      var response = await user.signUp(allowWithoutEmail: true);
      if (response.success) {
        user = response.result;
        log("user_login_success: ${user.toJson()}");
      } else if (response.statusCode == 202) {
        response = await user.login();
        if (response.success) {
          user = response.result;
          log("user_login_success: ${user.toJson()}");
        }
      }

      response = await user.save();
      if (response.success) {
        user = response.result;
        log("user_save_success: ${user.toJson()}");
      }

      getIt<CacheHelper>().saveData(
          key: AppKeys.objectIdKey, value: response.result["objectId"]);
      var getObjId = getIt<CacheHelper>().getData(key: AppKeys.objectIdKey);
      log("get_objectId: ${response.result["objectId"]}");
      log("get_objectId_from_sharedPref: $getObjId");
      log("getResponseResult:: ${user.toJson()}");

      emit(AuthSuccessState());
    } on ParseError catch (e) {
      emit(AuthFailureState(errMessage: e.message));
    }
  }
}
