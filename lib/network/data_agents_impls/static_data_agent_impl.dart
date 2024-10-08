import 'package:firebase_database/firebase_database.dart';
import 'package:portfolio/data/vos/certificate_vo.dart';
import 'package:portfolio/data/vos/education_vo.dart';
import 'package:portfolio/data/vos/experience_vo.dart';
import 'package:portfolio/data/vos/personal_info_vo.dart';
import 'package:portfolio/data/vos/project_vo.dart';
import 'package:portfolio/data/vos/service_vo.dart';
import 'package:portfolio/network/data_agents/static_data_agent.dart';
import 'package:portfolio/utils/strings.dart';

class StaticDataAgentImpl extends StaticDataAgent {
  static StaticDataAgentImpl? instance;

  factory StaticDataAgentImpl() {
    instance ??= StaticDataAgentImpl._internal();
    return instance!;
  }

  StaticDataAgentImpl._internal();

  final databaseRef = FirebaseDatabase.instance.ref();

  // Stream<List<BannerVO>> getBanners() {
  //   return databaseRef.child(kBannerPath).onValue.map((event) {
  //     return event.snapshot.children.map<BannerVO>((snapshot) {
  //       return BannerVO.fromJson(Map<String, dynamic>.from(snapshot.value as Map));
  //     }).toList();
  //   });
  // }

  @override
  Stream<List<CertificateVO>?> getAllCertificates() {
    return databaseRef.child(kFirebaseRefCertificates).onValue.map((event) {
      return event.snapshot.children.map<CertificateVO>((snapshot) {
        return CertificateVO.fromJson(
            Map<String, dynamic>.from(snapshot.value as Map));
      }).toList();
    });
  }

  // Future<FeedVO> getFeedByID(int id) async {
  //   return databaseRef.child(kFeedPath).child(id.toString()).once().then((event) {
  //     final rawData = event.snapshot.value;
  //     return FeedVO.fromJson(Map<String, dynamic>.from(rawData as Map));
  //   });
  // }
  @override
  Stream<PersonalInfoVO> getPersonalInfo() {
    return databaseRef.child(kFirebaseRefPersonalInfo).onValue.map((event) {
      final rawData = event.snapshot.value;
      return PersonalInfoVO.fromJson(Map<String, dynamic>.from(rawData as Map));
    });
  }

  @override
  Stream<List<ServiceVO>?> getAllServices() {
    return databaseRef.child(kFirebaseRefServices).onValue.map((event) {
      return event.snapshot.children.map<ServiceVO>((snapshot) {
        return ServiceVO.fromJson(
            Map<String, dynamic>.from(snapshot.value as Map));
      }).toList();
    });
  }

  @override
  Stream<List<ProjectVO>?> getAllProjects() {
    return databaseRef.child(kFirebaseRefProjects).onValue.map((event) {
      return event.snapshot.children.map<ProjectVO>((snapshot) {
        return ProjectVO.fromJson(
            Map<String, dynamic>.from(snapshot.value as Map));
      }).toList();
    });
  }

  @override
  Stream<List<EducationVO>?> getAllEducations() {
    return databaseRef.child(kFirebaseRefEducations).onValue.map((event) {
      return event.snapshot.children.map<EducationVO>((snapshot) {
        return EducationVO.fromJson(
            Map<String, dynamic>.from(snapshot.value as Map));
      }).toList();
    });
  }

  @override
  Stream<List<ExperienceVO>?> getAllExperiences() {
    return databaseRef.child(kFirebaseRefExperiences).onValue.map((event) {
      return event.snapshot.children.map<ExperienceVO>((snapshot) {
        return ExperienceVO.fromJson(
            Map<String, dynamic>.from(snapshot.value as Map));
      }).toList();
    });
  }
}
