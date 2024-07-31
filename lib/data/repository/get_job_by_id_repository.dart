import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:jobs_bd/core/static/urls.dart';
import 'package:jobs_bd/data/dummy_data_model/job_model.dart';

class GetJobByIdRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<JobModel> getJobById(String jobId) async {
    try {
      DocumentSnapshot doc =
          await _firestore.collection(Urls.allJobs).doc(jobId).get();
      if (doc.exists) {
        return JobModel.fromJson(doc.data() as Map<String, dynamic>);
      } else {
        throw Exception('Job not found');
      }
    } catch (e) {
      throw Exception('Error fetching job: $e');
    }
  }
}
