import 'package:portfolio/bloc/base_bloc.dart';
import 'package:portfolio/data/models/impls/static_data_model_impl.dart';
import 'package:portfolio/data/models/static_data_model.dart';
import 'package:portfolio/data/vos/development_vo.dart';

class ServicePageBloc extends BaseBloc {
  List<DevelopmentVO>? services;
  final StaticDataModel _staticDataModel = StaticDataModelImpl();

  ServicePageBloc() {
    getAbilities();
  }

  Future getAbilities() {
    setLoadingState();
    return _staticDataModel.getSkills().then((res) {
      // services = res;
      notifySafely();
      setSuccessState();
    });
  }
}
