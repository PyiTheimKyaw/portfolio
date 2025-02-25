import 'package:json_annotation/json_annotation.dart';

part 'development_vo.g.dart';

@JsonSerializable()
class DevelopmentVO {
  @JsonKey(name: 'id')
  final int? id;
  @JsonKey(name: 'service_name')
  final String? serviceName;
  @JsonKey(name: 'description')
  final String? description;
  @JsonKey(name: 'languages')
  final List<int>? languages;
  @JsonKey(name: 'image_url')
  final String? imageUrl;

  bool? isHovered;

  DevelopmentVO({
    required this.id,
    required this.serviceName,
    required this.description,
    required this.languages,
    required this.imageUrl,
    this.isHovered = false,
  });

  @override
  String toString() {
    return 'DevelopmentVO{id: $id, serviceName: $serviceName, description: $description, languages: $languages, imageUrl: $imageUrl, isHovered: $isHovered}';
  }

  factory DevelopmentVO.fromJson(Map<String, dynamic> json) => _$DevelopmentVOFromJson(json);

  Map<String, dynamic> toJson() => _$DevelopmentVOToJson(this);
}
