// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'experiences_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExperiencesResponse _$ExperiencesResponseFromJson(Map<String, dynamic> json) =>
    ExperiencesResponse(
      (json['status'] as num).toInt(),
      json['message'] as String,
      (json['experiences'] as List<dynamic>)
          .map((e) => ExperienceVO.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ExperiencesResponseToJson(
        ExperiencesResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'experiences': instance.experiences,
    };
