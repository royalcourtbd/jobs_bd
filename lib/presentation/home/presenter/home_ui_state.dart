import 'package:jobs_bd/core/base/base_ui_state.dart';
import 'package:jobs_bd/data/dummy_data_model/job_category_model.dart';
import 'package:jobs_bd/data/dummy_data_model/job_model.dart';

class HomeUiState extends BaseUiState {
  const HomeUiState({
    required super.isLoading,
    required super.userMessage,
    required this.categoryList,
    required this.jobListByCategory,
    required this.allJobList,
    required this.todayPostsCount,
    required this.todayDeadlinesCount,
    required this.tomorrowDeadlinesCount,
  });

  factory HomeUiState.empty() {
    return const HomeUiState(
      isLoading: false,
      userMessage: '',
      categoryList: [],
      jobListByCategory: [],
      allJobList: [],
      todayPostsCount: 0,
      todayDeadlinesCount: 0,
      tomorrowDeadlinesCount: 0,
    );
  }

  @override
  List<Object?> get props => [
        isLoading,
        userMessage,
        categoryList,
        jobListByCategory,
        allJobList,
        todayPostsCount,
        todayDeadlinesCount,
        tomorrowDeadlinesCount,
      ];

  final List<JobCategoryModel> categoryList;
  final List<JobModel> allJobList;
  final List<JobModel> jobListByCategory;

  final int todayPostsCount;
  final int todayDeadlinesCount;
  final int tomorrowDeadlinesCount;

  HomeUiState copyWith({
    bool? isLoading,
    String? message,
    List<JobCategoryModel>? categoryList,
    List<JobModel>? jobListByCategory,
    List<JobModel>? allJobList,
    int? todayPostsCount,
    int? todayDeadlinesCount,
    int? tomorrowDeadlinesCount,
  }) {
    return HomeUiState(
      isLoading: isLoading ?? super.isLoading,
      userMessage: message ?? super.userMessage,
      categoryList: categoryList ?? this.categoryList,
      jobListByCategory: jobListByCategory ?? this.jobListByCategory,
      allJobList: allJobList ?? this.allJobList,
      todayPostsCount: todayPostsCount ?? this.todayPostsCount,
      todayDeadlinesCount: todayDeadlinesCount ?? this.todayDeadlinesCount,
      tomorrowDeadlinesCount:
          tomorrowDeadlinesCount ?? this.tomorrowDeadlinesCount,
    );
  }
}
