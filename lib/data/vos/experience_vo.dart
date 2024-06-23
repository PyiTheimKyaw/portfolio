import 'package:json_annotation/json_annotation.dart';

part 'experience_vo.g.dart';

@JsonSerializable()
class ExperienceVO {
  @JsonKey(name: 'id')
  final int id;
  @JsonKey(name: 'company_name')
  final String companyName;
  @JsonKey(name: 'position')
  final String position;
  @JsonKey(name: 'duration')
  final String duration;

  ExperienceVO(this.id, this.companyName, this.position, this.duration);

  factory ExperienceVO.fromJson(Map<String, dynamic> json) => _$ExperienceVOFromJson(json);

  Map<String, dynamic> toJson() => _$ExperienceVOToJson(this);
}
