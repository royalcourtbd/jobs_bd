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
        DateFormat('yyyy-MM-dd').parse(jobList[index].posted);

    final bool isEndingSoon = applicationEndDate.isAtSameMomentAs(today) ||
        applicationEndDate.isAtSameMomentAs(tomorrow);

    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        title: Text(jobList[index].jobTitle),
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
                        jobList[index].imgUrl,
                        fit: BoxFit.cover,
                        height: JobsScreen.width * 0.4,
                        width: JobsScreen.width * 0.4,
                      ),
                    ),
                    gapH10,
                    Text(
                      jobList[index].jobTitle,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      style: theme.textTheme.bodyMedium!.copyWith(
                        fontSize: fifteenPx,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextWithOpacity(
                        title: jobList[index].companyName, theme: theme),
                    // if (jobList[index].jobId != null)
                    //   TextWithOpacity(
                    //       title: '${jobList[index].vacancies} Vacancies',
                    //       theme: theme),
                    TextWithOpacity(
                      title: 'Total ${jobList[index].totalView} Views',
                      theme: theme,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextWithOpacity(
                          title: DateTime.parse(jobList[index].posted)
                              .toString()
                              .substring(0, 10),
                          theme: theme,
                        ),
                        TextWithOpacity(
                          title: jobList[index].deadLine,
                          theme: theme,
                          textColor: isEndingSoon
                              ? Colors.red
                              : Colors.green, // Conditionally apply color,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              gapH10,
              html.Html(
                data: htmlData,
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

const htmlData = r"""
<!DOCTYPE html>
<html>
<head>
    <style>
        .bold {
            font-weight: bold;
        }
        .italic {
            font-style: italic;
        }
        .highlight {
            background-color: yellow;
        }
    </style>
</head>
<body>
    <h1><strong>Z-Eight Tech is Looking for Experienced Flutter Developer</strong></h1>
    <h2><strong>Requirements:</strong></h2>
    <ul>
        <li>Development of Android/iOS applications and have deployed them on Google Play/App Store.</li>
        <li>Knowledge of mobile app development.</li>
        <li>Understanding front-end languages like HTML, CSS3, and JavaScript is a plus.</li>
        <li>Knowledge of Python is a plus.</li>
        <li>In-depth understanding of Object-Oriented programming languages like Java and C++.</li>
        <li>Familiarity with version control tools like Git, Subversion, and IDEs like Android Studio, VS Code, etc.</li>
        <li>Understanding of RDMS, SQL, MySQL.</li>
        <li>Understanding of the Agile Software Development Life Cycle and being exposed to Scrum projects.</li>
        <li>Knowledge of Dart programming language, Rest APIs, and integration of various APIs from third parties.</li>
        <li>Comfortable using test cases for debugging code, enhancing performance and reliability.</li>
    </ul>
    <h2><strong>Additional Requirements:</strong></h2>
    <ul>
        <li>Age 18 to 28 years.</li>
        <li>Salary: Negotiable.</li>
    </ul>
    <h2><strong>Facilities:</strong></h2>
    <ul>
        <li><strong>Competitive Salary & regular appraisal.</strong></li>
        <li><strong>Training and learning materials to improve skills.</strong></li>
        <li><strong>You will learn international marketplace standard coding.</strong></li>
        <li><strong>Festival Bonus: 2 (Yearly)</strong></li>
        <li><strong>Salary Review: Negotiable.</strong></li>
        <li><strong>Lunch: Partially Subsidized.</strong></li>
        <li><strong>Breakfast: From Office.</strong></li>
        <li><strong>2 Times Tea</strong></li>
        <li><strong>Deadline: 30.05.2024</strong></li>
    </ul>
    <p><strong>Office Time:</strong> 10:00am to 06:00pm. (Saturday to Thursday).</p>
    <p><strong>Job Location:</strong> 1332/B, Jahan Mansion, O.R Nizam Road, G.E.C, Chattogram.</p>
    <p>If you are interested, send your CV to <a href="mailto:z8techh@gmail.com">z8techh@gmail.com</a></p>
    <p><strong>Subject line:</strong> Flutter Developer</p>
    <p><strong>Office Location:</strong> 1332/B, Jahan Mansion, O.R Nizam Road, G.E.C, Chattogram, Bangladesh</p>
    <p><strong>Note:</strong> Remote job isn't allowed.</p>
</body>
</html>

""";
