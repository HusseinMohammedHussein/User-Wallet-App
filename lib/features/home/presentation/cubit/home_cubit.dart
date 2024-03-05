import 'dart:developer';

import 'package:digital_secure_assignment/core/functions/custom_toast.dart';
import 'package:digital_secure_assignment/core/utils/app_strings.dart';
import 'package:digital_secure_assignment/features/auth/presentation/cubit/auth_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(InitAuthState());

  String? username, password, email;
  String? responseMessage, responseResult;

  Future<ParseResponse> createNewUser() async {
    emit(AuthLoadingState());
    await Parse().initialize(
        ParseStrings.keyApplicationId, ParseStrings.keyParseServerUrl,
        debug: true, // When enabled, prints logs to console
        coreStore: CoreStoreMemoryImp());
    var user = ParseUser.createUser(username, password, email ?? "")..set("wallet", "1000");
    var response = await user.signUp(allowWithoutEmail: true);
    if (response.success) {
      emit(AuthSuccessState());
      user = response.result;
      responseMessage = "Success ${user.parseClassName}";
      log("getResponseResult:: ${user.toJson()}");
      // showToast(user.get);
    } else {
      ParseError error = response.error!;
      emit(AuthFailureState(errMessage: error.message));
      showToast(responseResult!);
      responseMessage = error.message;
    }

    return response;
  }
}
