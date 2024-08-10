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
  @JsonKey(name: 'image_url')
  final String? imageUrl;
  @JsonKey(name: 'url')
  final String? url;
  @JsonKey(name: 'android_url')
  final String? androidUrl;
  @JsonKey(name: 'ios_url')
  final String? iosUrl;
  @JsonKey(name: 'web_url')
  final String? webUrl;
  @JsonKey(name: 'record_url')
  final String? recordUrl;

  ProjectVO(
    this.id,
    this.projectName,
    this.platforms,
    this.projectInfo,
    this.imageUrl,
    this.url,
    this.androidUrl,
    this.iosUrl,
    this.webUrl,
    this.recordUrl,
  );

  factory ProjectVO.fromJson(Map<String, dynamic> json) => _$ProjectVOFromJson(json);

  Map<String, dynamic> json() => _$ProjectVOToJson(this);
}
