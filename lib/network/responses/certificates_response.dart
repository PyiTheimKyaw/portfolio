import 'package:json_annotation/json_annotation.dart';
import 'package:portfolio/data/vos/certificate_vo.dart';

part 'certificates_response.g.dart';

@JsonSerializable()
class CertificatesResponse {
  @JsonKey(name: 'status')
  final int status;
  @JsonKey(name: 'message')
  final String message;
  @JsonKey(name: 'certificates')
  final List<CertificateVO>? certificates;

  CertificatesResponse(this.status, this.message, this.certificates);

  factory CertificatesResponse.fromJson(Map<String, dynamic> json) => _$CertificatesResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CertificatesResponseToJson(this);
}
