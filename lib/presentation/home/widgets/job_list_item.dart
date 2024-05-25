import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobs_bd/core/config/jobs_screen.dart';
import 'package:jobs_bd/core/static/ui_const.dart';
import 'package:jobs_bd/data/dummy_data_model/job_list_model.dart';
import 'package:jobs_bd/presentation/job/presenter/job_presentation.dart';

class JobListItem extends StatelessWidget {
  JobListItem({
    super.key,
    required this.theme,
    required this.index,
    this.onTap,
  });

  final ThemeData theme;
  final int index;
  final VoidCallback? onTap;
  final JobPresentation jobPresentation = Get.put(JobPresentation());

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
              ClipRRect(
                borderRadius: radius10,
                child: Image.network(
                  jobPresentation.allJobsList[index].imgUrl,
                  height: JobsScreen.width * 0.17,
                  width: JobsScreen.width * 0.17,
                ),
              ),
              gapW15,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  LimitedBox(
                    maxWidth: JobsScreen.width * 0.6,
                    child: Text(
                      jobPresentation.allJobsList[index].jobTitle,
                      softWrap: true,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.start,
                      style: theme.textTheme.bodyMedium!.copyWith(
                        fontSize: fifteenPx,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Text(
                    jobPresentation.allJobsList[index].companyName,
                    style: theme.textTheme.bodyMedium!.copyWith(
                      fontSize: fourteenPx,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    'Total Views ${jobPresentation.allJobsList[index].totalView}',
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
