import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:treinamento/views/api_json.dart';
import 'package:treinamento/views/training_hub.dart';
import 'views/settings_tires.dart';

main() {
  // debugPaintSizeEnabled = true;
  runApp(AppWidget());
}

class AppWidget extends StatelessWidget {
  Size designSize = const Size(375, 812);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: ScreenUtilInit(
        designSize: designSize,
        child: const Scaffold(
          body: TrainingHub(),
        ),
      ),
    );
  }
}
