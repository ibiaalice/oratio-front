import 'package:gsheets/gsheets.dart';
import 'package:oratio/config/entities/result.dart';
import 'package:oratio/config/entities/student.dart';
import 'package:oratio/config/entities/teacher.dart';
import 'package:oratio/config/usecases/semester/get_active_semester.dart';
import 'package:oratio/config/usecases/student/add_student.dart';
import 'package:oratio/config/usecases/teacher/create_teacher.dart';
import 'package:oratio/data/services/g_sheets_constants.dart';

class GSheetsServices {
  final gsheets = GSheets(GSHEETS_CREDENCIALS);

  final GetActiveSemester _getActiveSemester = GetActiveSemester();
  final AddStudent _addStudent = AddStudent();
  final AddTeacher _addTeacher = AddTeacher();

  Future addTeacherBySpreedsheet(String spreadsheetId) async {
    Result result =
        Result(success: false, message: 'Erro ao adicionar professores');
    final spreadsheet = await gsheets.spreadsheet(spreadsheetId);
    final Worksheet sheet = spreadsheet.sheets[0];
    final values = await sheet.values.allRows();

    if (sheet != null) {
      for (List row in values) {
        if (row.isNotEmpty) {
          final teacher = Teacher(
            name: row[0],
            email: row[1],
          );

          result = await _addTeacher(teacher);
        }
      }
    }

    return result;
  }

  Future addStudentBySpreedsheet(String spreadsheetId) async {
    Result result = Result(success: false, message: 'Erro ao adicionar alunos');
    final spreadsheet = await gsheets.spreadsheet(spreadsheetId);
    final Worksheet sheet = spreadsheet.sheets[0];
    final values = await sheet.values.allRows();
    final activeSemester = await _getActiveSemester();

    if (activeSemester != null) {
      for (List row in values) {
        if (row.isNotEmpty) {
          final student = Student(
            name: row[0],
            email: row[1],
            registrationCourseNumber: row[2],
            semester: activeSemester.id,
          );

          result = await _addStudent(student);
        }
      }
    }

    return result;
  }
}
