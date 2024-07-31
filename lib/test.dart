import 'package:flutter/material.dart';
import 'package:jobs_bd/data/dummy_data_model/job_model.dart';
import 'package:jobs_bd/data/repository/get_job_by_id_repository.dart';

class TestPage extends StatelessWidget {
  final int? index;
  final List<JobModel>? jobList;
  final String? jobId;

  const TestPage({
    super.key,
    this.index,
    this.jobList,
    this.jobId,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<JobModel>(
      future: _getJob(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
              body: Center(child: CircularProgressIndicator()));
        } else if (snapshot.hasError) {
          return Scaffold(
              body: Center(child: Text('Error: ${snapshot.error}')));
        } else if (!snapshot.hasData) {
          return const Scaffold(body: Center(child: Text('No job data found')));
        }

        final job = snapshot.data!;

        return Scaffold(
          appBar: AppBar(
            title: Text(job.jobTitle ?? ''),
          ),
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Company: ${job.companyName ?? ''}',
                    style: Theme.of(context).textTheme.titleLarge),
                const SizedBox(height: 8),
                Text('Location: ${job.location ?? ''}'),
                const SizedBox(height: 8),
                Text('Deadline: ${job.jobDeadLine ?? ''}'),
                const SizedBox(height: 16),
                Text('Job Description:',
                    style: Theme.of(context).textTheme.titleMedium),
                const SizedBox(height: 8),
                Text(job.jobDescription ?? ''),
              ],
            ),
          ),
        );
      },
    );
  }

  Future<JobModel> _getJob() async {
    if (jobId != null) {
      // Fetch job by ID
      return await GetJobByIdRepository().getJobById(jobId!);
    } else if (index != null && jobList != null) {
      // Use the job from the list
      return jobList![index!];
    } else {
      throw Exception('No job data provided');
    }
  }
}
