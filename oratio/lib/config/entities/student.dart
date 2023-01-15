class Student {
  final int? id;
  final String name;
  final String email;
  final int? semester;
  final String registrationCourseNumber;

  Student({
    this.id,
    required this.name,
    required this.email,
    required this.semester,
    required this.registrationCourseNumber,
  });

  factory Student.fromJson(Map<String, dynamic> json) {
    return Student(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      semester: json['semester'],
      registrationCourseNumber: json['registrationCourseNumber'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'registrationCourseNumber': registrationCourseNumber,
      'password': registrationCourseNumber,
      'semester': semester,
    };
  }
}
