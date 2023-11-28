import 'package:flutter/material.dart';
import 'package:treinamento/widgets/app_theme.dart';
import 'views/home_view.dart';

main() {
  runApp(AppWidget());
}

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: const Scaffold(
        body: 
        HomeView(),
      ),
    );
  }
}