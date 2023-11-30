import 'package:flutter/material.dart';
import 'package:treinamento/widgets/app_theme.dart';

class TitleText extends StatelessWidget {
  final String titleText;
  final TextStyle titleStyle;
  const TitleText({super.key, required this.titleText, required this.titleStyle});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 16, left: 16, bottom: 16),
      width: double.infinity,
      // color: Colors.white,
      child: Text(
        titleText,
        style: titleStyle,
      ),
    );
  }
}