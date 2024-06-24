import 'package:json_annotation/json_annotation.dart';

part 'project_vo.g.dart';

@JsonSerializable()
class ProjectVO {
  @JsonKey(name: 'id')
  final int? id;
  @JsonKey(name: 'project_name')
  final String? projectName;
  @JsonKey(name: 'platforms')
  final String? platforms;
  @JsonKey(name: 'project_info')
  final String? projectInfo;
  @JsonKey(name: 'image')
  final String? image;
  @JsonKey(name: 'url')
  final String? url;
  @JsonKey(name: 'app_url')
  final String? appUrl;
  @JsonKey(name: 'record_url')
  final String? recordUrl;

  ProjectVO(
    this.id,
    this.projectName,
    this.platforms,
    this.projectInfo,
    this.image,
    this.url,
    this.appUrl,
    this.recordUrl,
  );

  factory ProjectVO.fromJson(Map<String, dynamic> json) => _$ProjectVOFromJson(json);

  Map<String, dynamic> json() => _$ProjectVOToJson(this);
}
