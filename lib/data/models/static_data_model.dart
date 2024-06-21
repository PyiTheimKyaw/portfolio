
import 'package:portfolio/data/vos/service_vo.dart';
import 'package:portfolio/data/vos/project_vo.dart';

abstract class StaticDataModel{
  Future<List<ServiceVO>> getAbilities();

  Future<List<ProjectVO>> getAllProjects();
}