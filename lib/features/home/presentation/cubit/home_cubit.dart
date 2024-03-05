import 'dart:developer';

import 'package:digital_secure_assignment/core/database/api/end_points.dart';
import 'package:digital_secure_assignment/core/models/create_user_model/create_user_model.dart';
import 'package:digital_secure_assignment/core/models/user_model.dart';
import 'package:digital_secure_assignment/core/services/service_locator.dart';
import 'package:digital_secure_assignment/core/utils/app_strings.dart';
import 'package:digital_secure_assignment/features/home/presentation/cubit/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';

import '../../../../core/database/cache/cache_helper.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(InitHomeState());

  Map<String, dynamic> getResult = {};
  late UserModel userModel;

  Future<void> fetchUserById() async {
    emit(HomeLoadingState());
    var getObjId = getIt<CacheHelper>().getData(key: AppKeys.objectIdKey);

    ParseUser user = await ParseUser.currentUser();
    var response = user.getObject(getObjId);
    response.then((value) => {
          if (value.success)
            {
              emit(HomeSuccessState()),
              getResult[ApiKey.username] = value.result[ApiKey.username],
              getResult[ApiKey.walletBalance] =
                  value.result[ApiKey.walletBalance],
              getResult[ApiKey.walletUpdateDate] =
                  value.result[ApiKey.walletUpdateDate],
              getResult[ApiKey.transactionAmount] =
                  value.result[ApiKey.transactionAmount],
              getResult[ApiKey.transactionDate] =
                  value.result[ApiKey.transactionDate],
              userModel = UserModel.fromJson(getResult),
              log("get_result::: ${getResult.toString()}"),
            }
          else
            {emit(HomeFailureState(errMessage: value.error!.message))}
        });
  }

  Future<void> fetchUsers() async {
    emit(HomeLoadingState());
    var response = await ParseUser.all(debug: true);
    if (response.success) {
      emit(HomeSuccessState());
      log("get_users_list: ${response.results?.toList()}");
    }
  }

  Future<void> logout() async {
    emit(HomeLoadingState());
    var parseUser = ParseUser.createUser();
    var response = parseUser.logout();
    response.then((value) => {
      if(value.success)
        emit(HomeSuccessState()),
      log("get_users_list: ${value.results?.toList()}"),
      getIt<CacheHelper>().clearData()
    });
  }

  Future<void> createNewUser() async {
    emit(HomeLoadingState());
    ParseCoreData().registerSubClass("TestUsers", () => DietPlan());
    ParseCoreData().registerUserSubClass((username, password, emailAddress,
            {client, debug, sessionToken}) =>
        CreateUser(username, password, emailAddress));
    DietPlan dietPlan = DietPlan();
    dietPlan.name = "Text Create SubClass";
    var res = dietPlan.getAll();
    log("get-All: ${res.then((value) => log("$value"))}");
    emit(HomeSuccessState());
  }
}
