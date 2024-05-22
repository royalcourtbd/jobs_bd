import 'package:flutter/material.dart';
import 'package:jobs_bd/core/config/jobs_screen.dart';
import 'package:jobs_bd/core/static/ui_const.dart';
import 'package:jobs_bd/core/utility/utility.dart';
import 'package:jobs_bd/data/dummy_data_model/job_list_model.dart';
import 'package:jobs_bd/presentation/home/widgets/job_list_item.dart';
import 'package:jobs_bd/presentation/job/ui/job_view_page.dart';

class JobListPage extends StatelessWidget {
  const JobListPage({super.key, this.title});

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
        child: ListView.builder(
          itemCount: jobList.length,
          itemBuilder: (context, index) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                JobListItem(
                  theme: theme,
                  index: index,
                  onTap: () => context.navigatorPush(
                    JobViewPage(index: index),
                  ),
                ),
                if ((index + 1) % 5 == 0) ...[
                  Container(
                    height: 50,
                    width: JobsScreen.width,
                    color: Colors.redAccent,
                  ),
                  gapH10,
                ]
              ],
            );
          },
        ),
      ),
    );
  }
}
