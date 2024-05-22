import 'package:jobs_bd/core/static/svg_path.dart';

class JobListModel {
  final int id;
  final String jobTitle;
  final String companyName;
  final String location;
  final double salary;
  final String applicationStart;
  final String applicationEnd;
  final String imageUrl;
  final int viewPost;
  final String status;
  final int? vacancies; // Add vacancies property as optional
  final String jobDescription; // Add jobDescription property
  final String source; // Add source property

  JobListModel({
    required this.id,
    required this.jobTitle,
    required this.companyName,
    required this.location,
    required this.salary,
    required this.applicationStart,
    required this.applicationEnd,
    required this.imageUrl,
    required this.viewPost,
    required this.status,
    this.vacancies, // Make vacancies optional
    required this.jobDescription, // Initialize jobDescription
    required this.source, // Initialize source
  });
}

final List<JobListModel> jobList = [
  JobListModel(
    id: 1,
    jobTitle: '𝐄𝐱𝐩𝐞𝐫𝐢𝐞𝐧𝐜𝐞𝐝 𝐅𝐥𝐮𝐭𝐭𝐞𝐫 𝐃𝐞𝐯𝐞𝐥𝐨𝐩𝐞𝐫',
    companyName: '𝐙-𝐄𝐢𝐠𝐡𝐭 𝐓𝐞𝐜𝐡',
    location: '1332/B, Jahan Mansion,O.R Nizam Road, G.E.C, Chattogram',
    salary: 100000,
    applicationStart: '2024-05-22',
    applicationEnd: '2024-05-30',
    imageUrl:
        'assets/images/png/441521858_882243657250486_4665942175964594603_n.jpg',
    viewPost: 100,
    status: 'Live',
    // Add vacancies for this job
    jobDescription: 'Develop and maintain software applications.',
    source: 'Facebook',
  ),
  JobListModel(
    id: 2,
    jobTitle: 'Software Engineer',
    companyName: 'Facebook',
    location: 'Dhaka',
    salary: 100000,
    applicationStart: '2021-10-10',
    applicationEnd: '2021-10-20',
    imageUrl: SvgPath.icGovtLogo,
    viewPost: 100,
    status: 'Live',
    vacancies: 3, // Add vacancies for this job
    jobDescription: 'Design and build advanced applications.',
    source: 'Indeed',
  ),
  JobListModel(
    id: 3,
    jobTitle: 'Software Engineer',
    companyName: 'Amazon',
    location: 'Dhaka',
    salary: 100000,
    applicationStart: '2021-10-10',
    applicationEnd: '2021-10-20',
    imageUrl: SvgPath.icGovtLogo,
    viewPost: 100,
    status: 'Live',
    jobDescription: 'Work on large-scale distributed systems.',
    source: 'Glassdoor',
  ),
  JobListModel(
    id: 4,
    jobTitle: 'Software Engineer',
    companyName: 'Microsoft',
    location: 'Dhaka',
    salary: 100000,
    applicationStart: '2021-10-10',
    applicationEnd: '2021-10-20',
    imageUrl: SvgPath.icGovtLogo,
    viewPost: 100,
    status: 'Live',
    vacancies: 10, // Add vacancies for this job
    jobDescription: 'Develop software solutions for enterprise clients.',
    source: 'Microsoft Careers',
  ),
  JobListModel(
    id: 5,
    jobTitle: 'Software Engineer',
    companyName: 'Apple',
    location: 'Dhaka',
    salary: 100000,
    applicationStart: '2021-10-10',
    applicationEnd: '2021-10-20',
    imageUrl: SvgPath.icGovtLogo,
    viewPost: 100,
    status: 'Live',
    jobDescription: 'Innovate and implement new technologies.',
    source: 'Apple Jobs',
  ),
  JobListModel(
    id: 6,
    jobTitle: 'Software Engineer',
    companyName: 'Google',
    location: 'Dhaka',
    salary: 100000,
    applicationStart: '2021-10-10',
    applicationEnd: '2021-10-20',
    imageUrl: SvgPath.icGovtLogo,
    viewPost: 100,
    status: 'Live',
    jobDescription: 'Create scalable web applications.',
    source: 'Google Careers',
  ),
  JobListModel(
    id: 7,
    jobTitle: 'Software Engineer',
    companyName: 'Google',
    location: 'Dhaka',
    salary: 100000,
    applicationStart: '2021-10-10',
    applicationEnd: '2021-10-20',
    imageUrl: SvgPath.icGovtLogo,
    viewPost: 100,
    status: 'Live',
    jobDescription: 'Maintain and upgrade existing systems.',
    source: 'LinkedIn',
  ),
  JobListModel(
    id: 8,
    jobTitle: 'Software Engineer',
    companyName: 'Facebook',
    location: 'Dhaka',
    salary: 100000,
    applicationStart: '2021-10-10',
    applicationEnd: '2021-10-20',
    imageUrl: SvgPath.icGovtLogo,
    viewPost: 100,
    status: 'Live',
    jobDescription: 'Collaborate with cross-functional teams.',
    source: 'Indeed',
  ),
  JobListModel(
    id: 9,
    jobTitle: 'Software Engineer',
    companyName: 'Amazon',
    location: 'Dhaka',
    salary: 100000,
    applicationStart: '2021-10-10',
    applicationEnd: '2021-10-20',
    imageUrl: SvgPath.icGovtLogo,
    viewPost: 100,
    status: 'Live',
    jobDescription: 'Implement new features and enhancements.',
    source: 'Glassdoor',
  ),
  JobListModel(
    id: 10,
    jobTitle: 'Software Engineer',
    companyName: 'Microsoft',
    location: 'Dhaka',
    salary: 100000,
    applicationStart: '2021-10-10',
    applicationEnd: '2021-10-20',
    imageUrl: SvgPath.icGovtLogo,
    viewPost: 100,
    status: 'Live',
    jobDescription: 'Optimize software for performance.',
    source: 'Microsoft Careers',
  ),
  JobListModel(
    id: 11,
    jobTitle: 'Software Engineer',
    companyName: 'Apple',
    location: 'Dhaka',
    salary: 100000,
    applicationStart: '2021-10-10',
    applicationEnd: '2021-10-20',
    imageUrl: SvgPath.icGovtLogo,
    viewPost: 100,
    status: 'Live',
    jobDescription: 'Participate in code reviews.',
    source: 'Apple Jobs',
  ),
  JobListModel(
    id: 12,
    jobTitle: 'Software Engineer',
    companyName: 'Google',
    location: 'Dhaka',
    salary: 100000,
    applicationStart: '2021-10-10',
    applicationEnd: '2021-10-20',
    imageUrl: SvgPath.icGovtLogo,
    viewPost: 100,
    status: 'Live',
    jobDescription: 'Ensure software quality and reliability.',
    source: 'Google Careers',
  ),
];
