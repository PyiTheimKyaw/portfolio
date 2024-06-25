import 'package:json_annotation/json_annotation.dart';
import 'package:portfolio/data/vos/experience_vo.dart';

part 'experiences_response.g.dart';

@JsonSerializable()
class ExperiencesResponse {
  @JsonKey(name: 'status')
  final int status;
  @JsonKey(name: 'message')
  final String message;
  @JsonKey(name: 'experiences')
  final List<ExperienceVO>? experiences;

  ExperiencesResponse(this.status, this.message, this.experiences);

  factory ExperiencesResponse.fromJson(Map<String, dynamic> json) => _$ExperiencesResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ExperiencesResponseToJson(this);
}
