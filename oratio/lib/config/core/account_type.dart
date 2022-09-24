enum AccountType {
  teacher,
  student,
  coordinator,
}

extension AccountTypeExtension on AccountType {
  String get name {
    switch (this) {
      case AccountType.teacher:
        return 'Professor';
      case AccountType.student:
        return 'Estudante';
      case AccountType.coordinator:
        return 'Coordenador';
    }
  }

  static AccountType fromValue(String value) {
    switch (value) {
      case 'Professor':
        return AccountType.teacher;
      case 'Estudante':
        return AccountType.student;
      case 'Coordenador':
        return AccountType.coordinator;
      default:
        return AccountType.student;
    }
  }
}
