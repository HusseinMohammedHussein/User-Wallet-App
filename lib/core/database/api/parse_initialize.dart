import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';

import '../../utils/app_strings.dart';

class ParseInitialize {
  Future<Parse> init() async {
    return await Parse().initialize(
        ParseStrings.keyApplicationId, ParseStrings.keyParseServerUrl,
        debug: true, // When enabled, prints logs to console
        coreStore: await CoreStoreSharedPreferences.getInstance());
  }
}
