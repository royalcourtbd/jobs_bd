class JobModel {
  final String documentId;
  final String category;
  final String companyName;
  final String deadLine;
  final String description;
  final String imgUrl;
  final String jobId;
  final String jobTitle;
  final String link;
  final String location;
  final String posted;
  final String status;
  final int totalView;

  JobModel({
    required this.documentId,
    required this.category,
    required this.companyName,
    required this.deadLine,
    required this.description,
    required this.imgUrl,
    required this.jobId,
    required this.jobTitle,
    required this.link,
    required this.location,
    required this.posted,
    required this.status,
    required this.totalView,
  });

  factory JobModel.fromJson(Map<String, dynamic> json) {
    return JobModel(
      documentId: json['documentId'],
      category: json['category'],
      companyName: json['companyName'],
      deadLine: json['deadLine'],
      description: json['description'],
      imgUrl: json['imgUrl'],
      jobId: json['jobId'],
      jobTitle: json['jobTitle'],
      link: json['link'],
      location: json['location'],
      posted: json['posted'],
      status: json['status'],
      totalView: json['totalView'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'documentId': documentId,
      'category': category,
      'companyName': companyName,
      'deadLine': deadLine,
      'description': description,
      'imgUrl': imgUrl,
      'jobId': jobId,
      'jobTitle': jobTitle,
      'link': link,
      'location': location,
      'posted': posted,
      'status': status,
      'totalView': totalView,
    };
  }
}
