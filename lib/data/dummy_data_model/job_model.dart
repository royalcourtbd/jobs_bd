class JobModel {
  final String? documentId;
  final String? category;
  final String? companyName;
  final String? jobDeadLine;
  final String? jobDescription;
  final String? imgUrl;
  final String? jobId;
  final String? jobTitle;
  final String? link;
  final String? location;
  final String? posted;
  final String? status;
  final int? totalView;
  final String? salaryRange;
  final int? vacancy;
  final String? experience;
  final String? officeTime;
  final String? weekend;

  JobModel({
    this.documentId,
    this.category,
    this.companyName,
    this.jobDeadLine,
    this.jobDescription,
    this.imgUrl,
    this.jobId,
    this.jobTitle,
    this.link,
    this.location,
    this.posted,
    this.status,
    this.totalView,
    this.salaryRange,
    this.vacancy,
    this.experience,
    this.officeTime,
    this.weekend,
  });

  factory JobModel.fromJson(Map<String, dynamic> json) {
    return JobModel(
      documentId: json['documentId'],
      category: json['category'],
      companyName: json['companyName'],
      jobDeadLine: json['jobDeadLine'],
      jobDescription: json['jobDescription'],
      imgUrl: json['imgUrl'],
      jobId: json['jobId'],
      jobTitle: json['jobTitle'],
      link: json['link'],
      location: json['location'],
      posted: json['posted'],
      status: json['status'],
      totalView: json['totalView'],
      salaryRange: json['salaryRange'],
      vacancy: json['vacancy'],
      experience: json['experience'],
      officeTime: json['officeTime'],
      weekend: json['weekend'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'documentId': documentId,
      'category': category,
      'companyName': companyName,
      'jobDeadLine': jobDeadLine,
      'jobDescription': jobDescription,
      'imgUrl': imgUrl,
      'jobId': jobId,
      'jobTitle': jobTitle,
      'link': link,
      'location': location,
      'posted': posted,
      'status': status,
      'totalView': totalView,
      'salaryRange': salaryRange,
      'vacancy': vacancy,
      'experience': experience,
      'officeTime': officeTime,
      'weekend': weekend,
    };
  }
}
