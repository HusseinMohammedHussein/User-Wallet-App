import 'package:json_annotation/json_annotation.dart';
import '../database/api/end_points.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  @JsonKey(name: ApiKey.objectId)
  String? objectId;
  @JsonKey(name: ApiKey.username)
  String? username;
  @JsonKey(name: ApiKey.walletBalance)
  String? walletBalance;
  @JsonKey(name: ApiKey.transactionAmount)
  String? transactionAmount;
  @JsonKey(name: ApiKey.walletUpdateDate)
  String? walletUpdateDate;
  @JsonKey(name: ApiKey.transactionDate)
  String? transactionDate;
  @JsonKey(name: ApiKey.createdAt)
  String? createdAt;


  UserModel(
      {this.objectId,
      this.username,
      this.walletBalance,
      this.transactionAmount,
      this.walletUpdateDate,
      this.transactionDate,
      this.createdAt});

  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}