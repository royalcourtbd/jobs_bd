import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:jobs_bd/core/config/jobs_screen.dart';
import 'package:jobs_bd/core/external_libs/presentable_widget_builder.dart';
import 'package:jobs_bd/core/static/ui_const.dart';
import 'package:jobs_bd/core/utility/utility.dart';
import 'package:jobs_bd/data/dummy_data_model/job_category_model.dart';
import 'package:jobs_bd/presentation/home/presenter/home_presenter.dart';
import 'package:jobs_bd/presentation/home/widgets/double_back_to_exit_app.dart';
import 'package:jobs_bd/presentation/home/widgets/job_count_section.dart';
import 'package:jobs_bd/presentation/home/widgets/job_list_item.dart';
import 'package:jobs_bd/presentation/home/widgets/mini_setting_drawer.dart';
import 'package:jobs_bd/presentation/job/presenter/job_presentation.dart';
import 'package:jobs_bd/presentation/job/ui/job_list_page.dart';
import 'package:jobs_bd/presentation/home/widgets/job_category_item.dart';
import 'package:jobs_bd/presentation/job/ui/job_view_page.dart';
import 'package:jobs_bd/presentation/notification/ui/notification_page.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final JobPresentation jobPresentation = Get.put(JobPresentation());
  final HomePresenter homePresenter = Get.put(HomePresenter());

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return DoubleBackToExitApp(
      child: PresentableWidgetBuilder(
        presenter: homePresenter,
        builder: () {
          return PopScope(
            child: Scaffold(
              appBar: AppBar(
                title: const Text(
                  'Jobs BD',
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      Get.find<JobPresentation>().job();
                      showMessage(message: 'Coming soon');
                      Future.delayed(const Duration(seconds: 2), () {
                        context.navigatorPush(NotificationListScreen(
                          homePresenter.database,
                        ));
                      });
                    },
                    child: const Icon(
                      Icons.notifications,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
              drawer: MiniSettingsDrawer(theme: theme),
              body: Column(
                children: [
                  Expanded(
                    child: NestedScrollView(
                      headerSliverBuilder: (context, innerBoxIsScrolled) => [
                        SliverToBoxAdapter(
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
                                      onTap: () {
                                        homePresenter.fetchJobListByCategory(
                                            jobCategoryList[index].jobTitle);

                                        context.navigatorPush(
                                          JobListPage(
                                            title:
                                                jobCategoryList[index].jobTitle,
                                          ),
                                        );
                                      },
                                      totalJobs:
                                          jobCategoryList[index].totalJobs,
                                    );
                                  },
                                ),
                                JobCountSecion(
                                    theme: theme, homePresenter: homePresenter),
                              ],
                            ),
                          ),
                        )
                      ],
                      body: Padding(
                        padding: EdgeInsets.only(
                          left: twentyPx,
                          right: twentyPx,
                          top: tenPx,
                          bottom: tenPx,
                        ),
                        child: Column(
                          children: [
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
                            Expanded(
                              child: ListView.builder(
                                padding: EdgeInsets.zero,
                                itemCount: homePresenter
                                            .currentUiState.allJobList.length >=
                                        10
                                    ? 10
                                    : homePresenter
                                        .currentUiState.allJobList.length,
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemBuilder: (context, index) {
                                  return Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      JobListItem(
                                        theme: theme,
                                        index: index,
                                        onLongPress: () =>
                                            jobPresentation.deleteJob(
                                          homePresenter.currentUiState
                                              .allJobList[index].documentId!,
                                        ),
                                        jobList: homePresenter
                                            .currentUiState.allJobList,
                                        onTap: () async {
                                          homePresenter.incrementViews(
                                              homePresenter.currentUiState
                                                  .allJobList[index]);
                                          context.navigatorPush(
                                            JobViewPage(
                                              index: index,
                                              jobList: homePresenter
                                                  .currentUiState.allJobList,
                                            ),
                                          );
                                          await homePresenter.interstitialAd
                                              .show();
                                        },
                                      ),
                                      if ((index + 1) % 6 == 0) ...[
                                        Container(
                                          padding: padding10,
                                          width: JobsScreen.width,
                                          decoration: BoxDecoration(
                                            color: theme.cardColor,
                                            borderRadius: radius10,
                                          ),
                                        ),
                                        gapH10,
                                      ],
                                    ],
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              bottomNavigationBar: Obx(
                () {
                  if (homePresenter.currentUiState.isHomeBannerAdsLoaded &&
                      homePresenter.currentUiState.googleAdsModel.banner1
                              ?.isNotEmpty ==
                          true) {
                    return SizedBox(
                      height: homePresenter.homeBannerAd.size.height.toDouble(),
                      width: homePresenter.homeBannerAd.size.width.toDouble(),
                      child: AdWidget(
                        ad: homePresenter.homeBannerAd,
                      ),
                    );
                  } else {
                    return const SizedBox();
                  }
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
