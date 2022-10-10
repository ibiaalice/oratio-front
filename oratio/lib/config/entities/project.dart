class Project {
  final int id;
  final String title;
  String? description;
  final String? link;
  final String status;
  final int studentId;
  final int? teacherId;
  final int? evaluatorId;
  final int? evaluatorId2;
  final bool avaliable;
  final bool finalized;

  Project({
    required this.id,
    required this.title,
    this.description,
    this.link,
    required this.status,
    required this.studentId,
    this.teacherId,
    this.evaluatorId,
    this.evaluatorId2,
    required this.avaliable,
    required this.finalized,
  });

  factory Project.fromJson(Map<String, dynamic> json) => Project(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        link: json["link"],
        status: json["status"],
        studentId: json["studentId"],
        teacherId: json["teacherId"],
        evaluatorId: json["evaluatorId"],
        evaluatorId2: json["evaluator2Id"],
        avaliable: json["avaliable"] ?? false,
        finalized: json["finalized"] ?? false,
      );

  Map toJson() {
    return {
      "id": id,
      "title": title,
      "description": description,
      "link": link,
      "status": status,
      "studentId": studentId,
      "teacherId": teacherId,
      "evaluatorId": evaluatorId,
      "evaluatorId2": evaluatorId2,
      "avaliable": avaliable,
      "finalized": finalized,
    };
  }
}
