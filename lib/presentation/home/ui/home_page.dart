import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobs_bd/core/config/jobs_screen.dart';
import 'package:jobs_bd/core/external_libs/presentable_widget_builder.dart';
import 'package:jobs_bd/core/static/ui_const.dart';
import 'package:jobs_bd/core/utility/utility.dart';
import 'package:jobs_bd/data/dummy_data_model/job_category_model.dart';
import 'package:jobs_bd/data/dummy_data_model/job_count_model.dart';
import 'package:jobs_bd/presentation/home/presenter/home_presenter.dart';
import 'package:jobs_bd/presentation/home/widgets/job_list_item.dart';
import 'package:jobs_bd/presentation/job/presenter/job_presentation.dart';
import 'package:jobs_bd/presentation/job/ui/job_list_page.dart';
import 'package:jobs_bd/presentation/home/widgets/job_category_item.dart';
import 'package:jobs_bd/presentation/home/widgets/job_count_item.dart';
import 'package:jobs_bd/presentation/job/ui/job_view_page.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final JobPresentation jobPresentation = Get.put(JobPresentation());
  final HomePresenter homePresenter = Get.put(HomePresenter());

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return PresentableWidgetBuilder(
        presenter: homePresenter,
        builder: () {
          return Scaffold(
            appBar: AppBar(
              title: const Text(
                'Jobs BD',
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Get.find<JobPresentation>().job();
                  },
                  child: const Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                )
              ],
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: padding20,
                child: Column(
                  children: [
                    ListView.builder(
                      itemCount: jobCategoryList.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return JobCategoryItem(
                          theme: theme,
                          index: index,
                          onTap: () async {
                            homePresenter.fetchJobListByCategory(
                                jobCategoryList[index].jobTitle);
                            print(
                                'jobCategoryList[index].jobTitle: ${jobCategoryList[index].jobTitle}');
                            context.navigatorPush(
                              JobListPage(
                                title: jobCategoryList[index].jobTitle,
                              ),
                            );
                          },
                        );
                      },
                    ),
                    GridView.builder(
                      itemCount: jobCountList.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: tenPx,
                        mainAxisSpacing: tenPx,
                        childAspectRatio: 1 / .4,
                      ),
                      itemBuilder: (context, index) {
                        return JobCountItem(
                          theme: theme,
                          index: index,
                          onTap: () {
                            jobPresentation.job();
                          },
                        );
                      },
                    ),
                    gapH15,
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Latest Jobs',
                        style: theme.textTheme.bodyMedium!.copyWith(
                          color: theme.primaryColor,
                          fontSize: twentyFourPx,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    gapH10,
                    ListView.builder(
                      itemCount:
                          homePresenter.currentUiState.allJobList.length >= 10
                              ? 10
                              : homePresenter.currentUiState.allJobList.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            JobListItem(
                              theme: theme,
                              index: index,
                              onLongPress: () => jobPresentation.deleteJob(
                                  homePresenter.currentUiState.allJobList[index]
                                      .documentId!),
                              jobList: homePresenter.currentUiState.allJobList,
                              onTap: () => context.navigatorPush(
                                JobViewPage(
                                  index: index,
                                  jobList:
                                      homePresenter.currentUiState.allJobList,
                                ),
                              ),
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
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
