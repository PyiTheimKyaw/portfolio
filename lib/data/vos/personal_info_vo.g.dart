// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'personal_info_vo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PersonalInfoVO _$PersonalInfoVOFromJson(Map<String, dynamic> json) =>
    PersonalInfoVO(
      json['about_me_description'] as String?,
      json['cv_url'] as String?,
      json['developer'] as String?,
      json['github_url'] as String?,
      json['greeting'] as String?,
      json['greeting_name'] as String?,
      json['line_url'] as String?,
      json['linkedin_url'] as String?,
      json['whatapps_url'] as String?,
      json['portfolio_url'] as String?,
      json['profile_image'] as String?,
    );

Map<String, dynamic> _$PersonalInfoVOToJson(PersonalInfoVO instance) =>
    <String, dynamic>{
      'about_me_description': instance.aboutMeDesc,
      'cv_url': instance.cvUrl,
      'developer': instance.developer,
      'github_url': instance.githubUrl,
      'greeting': instance.greeting,
      'greeting_name': instance.greetingName,
      'line_url': instance.lineUrl,
      'linkedin_url': instance.linkedinUrl,
      'whatapps_url': instance.whatAppsUrl,
      'portfolio_url': instance.portfolioUrl,
      'profile_image': instance.profileImage,
    };
