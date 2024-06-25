import 'package:json_annotation/json_annotation.dart';

part 'profile_vo.g.dart';

@JsonSerializable()
class ProfileVO {
  @JsonKey(name: 'name')
  final String? name;
  @JsonKey(name: 'nationality')
  final String? nationality;
  @JsonKey(name: 'experience')
  final String? experience;
  @JsonKey(name: 'email')
  final String? email;
  @JsonKey(name: 'phone')
  final String? phone;
  @JsonKey(name: 'line')
  final String? line;
  @JsonKey(name: 'what_apps')
  final String? whatApps;
  @JsonKey(name: 'address')
  final String? address;

  ProfileVO(
    this.name,
    this.nationality,
    this.experience,
    this.email,
    this.phone,
    this.line,
    this.whatApps,
    this.address,
  );

  factory ProfileVO.fromJson(Map<String, dynamic> json) => _$ProfileVOFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileVOToJson(this);
}
