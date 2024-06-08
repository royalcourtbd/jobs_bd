import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobs_bd/core/config/jobs_screen.dart';
import 'package:jobs_bd/core/static/svg_path.dart';
import 'package:jobs_bd/core/static/ui_const.dart';
import 'package:jobs_bd/core/utility/utility.dart';
import 'package:jobs_bd/presentation/home/widgets/job_list_item.dart';
import 'package:jobs_bd/presentation/job/ui/job_view_page.dart';
import 'package:jobs_bd/presentation/home/presenter/home_presenter.dart';

class JobListPage extends StatelessWidget {
  final HomePresenter homePresenter = Get.put(HomePresenter());

  JobListPage({
    super.key,
    this.title,
  });

  final String? title;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        title: Text(
          title ?? 'Jobs BD',
        ),
      ),
      body: Padding(
        padding: padding20,
        child: Obx(() {
          if (homePresenter.currentUiState.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          final jobList = homePresenter.currentUiState.jobListByCategory;

          if (jobList.isEmpty) {
            return Center(
              child: Image.asset(
                SvgPath.icNotFount,
                width: JobsScreen.width * .5,
              ),
            );
          }

          return ListView.builder(
            itemCount: jobList.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  JobListItem(
                    theme: theme,
                    index: index,
                    jobList: jobList,
                    onTap: () {
                      homePresenter.incrementViews(jobList[index]);
                      context.navigatorPush(
                        JobViewPage(index: index, jobList: jobList),
                      );
                    },
                  ),
                  if ((index + 1) % 5 == 0) ...[
                    Container(
                      height: 50,
                      width: JobsScreen.width,
                      color: Colors.redAccent,
                    ),
                    gapH10,
                  ],
                ],
              );
            },
          );
        }),
      ),
    );
  }
}
