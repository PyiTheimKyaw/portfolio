// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'services_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ServicesResponse _$ServicesResponseFromJson(Map<String, dynamic> json) =>
    ServicesResponse(
      (json['status'] as num).toInt(),
      json['message'] as String,
      (json['services'] as List<dynamic>)
          .map((e) => ServiceVO.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ServicesResponseToJson(ServicesResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'services': instance.services,
    };
