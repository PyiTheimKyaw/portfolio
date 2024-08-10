import 'dart:async';
import 'package:portfolio/bloc/base_bloc.dart';
import 'package:portfolio/data/models/impls/static_data_model_impl.dart';
import 'package:portfolio/data/models/static_data_model.dart';
import 'package:portfolio/data/vos/certificate_vo.dart';
import 'package:portfolio/data/vos/education_vo.dart';
import 'package:portfolio/data/vos/experience_vo.dart';
import 'package:portfolio/data/vos/personal_info_vo.dart';
import 'package:portfolio/utils/strings.dart';

class ResumePageBloc extends BaseBloc {
  String selectedItem = kTextSkills;
  List<ExperienceVO>? experiences;
  List<EducationVO>? educations;
  List<CertificateVO>? certificates;
  PersonalInfoVO? profileData;
  final StaticDataModel _staticDataModel = StaticDataModelImpl();

  ResumePageBloc() {
    getAllData();
  }

  Future getAllData() {
    setLoadingState();
    return Future.wait([
      getExperiences(),
      getEducations(),
      getProfileData(),
      getCertificates()
    ]).then((val) {
      setSuccessState();
    });
  }

  Future<List<ExperienceVO>?> getExperiences() {
    return _staticDataModel.getAllExperiences().then((res) {
      experiences = res;
      notifySafely();
      return experiences;
    });
  }

  Future<List<EducationVO>?> getEducations() {
    return _staticDataModel.getAllEducations().then((res) {
      educations = res;
      notifySafely();
      return educations;
    });
  }

  Future<List<CertificateVO>?> getCertificates() {
    return _staticDataModel.getAllCertificates().then((res) {
      certificates = res;
      notifySafely();
      return certificates;
    });
  }

  Future<PersonalInfoVO?> getProfileData() {
    return _staticDataModel.getPersonalInfo().then((res) {
      profileData = res;
      notifySafely();
      return profileData;
    });
  }

  void onTapSelectItem(String item) {
    selectedItem = item;
    notifySafely();
  }
}
