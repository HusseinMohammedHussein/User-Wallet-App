import 'package:digital_secure_assignment/core/database/api/end_points.dart';
import 'package:digital_secure_assignment/core/models/user_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_result_model.g.dart';

@JsonSerializable()
class UserResultModel {
  @JsonKey(name: ApiKey.results)
  List<UserModel>? results;

  UserResultModel({this.results});

  factory UserResultModel.fromJson(Map<String, dynamic> json) => _$UserResultModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserResultModelToJson(this);
}