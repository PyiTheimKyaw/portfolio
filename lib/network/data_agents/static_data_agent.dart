import 'package:portfolio/data/vos/certificate_vo.dart';
import 'package:portfolio/data/vos/education_vo.dart';
import 'package:portfolio/data/vos/experience_vo.dart';
import 'package:portfolio/data/vos/personal_info_vo.dart';
import 'package:portfolio/data/vos/project_vo.dart';
import 'package:portfolio/data/vos/service_vo.dart';

abstract class StaticDataAgent {
  Stream<List<CertificateVO>?> getAllCertificates();

  Stream<PersonalInfoVO> getPersonalInfo();

  Stream<List<ServiceVO>?> getAllServices();

  Stream<List<ProjectVO>?> getAllProjects();

  Stream<List<EducationVO>?> getAllEducations();

  Stream<List<ExperienceVO>?> getAllExperiences();
}
