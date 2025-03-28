import 'package:flutter/material.dart';
import 'package:jobs_bd/core/config/jobs_screen.dart';
import 'package:jobs_bd/core/utility/utility.dart';
import 'package:jobs_bd/presentation/home/presenter/home_presenter.dart';
import 'package:jobs_bd/presentation/home/widgets/job_count_item.dart';
import 'package:jobs_bd/presentation/job/ui/job_list_page.dart';

class JobCountSecion extends StatelessWidget {
  const JobCountSecion({
    super.key,
    required this.theme,
    required this.homePresenter,
  });

  final ThemeData theme;
  final HomePresenter homePresenter;

  @override
  Widget build(BuildContext context) {
    return GridView(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: tenPx,
        mainAxisSpacing: tenPx,
        childAspectRatio: 1 / .4,
      ),
      children: [
        JobCountItem(
          title: 'Live Jobs',
          theme: theme,
          jobCount: homePresenter.currentUiState.allJobList.length,
          onTap: () {
            homePresenter.fetchJobListByCategory('Live Jobs');
            context.navigatorPush(JobListPage(title: 'Live Jobs'));
          },
        ),
        JobCountItem(
          title: 'Today\'s Posts',
          theme: theme,
          jobCount: homePresenter.currentUiState.todayPostsCount,
          onTap: () {
            homePresenter.fetchJobListByCategory('Today\'s Posts');
            context.navigatorPush(JobListPage(title: 'Today\'s Posts'));
          },
        ),
        JobCountItem(
          theme: theme,
          jobCount: homePresenter.currentUiState.todayDeadlinesCount,
          title: 'Today\'s Deadlines',
          onTap: () {
            homePresenter.fetchJobListByCategory('Today\'s Deadlines');
            context.navigatorPush(JobListPage(title: 'Today\'s Deadlines'));
          },
        ),
        JobCountItem(
          theme: theme,
          title: 'Tomorrow\'s Deadlines',
          jobCount: homePresenter.currentUiState.tomorrowDeadlinesCount,
          onTap: () {
            homePresenter.fetchJobListByCategory('Tomorrow\'s Deadlines');
            context.navigatorPush(JobListPage(title: 'Tomorrow\'s Deadlines'));
          },
        ),
      ],
    );
  }
}
