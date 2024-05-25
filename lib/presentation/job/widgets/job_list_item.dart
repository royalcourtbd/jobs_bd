import 'package:flutter/material.dart';
import 'package:jobs_bd/core/config/jobs_screen.dart';
import 'package:jobs_bd/core/static/ui_const.dart';

import 'package:jobs_bd/data/dummy_data_model/job_model.dart';

class JobListItem extends StatelessWidget {
  const JobListItem({
    super.key,
    required this.theme,
    required this.index,
    required this.jobList,
    this.onTap,
  });

  final ThemeData theme;
  final int index;
  final VoidCallback? onTap;
  final List<JobModel> jobList;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: tenPx),
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding: padding10,
          width: JobsScreen.width,
          decoration: BoxDecoration(
            color: theme.cardColor,
            borderRadius: radius10,
          ),
          child: Row(
            children: [
              Image.asset(
                jobList[index].imgUrl,
                height: JobsScreen.width * 0.17,
                width: JobsScreen.width * 0.17,
              ),
              gapW15,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    jobList[index].jobTitle,
                    style: theme.textTheme.bodyMedium!.copyWith(
                      fontSize: fifteenPx,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    jobList[index].companyName,
                    style: theme.textTheme.bodyMedium!.copyWith(
                      fontSize: fourteenPx,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    'Total Views ${jobList[index].totalView}',
                    style: theme.textTheme.bodyMedium!.copyWith(
                      fontSize: elevenPx,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
