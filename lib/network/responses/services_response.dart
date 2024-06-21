import 'package:json_annotation/json_annotation.dart';
import 'package:portfolio/data/vos/service_vo.dart';

part 'services_response.g.dart';

@JsonSerializable()
class ServicesResponse {
  @JsonKey(name: 'status')
  final int status;
  @JsonKey(name: 'message')
  final String message;
  @JsonKey(name: 'services')
  final List<ServiceVO> services;

  ServicesResponse(this.status, this.message, this.services);

  factory ServicesResponse.fromJson(Map<String, dynamic> json) =>
      _$ServicesResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ServicesResponseToJson(this);
}
