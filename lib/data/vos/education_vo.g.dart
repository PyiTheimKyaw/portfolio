// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'education_vo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EducationVO _$EducationVOFromJson(Map<String, dynamic> json) => EducationVO(
      (json['id'] as num).toInt(),
      json['school_name'] as String,
      json['course'] as String,
      json['certificate'] as String,
      json['duration'] as String,
      json['link'] as String,
    );

Map<String, dynamic> _$EducationVOToJson(EducationVO instance) =>
    <String, dynamic>{
      'id': instance.id,
      'school_name': instance.schoolName,
      'course': instance.course,
      'certificate': instance.certificate,
      'duration': instance.duration,
      'link': instance.link,
    };
