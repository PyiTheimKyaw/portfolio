import 'dart:async';
import 'package:portfolio/bloc/base_bloc.dart';
import 'package:portfolio/data/models/impls/static_data_model_impl.dart';
import 'package:portfolio/data/models/static_data_model.dart';
import 'package:portfolio/data/vos/personal_info_vo.dart';

class HomePageBloc extends BaseBloc {
  final StaticDataModel _staticDataModel = StaticDataModelImpl();
  PersonalInfoVO? personalInfo;

  HomePageBloc() {
    getPersonalInfo();
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
}
