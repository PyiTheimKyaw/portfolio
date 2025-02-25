import 'dart:async';
import 'package:portfolio/bloc/base_bloc.dart';
import 'package:portfolio/data/models/impls/static_data_model_impl.dart';
import 'package:portfolio/data/models/static_data_model.dart';
import 'package:portfolio/data/vos/personal_info_vo.dart';
import 'package:portfolio/data/vos/skills_vo.dart';

import '../data/vos/development_vo.dart';

class HomePageBloc extends BaseBloc {
  final StaticDataModel _staticDataModel = StaticDataModelImpl();
  PersonalInfoVO? personalInfo;
  SkillsVO? skills;
  DevelopmentVO? hoveredDevelopment;

  HomePageBloc() {
    getPersonalInfo();
    getSkills();
  }

  void onSetSkillHovered({required DevelopmentVO? dev, required bool isHovered}) {
    skills?.developments?.map((item) {
      if (item.id == dev?.id) {
        item.isHovered = isHovered;
      }
    });
    hoveredDevelopment = skills?.getHoveredItem();
    print("Skills after changed ${hoveredDevelopment.toString()}");
    notifySafely();
  }

  Future<PersonalInfoVO?> getPersonalInfo() {
    setShowDialogFlag(false);
    setLoadingState();
    return _staticDataModel.getPersonalInfo().then((data) async {
      personalInfo = data;
      notifySafely();
      setSuccessState();
      return personalInfo;
    });
  }

  Future getSkills() {
    setLoadingState();
    return _staticDataModel.getSkills().then((res) {
      skills = res;
      notifySafely();
      setSuccessState();
    });
  }
}
