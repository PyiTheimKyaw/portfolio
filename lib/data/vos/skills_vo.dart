import 'package:json_annotation/json_annotation.dart';
import 'package:portfolio/data/vos/development_vo.dart';
import 'package:portfolio/data/vos/language_vo.dart';

part 'skills_vo.g.dart';

@JsonSerializable()
class SkillsVO {
  @JsonKey(name: 'developments')
  final List<DevelopmentVO>? developments;
  @JsonKey(name: 'languages')
  final List<LanguageVO>? languages;

  SkillsVO(this.developments, this.languages);

  factory SkillsVO.fromJson(Map<String, dynamic> json) => _$SkillsVOFromJson(json);

  Map<String, dynamic> toJson() => _$SkillsVOToJson(this);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SkillsVO &&
          runtimeType == other.runtimeType &&
          developments == other.developments &&
          languages == other.languages;

  @override
  int get hashCode => developments.hashCode ^ languages.hashCode;

  DevelopmentVO? getHoveredItem() {
    print("Item ${developments?.where((e) => e.isHovered == true).firstOrNull?.languages.toString()}");
    return developments?.where((e) => e.isHovered == true).firstOrNull;
  }
}
