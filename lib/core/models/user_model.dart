import 'package:json_annotation/json_annotation.dart';
import '../database/api/end_points.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  @JsonKey(name: ApiKey.objectId)
  String? objectId;
  @JsonKey(name: ApiKey.username)
  String? username;
  @JsonKey(name: ApiKey.wallet)
  String? wallet;
  @JsonKey(name: ApiKey.lastActivity)
  String? lastActivity;
  @JsonKey(name: ApiKey.createdAt)
  String? createdAt;

  UserModel(
      {this.objectId,
        this.username,
        this.wallet,
        this.lastActivity,
        this.createdAt});

  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}