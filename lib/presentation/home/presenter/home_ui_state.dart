import 'package:jobs_bd/core/base/base_ui_state.dart';
import 'package:jobs_bd/data/dummy_data_model/ad_ids_model.dart';
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
    required this.isHomeBannerAdsLoaded,
    required this.isJobPageBannerAdsLoaded,
    required this.isInterstitialAdsLoaded,
    required this.adIdsList,
  });

  factory HomeUiState.empty() {
    return HomeUiState(
      isLoading: false,
      userMessage: '',
      categoryList: const [],
      jobListByCategory: const [],
      allJobList: const [],
      todayPostsCount: 0,
      todayDeadlinesCount: 0,
      tomorrowDeadlinesCount: 0,
      isHomeBannerAdsLoaded: false,
      isJobPageBannerAdsLoaded: false,
      isInterstitialAdsLoaded: false,
      adIdsList: AdIdsModel(
        banneradsId1: '',
        banneradsId2: '',
        intadsId1: '',
        intadsId2: '',
        videoAdsid: '',
      ),
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
        isHomeBannerAdsLoaded,
        isJobPageBannerAdsLoaded,
        isInterstitialAdsLoaded,
        adIdsList,
      ];

  final List<JobCategoryModel> categoryList;
  final List<JobModel> allJobList;
  final List<JobModel> jobListByCategory;
  final AdIdsModel adIdsList;
  final int todayPostsCount;
  final int todayDeadlinesCount;
  final int tomorrowDeadlinesCount;
  final bool isHomeBannerAdsLoaded;
  final bool isJobPageBannerAdsLoaded;
  final bool isInterstitialAdsLoaded;

  HomeUiState copyWith({
    bool? isLoading,
    String? message,
    List<JobCategoryModel>? categoryList,
    List<JobModel>? jobListByCategory,
    List<JobModel>? allJobList,
    int? todayPostsCount,
    int? todayDeadlinesCount,
    int? tomorrowDeadlinesCount,
    bool? isHomeBannerAdsLoaded,
    bool? isJobPageBannerAdsLoaded,
    bool? isInterstitialAdsLoaded,
    AdIdsModel? adIdsList,
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
      isHomeBannerAdsLoaded:
          isHomeBannerAdsLoaded ?? this.isHomeBannerAdsLoaded,
      isJobPageBannerAdsLoaded:
          isJobPageBannerAdsLoaded ?? this.isJobPageBannerAdsLoaded,
      isInterstitialAdsLoaded:
          isInterstitialAdsLoaded ?? this.isInterstitialAdsLoaded,
      adIdsList: adIdsList ?? this.adIdsList,
    );
  }
}
