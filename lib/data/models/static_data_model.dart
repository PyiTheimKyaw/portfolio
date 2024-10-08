import 'package:portfolio/data/vos/certificate_vo.dart';
import 'package:portfolio/data/vos/education_vo.dart';
import 'package:portfolio/data/vos/experience_vo.dart';
import 'package:portfolio/data/vos/personal_info_vo.dart';
import 'package:portfolio/data/vos/service_vo.dart';
import 'package:portfolio/data/vos/project_vo.dart';

abstract class StaticDataModel {
  Future<List<ServiceVO>?> getAbilities();

  Future<List<ProjectVO>?> getAllProjects();

  Future<List<ExperienceVO>?> getAllExperiences();

  Future<List<EducationVO>?> getAllEducations();


  Future<List<CertificateVO>?> getAllCertificates();

  Future<PersonalInfoVO?> getPersonalInfo();
}
