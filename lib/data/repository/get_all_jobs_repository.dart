import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:jobs_bd/core/static/urls.dart';
import 'package:jobs_bd/data/dummy_data_model/job_model.dart';

class GetAllJobsRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Stream<List<JobModel>> getAllJobs() {
    return _firestore.collection(Urls.allJobs).snapshots().map((snapshot) =>
        snapshot.docs.map((doc) => JobModel.fromJson(doc.data())).toList());
  }
}
