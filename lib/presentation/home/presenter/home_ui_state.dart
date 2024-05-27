import 'package:jobs_bd/core/base/base_ui_state.dart';
import 'package:jobs_bd/data/dummy_data_model/job_category_model.dart';
import 'package:jobs_bd/data/dummy_data_model/job_count_model.dart';
import 'package:jobs_bd/data/dummy_data_model/job_model.dart';

class HomeUiState extends BaseUiState {
  const HomeUiState({
    required super.isLoading,
    required super.userMessage,
    required this.categoryList,
    required this.jobListByCategory,
    required this.allJobList,
    required this.jobCounts,
  });

  factory HomeUiState.empty() {
    return const HomeUiState(
      isLoading: false,
      userMessage: '',
      categoryList: [],
      jobListByCategory: [],
      allJobList: [],
      jobCounts: [],
    );
  }

  @override
  List<Object?> get props => [
        isLoading,
        userMessage,
        categoryList,
        jobListByCategory,
        allJobList,
        jobCounts,
      ];

  final List<JobCategoryModel> categoryList;
  final List<JobModel> allJobList;
  final List<JobModel> jobListByCategory;
  final List<JobCountModel> jobCounts;

  HomeUiState copyWith({
    bool? isLoading,
    String? message,
    List<JobCategoryModel>? categoryList,
    List<JobModel>? jobListByCategory,
    List<JobModel>? allJobList,
    List<JobCountModel>? jobCounts,
  }) {
    return HomeUiState(
      isLoading: isLoading ?? super.isLoading,
      userMessage: message ?? super.userMessage,
      categoryList: categoryList ?? this.categoryList,
      jobListByCategory: jobListByCategory ?? this.jobListByCategory,
      allJobList: allJobList ?? this.allJobList,
      jobCounts: jobCounts ?? this.jobCounts,
    );
  }
}
