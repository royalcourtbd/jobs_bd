import 'package:jobs_bd/core/base/base_presenter.dart';
import 'package:jobs_bd/data/dummy_data_model/job_model.dart';
import 'package:jobs_bd/data/repository/get_all_jobs_repository.dart';
import 'package:jobs_bd/data/repository/get_jobs_by_category_repository.dart';
import 'package:jobs_bd/data/repository/increment_total_views_repository.dart';
import 'package:jobs_bd/data/service/cache_manager.dart';
import 'package:jobs_bd/presentation/home/presenter/home_ui_state.dart';

class HomePresenter extends BasePresenter<HomeUiState> {
  final Obs<HomeUiState> uiState = Obs(HomeUiState.empty());
  final CacheManager _cacheManager = CacheManager();

  HomeUiState get currentUiState => uiState.value;

  HomePresenter() {
    _fetchAllJobs();
  }

  void _fetchAllJobs() {
    toggleLoading(loading: true);
    if (_cacheManager.cachedAllJobList.isNotEmpty) {
      // Use cached data
      uiState.value =
          currentUiState.copyWith(allJobList: _cacheManager.cachedAllJobList);
      toggleLoading(loading: false);
    } else {
      // Fetch from Firebase and cache the data
      GetAllJobsRepository().getAllJobs().listen((jobList) {
        _cacheManager.cacheAllJobList(jobList);
        uiState.value = currentUiState.copyWith(allJobList: jobList);
        toggleLoading(loading: false);
      });
    }
  }

  void fetchJobListByCategory(String category) {
    toggleLoading(loading: true);
    GetJobsByCategoryRepository().getJobsByCategory(category).listen((jobList) {
      uiState.value = currentUiState.copyWith(jobListByCategory: jobList);
      toggleLoading(loading: false); // Ensure loading is set to false here
    });
  }

  void incrementViews(JobModel id) {
    IncrementTotalViewsRepository().incrementTotalViews(id);
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
