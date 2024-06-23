// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service_vo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ServiceVO _$ServiceVOFromJson(Map<String, dynamic> json) => ServiceVO(
      (json['id'] as num?)?.toInt(),
      json['service_name'] as String?,
      json['description'] as String?,
      (json['languages'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$ServiceVOToJson(ServiceVO instance) => <String, dynamic>{
      'id': instance.id,
      'service_name': instance.serviceName,
      'description': instance.description,
      'languages': instance.languages,
    };
