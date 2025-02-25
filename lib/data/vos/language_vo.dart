import 'package:json_annotation/json_annotation.dart';
part 'language_vo.g.dart';
@JsonSerializable()
class LanguageVO{
  @JsonKey(name: 'id')
  final int id;
  @JsonKey(name: 'name')
  final String name;
  @JsonKey(name: 'image_url')
  final String imageUrl;

  LanguageVO(this.id, this.name, this.imageUrl);

  factory LanguageVO.fromJson(Map<String, dynamic> json) => _$LanguageVOFromJson(json);

  Map<String, dynamic> toJson() => _$LanguageVOToJson(this);
}