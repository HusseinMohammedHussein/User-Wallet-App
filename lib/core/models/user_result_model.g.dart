// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_result_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserResultModel _$UserResultModelFromJson(Map<String, dynamic> json) =>
    UserResultModel(
      results: (json['results'] as List<dynamic>?)
          ?.map((e) => UserModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$UserResultModelToJson(UserResultModel instance) =>
    <String, dynamic>{
      'results': instance.results,
    };
