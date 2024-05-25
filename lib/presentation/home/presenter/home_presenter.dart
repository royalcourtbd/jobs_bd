import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:jobs_bd/core/base/base_presenter.dart';
import 'package:jobs_bd/data/dummy_data_model/job_model.dart';
import 'package:jobs_bd/presentation/home/presenter/home_ui_state.dart';

class HomePresenter extends BasePresenter<HomeUiState> {
  final Rx<HomeUiState> uiState = Rx(HomeUiState.empty());
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  HomeUiState get currentUiState => uiState.value;

  HomePresenter() {
    _fetchAllJobs();
  }

  void _fetchAllJobs() {
    toggleLoading(loading: true);
    getAllJobs().listen((jobList) {
      uiState.value = currentUiState.copyWith(allJobList: jobList);

      toggleLoading(loading: false);
    });
  }

  Stream<List<JobModel>> getAllJobs() {
    return _firestore.collection('all_jobs').snapshots().map((snapshot) =>
        snapshot.docs.map((doc) => JobModel.fromJson(doc.data())).toList());
  }

  Stream<List<JobModel>> getFeaturedProducts(String category) {
    return _firestore
        .collection('all_jobs')
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

  void fetchJobListByCategory(String category) {
    toggleLoading(loading: true);
    getFeaturedProducts(category).listen((jobList) {
      uiState.value = currentUiState.copyWith(jobListByCategory: jobList);
      toggleLoading(loading: false); // Ensure loading is set to false here
    });
  }

  @override
  Future<void> addUserMessage(String message) async {
    uiState.value = currentUiState.copyWith(message: message);
  }

  @override
  Future<void> toggleLoading({required bool loading}) async {
    uiState.value = currentUiState.copyWith(isLoading: loading);
  }
}
