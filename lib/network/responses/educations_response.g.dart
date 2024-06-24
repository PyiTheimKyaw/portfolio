// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'educations_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EducationsResponse _$EducationsResponseFromJson(Map<String, dynamic> json) =>
    EducationsResponse(
      (json['status'] as num).toInt(),
      json['message'] as String,
      (json['educations'] as List<dynamic>?)
          ?.map((e) => EducationVO.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$EducationsResponseToJson(EducationsResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'educations': instance.educations,
    };
