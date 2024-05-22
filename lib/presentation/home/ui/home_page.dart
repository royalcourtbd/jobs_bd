import 'package:flutter/material.dart';
import 'package:jobs_bd/core/config/jobs_screen.dart';
import 'package:jobs_bd/core/static/ui_const.dart';
import 'package:jobs_bd/core/utility/utility.dart';
import 'package:jobs_bd/data/dummy_data_model/job_category_model.dart';
import 'package:jobs_bd/data/dummy_data_model/job_count_model.dart';
import 'package:jobs_bd/presentation/job/ui/job_list_page.dart';
import 'package:jobs_bd/presentation/home/widgets/job_category_item.dart';
import 'package:jobs_bd/presentation/home/widgets/job_count_item.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
                itemBuilder: (context, index) {
                  return JobCategoryItem(
                      theme: theme,
                      index: index,
                      onTap: () {
                        context.navigatorPush(JobListPage(
                          title: jobCategoryList[index].jobTitle,
                        ));
                      });
                },
              ),
              GridView.builder(
                itemCount: jobCountList.length,
                shrinkWrap: true,
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
