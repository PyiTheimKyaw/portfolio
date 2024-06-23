import 'package:json_annotation/json_annotation.dart';

part 'education_vo.g.dart';

@JsonSerializable()
class EducationVO {
  @JsonKey(name: 'id')
  final int id;
  @JsonKey(name: 'school_name')
  final String schoolName;
  @JsonKey(name: 'course')
  final String course;
  @JsonKey(name: 'certificate')
  final String certificate;
  @JsonKey(name: 'duration')
  final String duration;
  @JsonKey(name: 'link')
  final String link;

  EducationVO(this.id, this.schoolName, this.course, this.certificate, this.duration, this.link);

  factory EducationVO.fromJson(Map<String, dynamic> json) => _$EducationVOFromJson(json);

  Map<String, dynamic> toJson() => _$EducationVOToJson(this);
}
