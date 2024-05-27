import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:jobs_bd/data/dummy_data_model/job_model.dart';

class GetTomorrowDeadlineJobsRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Stream<List<JobModel>> getTomorrowDeadlineJobs() {
    return _firestore
        .collection('all_jobs')
        .where('jobDeadLine',
            isLessThan: DateTime.now().add(const Duration(days: 1)).toString())
        .snapshots()
        .map((snapshot) =>
            snapshot.docs.map((doc) => JobModel.fromJson(doc.data())).toList());
  }
}
