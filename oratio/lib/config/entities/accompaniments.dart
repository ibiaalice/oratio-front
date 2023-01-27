class Accompaniments {
  final int? id;
  final int studentId;
  final String? description;
  final String? link;
  final DateTime createdDate;

  Accompaniments({
    this.id,
    required this.studentId,
    required this.description,
    required this.link,
    required this.createdDate,
  });

  factory Accompaniments.fromJson(Map<String, dynamic> json) {
    return Accompaniments(
      id: json['id'],
      studentId: json['studentId'],
      description: json['description'],
      link: json['link'],
      createdDate: DateTime.parse(json['createdDate']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'studentId': studentId,
      'description': description,
      'link': link,
      'createdDate': createdDate.toIso8601String(),
    };
  }
}
