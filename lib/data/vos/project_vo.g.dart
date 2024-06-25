// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_vo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProjectVO _$ProjectVOFromJson(Map<String, dynamic> json) => ProjectVO(
      (json['id'] as num?)?.toInt(),
      json['project_name'] as String?,
      json['platforms'] as String?,
      json['project_info'] as String?,
      json['image'] as String?,
      json['url'] as String?,
      json['app_url'] as String?,
      json['record_url'] as String?,
    );

Map<String, dynamic> _$ProjectVOToJson(ProjectVO instance) => <String, dynamic>{
      'id': instance.id,
      'project_name': instance.projectName,
      'platforms': instance.platforms,
      'project_info': instance.projectInfo,
      'image': instance.image,
      'url': instance.url,
      'app_url': instance.appUrl,
      'record_url': instance.recordUrl,
    };
