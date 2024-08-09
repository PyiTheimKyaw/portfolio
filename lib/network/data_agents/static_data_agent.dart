import 'package:portfolio/data/vos/certificate_vo.dart';
import 'package:portfolio/data/vos/personal_info_vo.dart';

abstract class StaticDataAgent {
  Stream<List<CertificateVO>?> getAllCertificates();

  Stream<PersonalInfoVO> getPersonalInfo();
}
