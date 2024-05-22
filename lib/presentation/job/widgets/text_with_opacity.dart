import 'package:flutter/material.dart';

class TextWithOpacity extends StatelessWidget {
  const TextWithOpacity({
    super.key,
    required this.title,
    required this.theme,
    this.textColor,
  });

  final String title;
  final ThemeData theme;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      maxLines: 2,
      textAlign: TextAlign.center,
      overflow: TextOverflow.ellipsis,
      style: theme.textTheme.bodyMedium!.copyWith(
        color: textColor ?? theme.textTheme.bodyMedium!.color!.withOpacity(0.8),
      ),
    );
  }
}
