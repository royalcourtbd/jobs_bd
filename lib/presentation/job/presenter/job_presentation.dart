import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:jobs_bd/data/dummy_data_model/job_model.dart';

class JobPresentation extends GetxController {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final allJobsList = RxList<JobModel>([]);
  int get jobLength => allJobsList.length;

  @override
  onInit() {
    super.onInit();
    allJobsList.bindStream(getAllJObs());
  }

  Stream<List<JobModel>> getAllJObs() =>
      firestore.collection('all_jobs').snapshots().map((snapshot) =>
          snapshot.docs.map((doc) => JobModel.fromJson(doc.data())).toList());
  Future<int> _getNextJobId() async {
    final docRef = firestore.collection('counters').doc('jobIdCounter');
    final doc = await docRef.get();

    if (doc.exists) {
      int currentId = doc.data()!['currentId'];
      await docRef.update({'currentId': currentId + 1});
      return currentId + 1;
    } else {
      // If the document does not exist, create it and return the initial id
      await docRef.set({'currentId': 1});
      return 1;
    }
  }

  job() async {
    final id = firestore.collection('all_jobs').doc().id;
    final docRef = firestore.collection('all_jobs').doc(id);

    final jobId = await _getNextJobId();

    JobModel newJob = JobModel(
      documentId: id,
      category: 'Government Job',
      companyName: 'Passport Office',
      deadLine: '2021-10-20',
      description: 'grg r erg er',
      imgUrl:
          'https://www.cdn.justshowbiz.net/wp-content/uploads/2015/04/Sunny-Leone.jpg?strip=all&lossy=1&ssl=1',
      jobId: jobId.toString(),
      jobTitle: 'Software Engineer',
      link: 'https://www.google.com/careers',
      location: 'Dhaka, Bangladesh',
      posted: DateTime.now().toString(),
      status: 'live',
      totalView: 54,
    );

    await docRef.set(newJob.toJson());
  }

  deleteJob(String id) async {
    await firestore.collection('all_jobs').doc(id).delete();
  }
}
