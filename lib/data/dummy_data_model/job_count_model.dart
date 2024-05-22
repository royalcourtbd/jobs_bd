class JobCountModel {
  final String jobTitle;
  final int jobCount;

  JobCountModel({required this.jobTitle, required this.jobCount});
}

final List<JobCountModel> jobCountList = [
  JobCountModel(jobTitle: 'Live Jobs', jobCount: 100),
  JobCountModel(jobTitle: 'Posted Today', jobCount: 50),
  JobCountModel(jobTitle: 'Deadline Today', jobCount: 30),
  JobCountModel(jobTitle: 'Deadline Tomorrow', jobCount: 20),
];
