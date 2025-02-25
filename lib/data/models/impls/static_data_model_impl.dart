import 'package:portfolio/data/models/static_data_model.dart';
import 'package:portfolio/data/vos/certificate_vo.dart';
import 'package:portfolio/data/vos/education_vo.dart';
import 'package:portfolio/data/vos/experience_vo.dart';
import 'package:portfolio/data/vos/personal_info_vo.dart';
import 'package:portfolio/data/vos/development_vo.dart';
import 'package:portfolio/data/vos/project_vo.dart';
import 'package:portfolio/data/vos/skills_vo.dart';
import 'package:portfolio/network/data_agents/static_data_agent.dart';
import 'package:portfolio/network/data_agents_impls/static_data_agent_impl.dart';

class StaticDataModelImpl extends StaticDataModel {
  static StaticDataModelImpl? instance;

  StaticDataModelImpl._internal();

  factory StaticDataModelImpl() {
    instance ??= StaticDataModelImpl._internal();
    return instance!;
  }

  final StaticDataAgent _staticDataAgent = StaticDataAgentImpl();

  @override
  Future<SkillsVO> getSkills() async {
    return _staticDataAgent.getAllServices().first;
  }

  @override
  Future<List<ProjectVO>?> getAllProjects() async {
    return _staticDataAgent.getAllProjects().first;
  }

  @override
  Future<List<ExperienceVO>?> getAllExperiences() async {
    return _staticDataAgent.getAllExperiences().first;
  }

  @override
  Future<List<EducationVO>?> getAllEducations() async {
    return _staticDataAgent.getAllEducations().first;
  }

  @override
  Future<List<CertificateVO>?> getAllCertificates() {
    return _staticDataAgent.getAllCertificates().first;
  }

  @override
  Future<PersonalInfoVO?> getPersonalInfo() {
    return _staticDataAgent.getPersonalInfo().first;
  }
}
