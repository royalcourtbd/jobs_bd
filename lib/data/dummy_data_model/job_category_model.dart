import 'package:jobs_bd/core/static/svg_path.dart';

class JobCategoryModel {
  final String id;
  final String jobTitle;
  final String imgPath;
  final int totalJobs;

  JobCategoryModel({
    required this.id,
    required this.jobTitle,
    required this.imgPath,
    required this.totalJobs,
  });
}

List<JobCategoryModel> jobCategoryList = [
  JobCategoryModel(
    id: '1',
    jobTitle: 'Government Jobs',
    imgPath: SvgPath.icGovtLogo,
    totalJobs: 318,
  ),
  JobCategoryModel(
    id: '2',
    jobTitle: 'IT Sector Jobs',
    imgPath: SvgPath.icItJobLogo,
    totalJobs: 548,
  ),
  JobCategoryModel(
    id: '3',
    jobTitle: 'Private Jobs',
    imgPath: SvgPath.icPrivateJobLogo,
    totalJobs: 453,
  ),
];
