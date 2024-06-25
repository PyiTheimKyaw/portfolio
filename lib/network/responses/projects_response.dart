import 'package:json_annotation/json_annotation.dart';
import 'package:portfolio/data/vos/project_vo.dart';

part 'projects_response.g.dart';

@JsonSerializable()
class ProjectsResponse {
  @JsonKey(name: 'status')
  final int status;
  @JsonKey(name: 'projects')
  final List<ProjectVO>? projects;

  ProjectsResponse(this.status, this.projects);

  factory ProjectsResponse.fromJson(Map<String, dynamic> json) => _$ProjectsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ProjectsResponseToJson(this);
}
