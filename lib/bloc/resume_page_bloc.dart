import 'package:portfolio/bloc/base_bloc.dart';
import 'package:portfolio/data/models/impls/static_data_model_impl.dart';
import 'package:portfolio/data/models/static_data_model.dart';
import 'package:portfolio/data/vos/certificate_vo.dart';
import 'package:portfolio/data/vos/education_vo.dart';
import 'package:portfolio/data/vos/experience_vo.dart';
import 'package:portfolio/data/vos/profile_vo.dart';
import 'package:portfolio/utils/strings.dart';

class ResumePageBloc extends BaseBloc {
  String selectedItem = kTextSkills;
  List<ExperienceVO>? experiences;
  List<EducationVO>? educations;
  List<CertificateVO>? certificates;
  ProfileVO? profileData;
  final StaticDataModel _staticDataModel = StaticDataModelImpl();

  ResumePageBloc() {
    getExperiences();
    getEducations();
    getProfileData();
    getCertificates();
  }

  Future getExperiences() {
    return _staticDataModel.getAllExperiences().then((res) {
      experiences = res;
      notifySafely();
    });
  }

  Future getEducations() {
    return _staticDataModel.getAllEducations().then((res) {
      educations = res;
      notifySafely();
    });
  }

  Future getCertificates() {
    return _staticDataModel.getAllCertificates().then((res) {
      certificates = res;
      notifySafely();
    });
  }

  Future getProfileData() {
    return _staticDataModel.getProfileData().then((res) {
      profileData = res;
      notifySafely();
    });
  }

  void onTapSelectItem(String item) {
    selectedItem = item;
    notifySafely();
  }
}
