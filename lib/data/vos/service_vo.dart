import 'package:json_annotation/json_annotation.dart';

part 'service_vo.g.dart';

@JsonSerializable()
class ServiceVO {
  @JsonKey(name: 'id')
  final int? id;
  @JsonKey(name: 'service_name')
  final String? serviceName;
  @JsonKey(name: 'description')
  final String? description;
  @JsonKey(name: 'languages')
  final List<String>? languages;

  ServiceVO(this.id, this.serviceName, this.description, this.languages);

  factory ServiceVO.fromJson(Map<String, dynamic> json) => _$ServiceVOFromJson(json);

  Map<String, dynamic> toJson() => _$ServiceVOToJson(this);
}
