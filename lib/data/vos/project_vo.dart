import 'package:json_annotation/json_annotation.dart';

part 'project_vo.g.dart';

@JsonSerializable()
class ProjectVO {
  @JsonKey(name: 'id')
  final int id;
  @JsonKey(name: 'project_name')
  final String projectName;
  @JsonKey(name: 'platforms')
  final String platforms;
  @JsonKey(name: 'project_info')
  final String projectInfo;

  ProjectVO(this.id, this.projectName, this.platforms, this.projectInfo);

  factory ProjectVO.fromJson(Map<String,dynamic> json) => _$ProjectVOFromJson(json);
  Map<String,dynamic> json() => _$ProjectVOToJson(this);
}
