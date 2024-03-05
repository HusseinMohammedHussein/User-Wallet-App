import 'package:digital_secure_assignment/core/database/api/parse_initialize.dart';
import 'package:digital_secure_assignment/features/home/presentation/cubit/home_cubit.dart';
import 'package:get_it/get_it.dart';

import '../../features/auth/presentation/cubit/auth_cubit.dart';
import '../database/cache/cache_helper.dart';

final getIt = GetIt.instance;
void setupServiceLocator() {
  getIt.registerSingleton<CacheHelper>(CacheHelper());
  getIt.registerSingleton<ParseInitialize>(ParseInitialize());
  getIt.registerSingleton<AuthCubit>(AuthCubit());
  getIt.registerSingleton<HomeCubit>(HomeCubit());
}
