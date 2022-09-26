class Project {
  final int id;
  final String title;
  String? description;
  final String? link;
  final String status;
  final int studentId;
  final int? teacherId;
  final int? evaluatorId;
  final int? evaluator2Id;
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
    this.evaluator2Id,
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
        evaluator2Id: json["evaluator2Id"],
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
      "evaluator2Id": evaluator2Id,
      "avaliable": avaliable,
      "finalized": finalized,
    };
  }
}
