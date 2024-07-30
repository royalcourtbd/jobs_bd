import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:jobs_bd/core/base/base_presenter.dart';
import 'package:jobs_bd/data/dummy_data_model/job_category_model.dart';
import 'package:jobs_bd/data/dummy_data_model/job_model.dart';
import 'package:jobs_bd/data/repository/device_info_repository.dart';
import 'package:jobs_bd/data/repository/get_all_jobs_repository.dart';
import 'package:jobs_bd/data/repository/get_jobs_by_category_repository.dart';
import 'package:jobs_bd/data/repository/google_ads_repository.dart';
import 'package:jobs_bd/data/repository/increment_total_views_repository.dart';
import 'package:jobs_bd/data/service/cache_manager.dart';
import 'package:jobs_bd/data/service/device_info_service.dart';
import 'package:jobs_bd/presentation/home/presenter/home_ui_state.dart';

class HomePresenter extends BasePresenter<HomeUiState> {
  final Obs<HomeUiState> uiState = Obs(HomeUiState.empty());
  HomeUiState get currentUiState => uiState.value;
  final CacheManager _cacheManager = CacheManager();
  final DeviceInfoService _deviceInfoService = DeviceInfoService();
  final DeviceInfoRepository _deviceInfoRepository = DeviceInfoRepository();
  final GoogleAdsRepository _googleAdsRepository = GoogleAdsRepository();

  String? selectedCategory;

  late InterstitialAd interstitialAd;
  late BannerAd homeBannerAd;
  late BannerAd jobBannerAd;
  final List<JobCategoryModel> _categoryList = jobCategoryList;

  @override
  onInit() {
    super.onInit();
    _fetchAllJobs();
    fetchCategoryCount();
    _storeDeviceInfo();
    getHomePageBannerAds();
    getJobListPagebannerAds();
    interstitialAdLoad();
    listenForAdsUnitIds();
  }

  void listenForAdsUnitIds() {
    _googleAdsRepository.fetchAdsUnitIds().listen((googleAdsModel) {
      uiState.value = currentUiState.copyWith(googleAdsModel: googleAdsModel);
      if (googleAdsModel.isValid()) {
        getHomePageBannerAds();
        getJobListPagebannerAds();
        interstitialAdLoad();
      }
    }, onError: (e) {});
  }

  void getHomePageBannerAds() {
    if (currentUiState.googleAdsModel.banner1?.isNotEmpty != true) return;
    homeBannerAd = BannerAd(
      adUnitId: currentUiState.googleAdsModel.banner1!,
      size: AdSize.banner,
      request: const AdRequest(),
      listener: BannerAdListener(
        onAdLoaded: (Ad ad) {
          uiState.value = currentUiState.copyWith(isHomeBannerAdsLoaded: true);
        },
        onAdFailedToLoad: (Ad ad, LoadAdError error) {
          ad.dispose();
          getHomePageBannerAds();
          homeBannerAd.load();
        },
        onAdOpened: (Ad ad) {
          // homeBannerAd.load();
        },
        onAdClosed: (Ad ad) {
          homeBannerAd.load();
        },
        onAdImpression: (Ad ad) {
          // homeBannerAd.load();
        },
        onAdClicked: (Ad ad) {
          homeBannerAd.load();
        },
      ),
    );
    homeBannerAd.load();
  }

  void getJobListPagebannerAds() {
    if (currentUiState.googleAdsModel.banner2?.isNotEmpty != true) return;
    jobBannerAd = BannerAd(
      adUnitId: currentUiState.googleAdsModel.banner2!,
      size: AdSize.banner,
      request: const AdRequest(),
      listener: BannerAdListener(
        onAdLoaded: (Ad ad) {
          uiState.value =
              currentUiState.copyWith(isJobPageBannerAdsLoaded: true);
        },
        onAdFailedToLoad: (Ad ad, LoadAdError error) {
          ad.dispose();
          getJobListPagebannerAds();
          jobBannerAd.load();
        },
        onAdOpened: (Ad ad) {
          // jobBannerAd.load();
        },
        onAdClosed: (Ad ad) {
          jobBannerAd.load();
        },
        onAdImpression: (Ad ad) {
          // jobBannerAd.load();
        },
        onAdClicked: (Ad ad) {
          jobBannerAd.load();
        },
      ),
    );
    jobBannerAd.load();
  }

