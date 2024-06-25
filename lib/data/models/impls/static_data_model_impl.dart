import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:portfolio/data/models/static_data_model.dart';
import 'package:portfolio/data/vos/education_vo.dart';
import 'package:portfolio/data/vos/experience_vo.dart';
import 'package:portfolio/data/vos/profile_vo.dart';
import 'package:portfolio/data/vos/service_vo.dart';
import 'package:portfolio/data/vos/project_vo.dart';
import 'package:portfolio/network/responses/educations_response.dart';
import 'package:portfolio/network/responses/experiences_response.dart';
import 'package:portfolio/network/responses/profile_response.dart';
import 'package:portfolio/network/responses/services_response.dart';
import 'package:portfolio/network/responses/projects_response.dart';

class StaticDataModelImpl extends StaticDataModel {
  static StaticDataModelImpl? instance;

  StaticDataModelImpl._internal();

  factory StaticDataModelImpl() {
    instance ??= StaticDataModelImpl._internal();
    return instance!;
  }

  @override
  Future<List<ServiceVO>?> getAbilities() async {
    final String response = await rootBundle.loadString('assets/jsons/services.json');
    final Map<String, dynamic> abilitiesJson = await json.decode(response);
    ServicesResponse abilitiesResponse = ServicesResponse.fromJson(abilitiesJson);
    return abilitiesResponse.services;
  }

  @override
  Future<List<ProjectVO>?> getAllProjects() async {
    final String responseString = await rootBundle.loadString('assets/jsons/projects.json');
    final Map<String, dynamic> projectsJson = await json.decode(responseString);
    ProjectsResponse projectsResponse = ProjectsResponse.fromJson(projectsJson);
    return projectsResponse.projects;
  }

  @override
  Future<List<ExperienceVO>?> getAllExperiences() async {
    final String response = await rootBundle.loadString('assets/jsons/experiences.json');
    final Map<String, dynamic> experiencesJson = await json.decode(response);
    ExperiencesResponse experiencesResponse = ExperiencesResponse.fromJson(experiencesJson);
    return experiencesResponse.experiences;
  }

  @override
  Future<List<EducationVO>?> getAllEducations() async {
    final String response = await rootBundle.loadString('assets/jsons/educations.json');
    final Map<String, dynamic> educationsJson = await json.decode(response);
    EducationsResponse educationsResponse = EducationsResponse.fromJson(educationsJson);
    return educationsResponse.educations;
  }

  @override
  Future<ProfileVO?> getProfileData() async {
    final String response = await rootBundle.loadString('assets/jsons/profile.json');
    final Map<String, dynamic> profileJson = await json.decode(response);
    ProfileResponse profileResponse = ProfileResponse.fromJson(profileJson);
    return profileResponse.data;
  }
}
