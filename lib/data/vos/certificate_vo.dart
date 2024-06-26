import 'package:json_annotation/json_annotation.dart';

part 'certificate_vo.g.dart';

@JsonSerializable()
class CertificateVO {
  @JsonKey(name: 'id')
  final int id;
  @JsonKey(name: 'class_name')
  final String className;
  @JsonKey(name: 'course')
  final String course;
  @JsonKey(name: 'duration')
  final String duration;
  @JsonKey(name: 'link')
  final String link;

  CertificateVO(this.id, this.className, this.course, this.duration, this.link);

  factory CertificateVO.fromJson(Map<String, dynamic> json) => _$CertificateVOFromJson(json);

  Map<String, dynamic> toJson() => _$CertificateVOToJson(this);
}
