class Student {
  final int? id;
  final String name;
  final String email;
  final String registrationCourseNumber;

  Student({
    this.id,
    required this.name,
    required this.email,
    required this.registrationCourseNumber,
  });

  factory Student.fromJson(Map<String, dynamic> json) {
    return Student(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      registrationCourseNumber: json['registrationCourseNumber'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'registrationCourseNumber': registrationCourseNumber,
      'password': registrationCourseNumber,
    };
  }
}
