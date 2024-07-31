import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_html/flutter_html.dart' as html;
import 'package:jobs_bd/core/config/jobs_screen.dart';
import 'package:jobs_bd/core/static/ui_const.dart';
import 'package:jobs_bd/data/dummy_data_model/job_model.dart';
import 'package:jobs_bd/presentation/job/widgets/text_with_opacity.dart';

class TestPage extends StatelessWidget {
  const TestPage({
    super.key,
    required this.job,
  });

  final JobModel job;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final DateTime now = DateTime.now();
    final DateTime today = DateTime(now.year, now.month, now.day);
    final DateTime tomorrow = today.add(const Duration(days: 1));
    final DateTime applicationEndDate =
        DateFormat('yyyy-MM-dd').parse(job.jobDeadLine!);

    final bool isEndingSoon = applicationEndDate.isAtSameMomentAs(today) ||
        applicationEndDate.isAtSameMomentAs(tomorrow) ||
        applicationEndDate.isBefore(today);

    String formatDateString(String dateTimeString) {
      DateTime dateTime = DateTime.parse(dateTimeString);
      return DateFormat('dd MMMM yyyy').format(dateTime);
    }

    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        title: Text(job.jobTitle ?? ''),
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
                      child: CachedNetworkImage(
                        imageUrl: job.imgUrl ?? '',
                        placeholder: (context, url) => const Icon(
                          Icons.image,
                          color: Colors.grey,
                        ),
                        errorWidget: (context, url, error) => const Icon(
                          Icons.error,
                          color: Colors.red,
                        ),
                        fit: BoxFit.cover,
                        height: JobsScreen.width * 0.4,
                        width: JobsScreen.width * 0.4,
                      ),
                    ),
                    gapH10,
                    Text(
                      job.jobTitle ?? '',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      style: theme.textTheme.bodyMedium!.copyWith(
                        fontSize: fifteenPx,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextWithOpacity(title: job.companyName ?? '', theme: theme),
                    TextWithOpacity(
                      title: 'Total ${job.totalView} Views',
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
                              title: formatDateString(job.posted ?? ''),
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
                              title: formatDateString(job.jobDeadLine ?? ''),
                              theme: theme,
                              textColor:
                                  isEndingSoon ? Colors.red : Colors.green,
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
                data: job.jobDescription ?? '',
              )
            ],
          ),
        ),
      ),
    );
  }
}