  void interstitialAdLoad() {
    if (currentUiState.googleAdsModel.interstitial1?.isNotEmpty != true) return;
    InterstitialAd.load(
      adUnitId: currentUiState.googleAdsModel.interstitial1!,
      request: const AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: onAdLoaded,
        onAdFailedToLoad: (LoadAdError error) {
          interstitialAdLoad();
        },
      ),
    );
  }

  void onAdLoaded(InterstitialAd ad) {
    interstitialAd = ad;
    uiState.value = currentUiState.copyWith(isInterstitialAdsLoaded: true);
    interstitialAd.fullScreenContentCallback = FullScreenContentCallback(
      onAdDismissedFullScreenContent: (InterstitialAd ad) {
        ad.dispose();
        interstitialAd.dispose();
        interstitialAdLoad();
      },
      onAdFailedToShowFullScreenContent: (InterstitialAd ad, AdError error) {
        ad.dispose();
        interstitialAd.dispose();
        uiState.value = currentUiState.copyWith(isInterstitialAdsLoaded: false);
        interstitialAdLoad();
      },
      onAdShowedFullScreenContent: (InterstitialAd ad) {},
    );
  }

  void _storeDeviceInfo() async {
    final deviceInfo = await _deviceInfoService.getDeviceInfo();
    await _deviceInfoRepository.saveDeviceInfo(deviceInfo);
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
    selectedCategory = category;

    if (category == 'Live Jobs' ||
        category == 'Today\'s Posts' ||
        category == 'Today\'s Deadlines' ||
        category == 'Tomorrow\'s Deadlines') {
      List<JobModel> filteredJobList;

      switch (category) {
        case 'Live Jobs':
          filteredJobList = _cacheManager.cachedAllJobList;
          break;
        case 'Today\'s Posts':
          filteredJobList = _cacheManager.cachedAllJobList.where((job) {
            final today = DateTime.now();
            final jobPosted = DateTime.parse(job.posted!);
            return jobPosted.year == today.year &&
                jobPosted.month == today.month &&
                jobPosted.day == today.day;
          }).toList();
          break;
        case 'Today\'s Deadlines':
          filteredJobList = _cacheManager.cachedAllJobList.where((job) {
            final today = DateTime.now();
            final jobDeadLine = DateTime.parse(job.jobDeadLine!);
            return jobDeadLine.year == today.year &&
                jobDeadLine.month == today.month &&
                jobDeadLine.day == today.day;
          }).toList();
          break;
        case 'Tomorrow\'s Deadlines':
          filteredJobList = _cacheManager.cachedAllJobList.where((job) {
            final tomorrow = DateTime.now().add(const Duration(days: 1));
            final jobDeadLine = DateTime.parse(job.jobDeadLine!);
            return jobDeadLine.year == tomorrow.year &&
                jobDeadLine.month == tomorrow.month &&
                jobDeadLine.day == tomorrow.day;
          }).toList();
          break;
        default:
          filteredJobList = [];
      }

      uiState.value =
          currentUiState.copyWith(jobListByCategory: filteredJobList);
      toggleLoading(loading: false);
    } else {
      GetJobsByCategoryRepository()
          .getJobsByCategory(category)
          .listen((jobList) {
        uiState.value = currentUiState.copyWith(jobListByCategory: jobList);
        toggleLoading(loading: false); // Ensure loading is set to false here
      });
    }
  }

  void refreshJobList() {
    if (selectedCategory != null) {
      fetchJobListByCategory(selectedCategory!);
    }
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
