import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:jobs_bd/core/static/urls.dart';
import 'package:jobs_bd/data/dummy_data_model/job_model.dart';

class GetJobsByCategoryRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Stream<List<JobModel>> getJobsByCategory(String category) => _firestore
          .collection(Urls.allJobs) // Replace with your actual collection name
          .where('category', isEqualTo: category)
          .snapshots()
          .map(
        (query) {
          return query.docs
              .map(
                (item) => JobModel.fromJson(item.data()),
              )
              .toList();
        },
      );
}
