import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'views/home_view.dart';

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
          body: HomeView(),
        ),
      ),
    );
  }
}
