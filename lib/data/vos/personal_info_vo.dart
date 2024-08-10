import 'package:json_annotation/json_annotation.dart';

part 'personal_info_vo.g.dart';

@JsonSerializable()
class PersonalInfoVO {
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
  @JsonKey(name: 'about_me_description')
  final String? aboutMeDesc;
  @JsonKey(name: 'cv_url')
  final String? cvUrl;
  @JsonKey(name: 'developer')
  final String? developer;
  @JsonKey(name: 'github_url')
  final String? githubUrl;
  @JsonKey(name: 'greeting')
  final String? greeting;
  @JsonKey(name: 'greeting_name')
  final String? greetingName;
  @JsonKey(name: 'line_url')
  final String? lineUrl;
  @JsonKey(name: 'linkedin_url')
  final String? linkedinUrl;
  @JsonKey(name: 'whatapps_url')
  final String? whatAppsUrl;
  @JsonKey(name: 'portfolio_url')
  final String? portfolioUrl;
  @JsonKey(name: 'profile_image')
  String? profileImage;

  PersonalInfoVO(
      this.name,
      this.nationality,
      this.experience,
      this.email,
      this.phone,
      this.line,
      this.whatApps,
      this.address,
      this.aboutMeDesc,
      this.cvUrl,
      this.developer,
      this.githubUrl,
      this.greeting,
      this.greetingName,
      this.lineUrl,
      this.linkedinUrl,
      this.whatAppsUrl,
      this.portfolioUrl,
      this.profileImage);

  factory PersonalInfoVO.fromJson(Map<String, dynamic> json) =>
      _$PersonalInfoVOFromJson(json);

  Map<String, dynamic> toJson() => _$PersonalInfoVOToJson(this);
}
