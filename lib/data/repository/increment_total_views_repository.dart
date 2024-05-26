import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:jobs_bd/data/dummy_data_model/job_model.dart';

class IncrementTotalViewsRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> incrementTotalViews(JobModel job) async {
    final DocumentReference jobRef =
        _firestore.collection('all_jobs').doc(job.documentId);

    await jobRef.update({
      'totalView': FieldValue.increment(1),
    });
  }
}
