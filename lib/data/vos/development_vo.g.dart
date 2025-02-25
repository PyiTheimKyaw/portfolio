// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'development_vo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DevelopmentVO _$DevelopmentVOFromJson(Map<String, dynamic> json) =>
    DevelopmentVO(
      id: (json['id'] as num?)?.toInt(),
      serviceName: json['service_name'] as String?,
      description: json['description'] as String?,
      languages: (json['languages'] as List<dynamic>?)
          ?.map((e) => (e as num).toInt())
          .toList(),
      imageUrl: json['image_url'] as String?,
      isHovered: json['isHovered'] as bool? ?? false,
    );

Map<String, dynamic> _$DevelopmentVOToJson(DevelopmentVO instance) =>
    <String, dynamic>{
      'id': instance.id,
      'service_name': instance.serviceName,
      'description': instance.description,
      'languages': instance.languages,
      'image_url': instance.imageUrl,
      'isHovered': instance.isHovered,
    };
