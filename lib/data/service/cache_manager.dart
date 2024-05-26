import 'package:jobs_bd/data/dummy_data_model/job_model.dart';

class CacheManager {
  static final CacheManager _instance = CacheManager._internal();

  factory CacheManager() {
    return _instance;
  }

  CacheManager._internal();

  List<JobModel> _cachedAllJobList = [];
  List<JobModel> _cachedJobListByCategory = [];

  List<JobModel> get cachedAllJobList => _cachedAllJobList;
  List<JobModel> get cachedJobListByCategory => _cachedJobListByCategory;

  void cacheAllJobList(List<JobModel> allJobList) {
    _cachedAllJobList = allJobList;
  }

  void cacheJobListByCategory(List<JobModel> jobListByCategory) {
    _cachedJobListByCategory = jobListByCategory;
  }
}
