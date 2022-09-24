class Teacher {
  final int id;
  final String name;
  final String email;

  Teacher({
    required this.id,
    required this.name,
    required this.email,
  });

  factory Teacher.fromJson(Map<String, dynamic> json) {
    return Teacher(
      id: json['id'],
      name: json['name'],
      email: json['email'],
    );
  }
}
