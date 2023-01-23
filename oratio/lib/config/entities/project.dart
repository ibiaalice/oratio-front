class Project {
  final int? id;
  final String title;
  String? description;
  final String? link;
  final String? status;
  final int studentId;
  final int? teacherId;
  final int? evaluatorId;
  final int? evaluatorId2;
  final bool? avaliable;
  final bool? finalized;

  Project({
    this.id,
    required this.title,
    this.description,
    this.link,
    this.status,
    required this.studentId,
    this.teacherId,
    this.evaluatorId,
    this.evaluatorId2,
    this.avaliable,
    this.finalized,
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
        evaluatorId2: json["evaluatorId2"],
        avaliable: json["avaliable"] ?? false,
        finalized: json["finalized"] ?? false,
      );

  Map toJson() {
    return {
      if (id != null) "id": id,
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
