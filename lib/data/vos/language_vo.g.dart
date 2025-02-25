// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'language_vo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LanguageVO _$LanguageVOFromJson(Map<String, dynamic> json) => LanguageVO(
      (json['id'] as num).toInt(),
      json['name'] as String,
      json['image_url'] as String,
    );

Map<String, dynamic> _$LanguageVOToJson(LanguageVO instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'image_url': instance.imageUrl,
    };
