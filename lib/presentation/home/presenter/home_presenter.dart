import 'package:jobs_bd/core/base/base_presenter.dart';
import 'package:jobs_bd/data/dummy_data_model/job_category_model.dart';
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
  final List<JobCategoryModel> _categoryList = jobCategoryList;

  @override
  onInit() {
    super.onInit();
    _fetchAllJobs();
    fetchCategoryCount();
  }

  void _fetchAllJobs() {
    toggleLoading(loading: true);
    if (_cacheManager.cachedAllJobList.isNotEmpty) {
      uiState.value =
          currentUiState.copyWith(allJobList: _cacheManager.cachedAllJobList);
      toggleLoading(loading: false);
      fetchJobCounts();
    } else {
      // Fetch from Firebase and cache the data
      GetAllJobsRepository().getAllJobs().listen((jobList) {
        _cacheManager.cacheAllJobList(jobList);
        uiState.value = currentUiState.copyWith(allJobList: jobList);
        fetchCategoryCount();
        fetchJobCounts();

        toggleLoading(loading: false);
      });
    }
  }

  void fetchJobCounts() {
    fetchTodayPostsCount();
    fetchTodayDeadlinesCount();
    fetchTomorrowDeadlinesCount();
  }

  void fetchTodayPostsCount() {
    final today = DateTime.now();
    int count = currentUiState.allJobList.where((job) {
      // Parse the DateTime string from Firebase
      DateTime jobPosted = DateTime.parse(job.posted!);
      // Compare if the posted date is on the same day as today
      return jobPosted.year == today.year &&
          jobPosted.month == today.month &&
          jobPosted.day == today.day;
    }).length;

    uiState.value = currentUiState.copyWith(todayPostsCount: count);
  }

  void fetchTodayDeadlinesCount() {
    final today = DateTime.now();

    int count = currentUiState.allJobList.where((job) {
      if (job.jobDeadLine == null) return false;
      try {
        DateTime deadline = DateTime.parse(job.jobDeadLine!);
        return deadline.year == today.year &&
            deadline.month == today.month &&
            deadline.day == today.day;
      } catch (e) {
        // Handle parsing errors, e.g., invalid date format

        return false;
      }
    }).length;

    uiState.value = currentUiState.copyWith(todayDeadlinesCount: count);
  }

  void fetchTomorrowDeadlinesCount() {
    final tomorrow = DateTime.now().add(const Duration(days: 1));

    int count = currentUiState.allJobList.where((job) {
      if (job.jobDeadLine == null) return false;
      try {
        DateTime deadline = DateTime.parse(job.jobDeadLine!);
        return deadline.year == tomorrow.year &&
            deadline.month == tomorrow.month &&
            deadline.day == tomorrow.day;
      } catch (e) {
        // Handle parsing errors, e.g., invalid date format

        return false;
      }
    }).length;

    uiState.value = currentUiState.copyWith(tomorrowDeadlinesCount: count);
  }

  void fetchJobListByCategory(String category) {
    toggleLoading(loading: true);
    GetJobsByCategoryRepository().getJobsByCategory(category).listen((jobList) {
      uiState.value = currentUiState.copyWith(jobListByCategory: jobList);
      toggleLoading(loading: false); // Ensure loading is set to false here
    });
  }

  void fetchCategoryCount() {
    for (var category in _categoryList) {
      int categoryCount = _getCategoryCount(category.jobTitle);
      category.totalJobs = categoryCount;
    }
    uiState.value = currentUiState.copyWith(categoryList: _categoryList);
  }

  int _getCategoryCount(String categoryName) {
    return _cacheManager.cachedAllJobList
        .where((job) => job.category == categoryName)
        .toList()
        .length;
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
