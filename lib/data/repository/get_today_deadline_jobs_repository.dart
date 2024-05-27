import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:jobs_bd/data/dummy_data_model/job_model.dart';

class GetTodayDeadlineJobsRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Stream<List<JobModel>> getTodayDeadlineJobs() {
    return _firestore
        .collection('all_jobs')
        .where('jobDeadLine', isGreaterThan: DateTime.now().toString())
        .snapshots()
        .map((snapshot) =>
            snapshot.docs.map((doc) => JobModel.fromJson(doc.data())).toList());
  }
}
