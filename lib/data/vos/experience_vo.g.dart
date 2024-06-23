// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'experience_vo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExperienceVO _$ExperienceVOFromJson(Map<String, dynamic> json) => ExperienceVO(
      (json['id'] as num).toInt(),
      json['company_name'] as String,
      json['position'] as String,
      json['duration'] as String,
    );

Map<String, dynamic> _$ExperienceVOToJson(ExperienceVO instance) =>
    <String, dynamic>{
      'id': instance.id,
      'company_name': instance.companyName,
      'position': instance.position,
      'duration': instance.duration,
    };
