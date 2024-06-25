// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_vo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProfileVO _$ProfileVOFromJson(Map<String, dynamic> json) => ProfileVO(
      json['name'] as String?,
      json['nationality'] as String?,
      json['experience'] as String?,
      json['email'] as String?,
      json['phone'] as String?,
      json['line'] as String?,
      json['what_apps'] as String?,
      json['address'] as String?,
    );

Map<String, dynamic> _$ProfileVOToJson(ProfileVO instance) => <String, dynamic>{
      'name': instance.name,
      'nationality': instance.nationality,
      'experience': instance.experience,
      'email': instance.email,
      'phone': instance.phone,
      'line': instance.line,
      'what_apps': instance.whatApps,
      'address': instance.address,
    };
