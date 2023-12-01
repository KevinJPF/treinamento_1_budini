import 'package:flutter/material.dart';
import 'package:treinamento/widgets/app_theme.dart';
import 'package:treinamento/widgets/centralized_text.dart';
import 'package:treinamento/widgets/number_list.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TireSettings extends StatefulWidget {
  const TireSettings({super.key});

  @override
  State<TireSettings> createState() => _TireSettingsState();
}

class _TireSettingsState extends State<TireSettings> {
  int numberOfSections = 1;
  int numberOfPoints = 1;
  int numberOfThreads = 1;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 16, right: 16),
      width: double.infinity,
      // height: 400,
      // color: Colors.black,
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  alignment: Alignment.center,
                  // color: Colors.orange,
                  child: Text(
                    "Sections",
                    style: AppTheme.customTextStyles['regular-11']!,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              SizedBox(
                width: 16,
              ),
              Expanded(
                flex: 1,
                child: Container(
                  alignment: Alignment.center,
                  // color: Colors.orange,
                  child: Text(
                    "Points per section",
                    style: AppTheme.customTextStyles['regular-11']!,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              SizedBox(
                width: 16,
              ),
              Expanded(
                flex: 1,
                child: Container(
                  alignment: Alignment.center,
                  // color: Colors.orange,
                  child: Text(
                    "Threads per point",
                    // '${numberOfSections}',
                    style: AppTheme.customTextStyles['regular-11']!,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              SizedBox(
                width: 16,
              ),
              Expanded(
                flex: 2,
                child: Container(
                    // height: 50,
                    // color: Colors.orange,
                    ),
              ),
            ],
          ),
          SizedBox(
            height: 16,
          ),
          Row(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  // height: 50,
                  // color: Colors.pink,
                  child: NumberList(
                    numberQuantity: 8,
                    isHorizontal: false,
                    initialNumber: 1,
                    onSelectionChanged: (value) {
                      setState(() {
                        numberOfSections = value;
                      });
                    },
                  ),
                ),
              ),
              SizedBox(
                width: 16,
              ),
              Expanded(
                child: Column(
                  children: [
                    Container(
                      // color: Colors.pink,
                      child: NumberList(
                        numberQuantity: 2,
                        isHorizontal: false,
                        initialNumber: 1,
                        onSelectionChanged: (value) {
                          setState(() {
                            numberOfPoints = value;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 16,
              ),
              Expanded(
                flex: 1,
                child: Container(
                  // height: 50,
                  // color: Colors.pink,
                  child: NumberList(
                    numberQuantity: 8,
                    isHorizontal: false,
                    initialNumber: 1,
                    onSelectionChanged: (value) {
                      setState(() {
                        numberOfThreads = value;
                      });
                    },
                  ),
                ),
              ),
              SizedBox(
                width: 16,
              ),
              Expanded(
                flex: 2,
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    Expanded(
                      child: Container(
                        // color: Colors.amber,
                        child: Column(
                          children: [
                            Row(),
                          ],
                        ),
                      ),
                    ),
                    Column(
                      children: [
                        Container(
                          // height: 300,
                          // color: Colors.pink,
                          child: Column(
                            children: [
                              Container(
                                // margin: EdgeInsets.only(top: 62),
                                width: double.infinity * 0.75,
                                // color: Colors.blue,
                                child: SvgPicture.asset(
                                  'assets/svg/rad_${numberOfSections}.svg',
                                  fit: BoxFit.contain,
                                ),
                              ),
                              SizedBox(
                                height: 32,
                              ),
                              Stack(
                                // alignment: Alignment.center,
                                children: [
                                  Container(
                                    width: double.infinity * 0.75,
                                    // color: Colors.blue,
                                    child: SvgPicture.asset(
                                      'assets/svg/tire_for_points_sections.svg',
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(
                                        top: numberOfPoints == 2 ? 0 : 10),
                                    // color: Colors.pink,
                                    child: Stack(
                                      alignment: Alignment.center,
                                      children: [
                                        Container(
                                          margin: EdgeInsets.only(
                                              left:
                                                  numberOfPoints == 2 ? 0 : 10),
                                          // alignment: Alignment.center,
                                          // color: Colors.red,
                                          child: Text(
                                              List.filled(numberOfThreads, "'")
                                                  .join(),
                                              style: TextStyle(
                                                  color: Colors.black)),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(
                                              left:
                                                  numberOfPoints == 2 ? 60 : 70,
                                              bottom: 5),
                                          alignment: Alignment.center,
                                          // color: Colors.green,
                                          child: Text("1"),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Visibility(
                                    visible: numberOfPoints == 2 ? true : false,
                                    child: Container(
                                      margin: EdgeInsets.only(top: 20),
                                      // color: Colors.amber,
                                      child: Stack(
                                        alignment: Alignment.center,
                                        children: [
                                          Container(
                                            margin: EdgeInsets.only(left: 18),
                                            // alignment: Alignment.center,
                                            // color: Colors.red,
                                            child: Text(
                                                List.filled(
                                                        numberOfThreads, "'")
                                                    .join(),
                                                style: TextStyle(
                                                    color: Colors.black)),
                                          ),
                                          Container(
                                            // color: Colors.pink,
                                            margin: EdgeInsets.only(
                                                left: 80, bottom: 5),
                                            alignment: Alignment.center,
                                            // color: Colors.green,
                                            child: Text("2"),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: 16,
          )
        ],
      ),
    );
  }
}
