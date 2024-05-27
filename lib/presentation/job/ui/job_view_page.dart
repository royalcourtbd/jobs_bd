import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart' as html;
import 'package:intl/intl.dart';
import 'package:jobs_bd/core/config/jobs_screen.dart';
import 'package:jobs_bd/core/static/ui_const.dart';
import 'package:jobs_bd/data/dummy_data_model/job_model.dart';
import 'package:jobs_bd/presentation/job/widgets/text_with_opacity.dart';

class JobViewPage extends StatelessWidget {
  const JobViewPage({
    super.key,
    required this.index,
    required this.jobList,
  });

  final int index;
  final List<JobModel> jobList;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final DateTime now = DateTime.now();
    final DateTime today =
        DateTime(now.year, now.month, now.day); // Set only the date part
    final DateTime tomorrow = today.add(const Duration(days: 1));
    final DateTime applicationEndDate =
        DateFormat('yyyy-MM-dd').parse(jobList[index].jobDeadLine!);

    final bool isEndingSoon = applicationEndDate.isAtSameMomentAs(today) ||
        applicationEndDate.isAtSameMomentAs(tomorrow) ||
        applicationEndDate.isBefore(today);

    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        title: Text(jobList[index].jobTitle ?? ''),
      ),
      body: Padding(
        padding: padding20,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: padding15,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: theme.cardColor,
                  borderRadius: radius10,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ClipRRect(
                      borderRadius: radius10,
                      child: Image.network(
                        jobList[index].imgUrl ?? '',
                        fit: BoxFit.cover,
                        height: JobsScreen.width * 0.4,
                        width: JobsScreen.width * 0.4,
                      ),
                    ),
                    gapH10,
                    Text(
                      jobList[index].jobTitle ?? '',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      style: theme.textTheme.bodyMedium!.copyWith(
                        fontSize: fifteenPx,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextWithOpacity(
                        title: jobList[index].companyName ?? '', theme: theme),
                    // if (jobList[index].jobId != null)
                    //   TextWithOpacity(
                    //       title: '${jobList[index].vacancies} Vacancies',
                    //       theme: theme),
                    TextWithOpacity(
                      title: 'Total ${jobList[index].totalView} Views',
                      theme: theme,
                    ),
                    gapH15,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Text(
                              'Start Date',
                              style: theme.textTheme.bodyMedium!.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            TextWithOpacity(
                              title: DateTime.parse(jobList[index].posted ?? '')
                                  .toString()
                                  .substring(0, 10),
                              theme: theme,
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              'End Date',
                              style: theme.textTheme.bodyMedium!.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            TextWithOpacity(
                              title: jobList[index].jobDeadLine ?? '',
                              theme: theme,
                              textColor: isEndingSoon
                                  ? Colors.red
                                  : Colors.green, // Conditionally apply color,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              gapH10,
              html.Html(
                data: jobList[index].jobDescription ?? '',
                style: const {
                  // "body": Style(
                  //   margin: EdgeInsets.zero,
                  //   textAlign: TextAlign.left,
                  //   padding: EdgeInsets.zero,
                  //   fontSize: FontSize(fourteenPx),
                  //   lineHeight: const LineHeight(1.5),
                  //   color: Theme.of(context).textTheme.displayMedium!.color,
                  // ),
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
