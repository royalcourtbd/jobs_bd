import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobs_bd/core/config/jobs_screen.dart';
import 'package:jobs_bd/core/static/ui_const.dart';
import 'package:jobs_bd/presentation/home/presenter/home_presenter.dart';

class JobCountItem extends StatelessWidget {
  JobCountItem({
    super.key,
    required this.theme,
    required this.index,
    this.onTap,
  });

  final ThemeData theme;
  final int index;
  final VoidCallback? onTap;
  final HomePresenter homePresenter = Get.put(HomePresenter());

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
                maxWidth: JobsScreen.width * 0.2,
              ),
              child: Text(
                homePresenter.currentUiState.jobCounts[index].jobTitle,
                style: theme.textTheme.bodyMedium!.copyWith(),
              ),
            ),
            Text(
              '${homePresenter.currentUiState.jobCounts[index].jobCount}',
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
