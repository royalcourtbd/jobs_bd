import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobs_bd/core/config/jobs_screen.dart';
import 'package:jobs_bd/core/static/ui_const.dart';
import 'package:jobs_bd/core/utility/utility.dart';
import 'package:jobs_bd/data/dummy_data_model/job_category_model.dart';
import 'package:jobs_bd/data/dummy_data_model/job_count_model.dart';
import 'package:jobs_bd/presentation/home/widgets/job_list_item.dart';
import 'package:jobs_bd/presentation/job/presenter/job_presentation.dart';
import 'package:jobs_bd/presentation/job/ui/job_list_page.dart';
import 'package:jobs_bd/presentation/home/widgets/job_category_item.dart';
import 'package:jobs_bd/presentation/home/widgets/job_count_item.dart';
import 'package:jobs_bd/presentation/job/ui/job_view_page.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final JobPresentation jobPresentation = Get.put(JobPresentation());

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Jobs BD',
        ),
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
                    onTap: () {
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
                    onTap: () {},
                  );
                },
              ),
              gapH10,
              ListView.builder(
                itemCount: jobPresentation.jobLength >= 10
                    ? 10
                    : jobPresentation.jobLength,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      JobListItem(
                        theme: theme,
                        index: index,
                        onTap: () => context.navigatorPush(
                          JobViewPage(
                              index: index, jobPresentation: jobPresentation),
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
  }
}
