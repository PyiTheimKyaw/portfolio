import 'package:firebase_database/firebase_database.dart';
import 'package:portfolio/data/vos/certificate_vo.dart';
import 'package:portfolio/data/vos/education_vo.dart';
import 'package:portfolio/data/vos/experience_vo.dart';
import 'package:portfolio/data/vos/personal_info_vo.dart';
import 'package:portfolio/data/vos/project_vo.dart';
import 'package:portfolio/data/vos/development_vo.dart';
import 'package:portfolio/network/data_agents/static_data_agent.dart';
import 'package:portfolio/utils/strings.dart';

import '../../data/vos/skills_vo.dart';

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
        return CertificateVO.fromJson(Map<String, dynamic>.from(snapshot.value as Map));
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
  Stream<SkillsVO> getAllServices() {
    return databaseRef.child(kFirebaseRefSkills).onValue.map((event) {
      final rawData = event.snapshot.value;

      if (rawData is Map<Object?, Object?>) {
        final convertedData = _convertToMap(rawData);
        return SkillsVO.fromJson(convertedData);
      } else {
        throw Exception("Unexpected data format from Firebase: $rawData");
      }
    });
  }

// Recursive function to convert Firebase's LinkedMap to Map<String, dynamic>
  Map<String, dynamic> _convertToMap(Map<Object?, Object?> input) {
    return input.map((key, value) {
      if (value is Map<Object?, Object?>) {
        return MapEntry(key.toString(), _convertToMap(value)); // Recursively convert nested maps
      } else if (value is List) {
        return MapEntry(key.toString(), _convertToList(value)); // Convert lists properly
      } else {
        return MapEntry(key.toString(), value);
      }
    });
  }

// Helper function to process lists
  List<dynamic> _convertToList(List list) {
    return list.map((item) {
      if (item is Map<Object?, Object?>) {
        return _convertToMap(item);
      }
      return item;
    }).toList();
  }



  @override
  Stream<List<ProjectVO>?> getAllProjects() {
    return databaseRef.child(kFirebaseRefProjects).onValue.map((event) {
      return event.snapshot.children.map<ProjectVO>((snapshot) {
        return ProjectVO.fromJson(Map<String, dynamic>.from(snapshot.value as Map));
      }).toList();
    });
  }

  @override
  Stream<List<EducationVO>?> getAllEducations() {
    return databaseRef.child(kFirebaseRefEducations).onValue.map((event) {
      return event.snapshot.children.map<EducationVO>((snapshot) {
        return EducationVO.fromJson(Map<String, dynamic>.from(snapshot.value as Map));
      }).toList();
    });
  }

  @override
  Stream<List<ExperienceVO>?> getAllExperiences() {
    return databaseRef.child(kFirebaseRefExperiences).onValue.map((event) {
      return event.snapshot.children.map<ExperienceVO>((snapshot) {
        return ExperienceVO.fromJson(Map<String, dynamic>.from(snapshot.value as Map));
      }).toList();
    });
  }
}
