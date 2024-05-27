import 'package:jobs_bd/core/static/svg_path.dart';

class JobCategoryModel {
  final String id;
  final String jobTitle;
  final String imgPath;
  int totalJobs;

  JobCategoryModel({
    required this.id,
    required this.jobTitle,
    required this.imgPath,
    required this.totalJobs,
  });

  JobCategoryModel copyWith({
    String? id,
    String? jobTitle,
    String? imgPath,
    int? totalJobs,
  }) {
    return JobCategoryModel(
      id: id ?? this.id,
      jobTitle: jobTitle ?? this.jobTitle,
      imgPath: imgPath ?? this.imgPath,
      totalJobs: totalJobs ?? this.totalJobs,
    );
  }
}

List<JobCategoryModel> jobCategoryList = [
  JobCategoryModel(
    id: '1',
    jobTitle: 'Government Jobs',
    imgPath: SvgPath.icGovtLogo,
    totalJobs:
        0, // Initially set to 0, will be updated when the app initializes
  ),
  JobCategoryModel(
    id: '2',
    jobTitle: 'IT Sector Jobs',
    imgPath: SvgPath.icItJobLogo,
    totalJobs:
        0, // Initially set to 0, will be updated when the app initializes
  ),
  JobCategoryModel(
    id: '3',
    jobTitle: 'Private Jobs',
    imgPath: SvgPath.icPrivateJobLogo,
    totalJobs:
        0, // Initially set to 0, will be updated when the app initializes
  ),
];
