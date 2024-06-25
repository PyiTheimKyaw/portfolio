import 'package:json_annotation/json_annotation.dart';
import 'package:portfolio/data/vos/education_vo.dart';

part 'educations_response.g.dart';

@JsonSerializable()
class EducationsResponse {
  @JsonKey(name: 'status')
  final int status;
  @JsonKey(name: 'message')
  final String message;
  @JsonKey(name: 'educations')
  final List<EducationVO>? educations;

  EducationsResponse(this.status, this.message, this.educations);

  factory EducationsResponse.fromJson(Map<String, dynamic> json) => _$EducationsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$EducationsResponseToJson(this);
}
