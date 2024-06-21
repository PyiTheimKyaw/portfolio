// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'projects_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProjectsResponse _$ProjectsResponseFromJson(Map<String, dynamic> json) =>
    ProjectsResponse(
      (json['status'] as num).toInt(),
      (json['projects'] as List<dynamic>)
          .map((e) => ProjectVO.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ProjectsResponseToJson(ProjectsResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'projects': instance.projects,
    };
