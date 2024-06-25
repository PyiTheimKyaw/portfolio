import 'package:portfolio/bloc/base_bloc.dart';
import 'package:portfolio/data/models/impls/static_data_model_impl.dart';
import 'package:portfolio/data/models/static_data_model.dart';
import 'package:portfolio/data/vos/project_vo.dart';

class ProjectsPageBloc extends BaseBloc {
  List<ProjectVO>? projects;
  final StaticDataModel _staticDataModel = StaticDataModelImpl();

  ProjectsPageBloc() {
    getProjects();
  }

  Future getProjects() {
    return _staticDataModel.getAllProjects().then((res) {
      projects = res;
      notifySafely();
    });
  }
}
