import 'package:flutter/material.dart';
import 'package:jobs_bd/core/config/jobs_screen.dart';
import 'package:jobs_bd/core/static/ui_const.dart';
import 'package:jobs_bd/data/dummy_data_model/job_category_model.dart';

class JobCategoryItem extends StatelessWidget {
  const JobCategoryItem({
    super.key,
    required this.theme,
    required this.index,
    this.onTap,
  });

  final ThemeData theme;
  final int index;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: tenPx),
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding: padding10,
          height: JobsScreen.width * 0.25,
          width: JobsScreen.width,
          decoration: BoxDecoration(
            color: theme.cardColor,
            borderRadius: radius10,
          ),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: radius50,
                child: Image.asset(
                  jobCategoryList[index].imgPath,
                  height: JobsScreen.width * 0.2,
                  width: JobsScreen.width * 0.2,
                ),
              ),
              gapW15,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '${jobCategoryList[index].totalJobs} Jobs',
                    style: theme.textTheme.bodyMedium!.copyWith(
                      fontSize: twentyPx,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    jobCategoryList[index].jobTitle,
                    style: theme.textTheme.bodyMedium!.copyWith(
                        color: theme.textTheme.bodyMedium!.color!
                            .withOpacity(0.6)),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
