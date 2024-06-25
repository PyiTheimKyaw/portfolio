import 'package:portfolio/bloc/base_bloc.dart';
import 'package:portfolio/data/models/impls/static_data_model_impl.dart';
import 'package:portfolio/data/models/static_data_model.dart';
import 'package:portfolio/data/vos/service_vo.dart';

class ServicePageBloc extends BaseBloc {
  List<ServiceVO>? services;
  final StaticDataModel _staticDataModel = StaticDataModelImpl();

  ServicePageBloc() {
    getAbilities();
    // getProjects();
  }

  Future getAbilities() {
    return _staticDataModel.getAbilities().then((res) {
      services = res;
      notifySafely();
    });
  }

}
