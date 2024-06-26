// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'certificate_vo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CertificateVO _$CertificateVOFromJson(Map<String, dynamic> json) =>
    CertificateVO(
      (json['id'] as num).toInt(),
      json['class_name'] as String,
      json['course'] as String,
      json['duration'] as String,
      json['link'] as String,
    );

Map<String, dynamic> _$CertificateVOToJson(CertificateVO instance) =>
    <String, dynamic>{
      'id': instance.id,
      'class_name': instance.className,
      'course': instance.course,
      'duration': instance.duration,
      'link': instance.link,
    };
