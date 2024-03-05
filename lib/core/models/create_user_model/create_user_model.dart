import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';

class DietPlan extends ParseObject implements ParseCloneable {
  DietPlan() : super(_keyTableName);

  DietPlan.clone() : this();

  @override
  dynamic clone(Map<String, dynamic> map) {
    DietPlan.clone().fetch();
  }

  /// Mimic a clone due to Flutter not using reflection
  // @override clone(Map map) => DietPlan.clone()..fromJson(map);

  static const String _keyTableName = 'TestTable';
  static const String keyName = 'Name';

  String get name => get(keyName);

  set name(String name) => set<String>(keyName, name);
}

class CreateUser extends ParseUser {
  CreateUser(super.username, super.password, super.emailAddress);
}
