import 'package:oratio/config/entities/project.dart';
import 'package:oratio/config/entities/result.dart';
import 'package:oratio/data/repositories/project_repository.dart';

class AddEvaluator {
  final ProjectRepository _repository = ProjectRepository();

  Future<Result> call(Project project, int evaluatorId) async {
    final editedProject = Project(
      id: project.id,
      title: project.title,
      description: project.description,
      link: project.link,
      status: project.status,
      studentId: project.studentId,
      teacherId: project.teacherId,
      evaluatorId: evaluatorId,
      evaluatorId2: project.evaluatorId2,
      avaliable: project.avaliable,
      finalized: project.finalized,
    );

    return await _repository.editProject(editedProject);
  }

  Future<Result> addEvaluator2(Project project, int evaluatorId) async {
    final editedProject = Project(
      id: project.id,
      title: project.title,
      description: project.description,
      link: project.link,
      status: project.status,
      studentId: project.studentId,
      teacherId: project.teacherId,
      evaluatorId: project.evaluatorId,
      evaluatorId2: evaluatorId,
      avaliable: project.avaliable,
      finalized: project.finalized,
    );

    return await _repository.editProject(editedProject);
  }
}
