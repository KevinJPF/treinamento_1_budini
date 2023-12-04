import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:treinamento/widgets/app_theme.dart';

class CentralizedText extends StatelessWidget {
  final String text;
  final TextStyle styleText;

  CentralizedText({super.key, required this.text, required this.styleText});

  Size designSize = Size(375, 812);

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: designSize);
    return Container(
      width: (MediaQuery.of(context).size.width),
      constraints: const BoxConstraints(
        minHeight: 48.0,
      ),
      // color: Colors.orange,
      child: Container(
        width: (MediaQuery.of(context).size.width),
        constraints: const BoxConstraints(
          minHeight: 48.0,
        ),
        margin: EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 8),
        // color: Colors.green,
        child: Align(
          alignment: Alignment.center,
          child: Text(text, textAlign: TextAlign.center, style: styleText),
        ),
      ),
    );
  }
}
