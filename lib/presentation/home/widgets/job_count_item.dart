import 'package:flutter/material.dart';
import 'package:jobs_bd/core/config/jobs_screen.dart';
import 'package:jobs_bd/core/static/ui_const.dart';

class JobCountItem extends StatelessWidget {
  const JobCountItem({
    super.key,
    required this.theme,
    required this.jobCount,
    required this.title,
    this.onTap,
  });

  final ThemeData theme;
  final int jobCount;
  final VoidCallback? onTap;
  final String title;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: paddingH14,
        decoration: BoxDecoration(
          color: theme.cardColor,
          // border: Border.all(
          //   width: 0.2,
          // ),
          borderRadius: radius10,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ConstrainedBox(
              constraints: BoxConstraints(
                maxWidth: JobsScreen.width * 0.22,
              ),
              child: Text(
                title,
                textAlign: TextAlign.start,
                style: theme.textTheme.bodyMedium!.copyWith(),
              ),
            ),
            Text(
              jobCount.toString(),
              style: theme.textTheme.bodyMedium!.copyWith(
                fontSize: twentyPx,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
