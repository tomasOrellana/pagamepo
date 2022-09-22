import 'package:flutter/material.dart';
import 'package:oepaga/theme/index.dart';

class Header extends StatelessWidget {
  final String title;
  final String? subTitle;
  final CrossAxisAlignment crossAxisAlignment;
  const Header(
      {Key? key,
      required this.title,
      this.subTitle,
      this.crossAxisAlignment = CrossAxisAlignment.center})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: crossAxisAlignment,
      children: [
        Text(title, style: ThemeTexts.bold30(c: ThemeColors.tertiary)),
        if (subTitle != null)
          Text(subTitle!,
              style: ThemeTexts.semibold18(c: ThemeColors.secondary))
      ],
    );
  }
}
