// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'skills_vo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SkillsVO _$SkillsVOFromJson(Map<String, dynamic> json) => SkillsVO(
      (json['developments'] as List<dynamic>?)
          ?.map((e) => DevelopmentVO.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['languages'] as List<dynamic>?)
          ?.map((e) => LanguageVO.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SkillsVOToJson(SkillsVO instance) => <String, dynamic>{
      'developments': instance.developments,
      'languages': instance.languages,
    };
