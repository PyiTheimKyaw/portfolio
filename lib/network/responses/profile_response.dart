import 'package:json_annotation/json_annotation.dart';
import 'package:portfolio/data/vos/profile_vo.dart';

part 'profile_response.g.dart';

@JsonSerializable()
class ProfileResponse {
  @JsonKey(name: 'status')
  final int status;
  @JsonKey(name: 'message')
  final String message;
  @JsonKey(name: 'data')
  final ProfileVO? data;

  ProfileResponse(this.status, this.message, this.data);

  factory ProfileResponse.fromJson(Map<String, dynamic> json) => _$ProfileResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileResponseToJson(this);
}
