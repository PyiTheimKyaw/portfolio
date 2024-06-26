// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'certificates_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CertificatesResponse _$CertificatesResponseFromJson(
        Map<String, dynamic> json) =>
    CertificatesResponse(
      (json['status'] as num).toInt(),
      json['message'] as String,
      (json['certificates'] as List<dynamic>?)
          ?.map((e) => CertificateVO.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CertificatesResponseToJson(
        CertificatesResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'certificates': instance.certificates,
    };
