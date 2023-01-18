// ignore_for_file: library_private_types_in_public_api

import 'package:mobx/mobx.dart';
import 'package:oratio/config/entities/project.dart';
import 'package:oratio/config/entities/student.dart';
import 'package:oratio/config/usecases/project/get_project_by_student_id.dart';
part 'student_profile_store.g.dart';

class StudentProfileStore = _StudentProfileBase with _$StudentProfileStore;

abstract class _StudentProfileBase with Store {
  final GetProjectByStudentId _getProjectByStudentId = GetProjectByStudentId();

  @observable
  bool isLoading = false;

  @observable
  Student? student;

  @observable
  Project? project;

  Future<void> onInit(Student student) async {
    isLoading = true;
    this.student = student;

    project = await _getProjectByStudentId(student.id!);

    isLoading = false;
  }
}
