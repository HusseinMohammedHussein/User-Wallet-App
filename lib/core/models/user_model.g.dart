// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      objectId: json['objectId'] as String?,
      username: json['username'] as String?,
      walletBalance: json['walletBalance'] as String?,
      transactionAmount: json['transactionAmount'] as String?,
      walletUpdateDate: json['walletUpdateDate'] as String?,
      transactionDate: json['transactionDate'] as String?,
      createdAt: json['createdAt'] as String?,
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'objectId': instance.objectId,
      'username': instance.username,
      'walletBalance': instance.walletBalance,
      'transactionAmount': instance.transactionAmount,
      'walletUpdateDate': instance.walletUpdateDate,
      'transactionDate': instance.transactionDate,
      'createdAt': instance.createdAt,
    };
