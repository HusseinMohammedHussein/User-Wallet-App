// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      objectId: json['objectId'] as String?,
      username: json['username'] as String?,
      wallet: json['wallet'] as String?,
      lastActivity: json['last_activity'] as String?,
      createdAt: json['createdAt'] as String?,
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'objectId': instance.objectId,
      'username': instance.username,
      'wallet': instance.wallet,
      'last_activity': instance.lastActivity,
      'createdAt': instance.createdAt,
    };
