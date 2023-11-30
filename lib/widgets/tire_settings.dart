import 'package:flutter/material.dart';
import 'package:treinamento/widgets/app_theme.dart';
import 'package:treinamento/widgets/number_list.dart';

class TireSettings extends StatefulWidget {
  const TireSettings({super.key});

  @override
  State<TireSettings> createState() => _TireSettingsState();
}

class _TireSettingsState extends State<TireSettings> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 16, left: 16, bottom: 16),
      width: double.infinity,
      // color: Colors.white,
      child: Row(
        children: [
          Stack (
            children: [
              Container(
                height: 400,
                margin: EdgeInsets.only(right: 16),
                // color: Colors.pink,
                child: NumberList(numberQuantity: 8),
              ),
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.symmetric(horizontal: 10),
                // color: Colors.white,
                child: Text(
                  "Sections",
                  style: AppTheme.customTextStyles['regular-11']!
                ),
              ),
            ],
          ),
          Expanded(
            child: Container(
              height: 400,
              margin: EdgeInsets.only(right: 16),
              color: Colors.pink,
            ),
          ),
          Expanded(
            child: Container(
              height: 400,
              margin: EdgeInsets.only(right: 16),
              color: Colors.pink,
            ),
          ),
          Expanded(
            child: Container(
              height: 400,
              margin: EdgeInsets.only(right: 16),
              color: Colors.pink,
            ),
          ),
        ],
      ),
    );
  }
}