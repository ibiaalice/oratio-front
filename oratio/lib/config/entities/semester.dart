class Semester {
  final int? id;
  final String year;
  final String semester;
  final DateTime start;
  final DateTime? end;
  final String? status;

  Semester({
    this.id,
    required this.year,
    required this.semester,
    required this.start,
    this.end,
    this.status,
  });

  factory Semester.fromJson(Map<String, dynamic> json) => Semester(
        id: json["id"],
        year: json["year"],
        semester: json["semester"],
        start: DateTime.parse(json["start"]),
        end: json['end'] != null ? DateTime.parse(json["end"]) : null,
        status: json["status"],
      );

  Semester copyWith({
    int? id,
    String? year,
    String? semester,
    DateTime? start,
    DateTime? end,
    String? status,
  }) {
    return Semester(
      id: id ?? this.id,
      year: year ?? this.year,
      semester: semester ?? this.semester,
      start: start ?? this.start,
      end: end ?? this.end,
      status: status ?? this.status,
    );
  }

  Map<String, dynamic> toJson() => {
        "year": year,
        "semester": semester,
        "start": start.toIso8601String(),
        "end": end?.toIso8601String(),
        "status": status,
      };
}
