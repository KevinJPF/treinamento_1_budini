import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:treinamento/widgets/app_theme.dart';
import 'package:treinamento/widgets/centralized_text.dart';
import 'package:treinamento/widgets/number_list.dart';
import 'package:treinamento/widgets/switch.dart';
import 'package:treinamento/widgets/custom_button.dart';
import 'package:treinamento/widgets/custom_textfield.dart';
import 'package:treinamento/widgets/edit_person.dart';
import 'package:treinamento/widgets/footer.dart';
import 'package:treinamento/widgets/header.dart';
import 'package:treinamento/widgets/remove_popup.dart';
import 'package:treinamento/widgets/subheader.dart';
import 'package:treinamento/widgets/tire_settings.dart';
import 'package:treinamento/widgets/title_text.dart';
import 'package:treinamento/widgets/truck_tires.dart';
import 'package:treinamento/widgets/users_list.dart';
import 'package:treinamento/database/db_connection.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  bool visibleComponents = false;

  void componentsVisibility() {
    setState(() {
      visibleComponents = !visibleComponents;
      print(visibleComponents);
    });
  }

  Size designSize = Size(375, 812);

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: designSize);
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              AppTheme.customColors['background-top']!,
              AppTheme.customColors['background-bottom']!,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          children: [
            const Header(
              tituloHeader: 'Inspection P&D[62]',
              hasLeftIcon: true,
              leftIcon: CupertinoIcons.xmark,
              hasRightIcon: true,
              rightIcon: CupertinoIcons.gear_solid,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    // TitleText(
                    //     titleText: 'Settings',
                    //     titleStyle:
                    //         AppTheme.customTextStyles['regular-24-highlight']!),
                    const TireSettings(),
                    NumberList(
                      selectedText:
                          AppTheme.customTextStyles['regular-24-highlight']!,
                      unselectedText: AppTheme.customTextStyles['medium-14']!,
                      numberQuantity: 9,
                      isHorizontal: true,
                      displayedElements: 5,
                      elements: const [
                        '1',
                        '2',
                        '3',
                        '4',
                        '5',
                        '6',
                        '7',
                        '8',
                        'AUTO',
                      ],
                      cardsHeight: 70,
                      cardsWidth: 50,
                    ),
                    NumberList(
                      selectedText:
                          AppTheme.customTextStyles['regular-24-highlight']!,
                      unselectedText: AppTheme.customTextStyles['medium-14']!,
                      numberQuantity: 3,
                      isHorizontal: true,
                      displayedElements: 3,
                      elements: const [
                        '1',
                        '2',
                        'Auto',
                      ],
                      cardsHeight: 60,
                      cardsWidth: 90,
                    ),
                    NumberList(
                      selectedText:
                          AppTheme.customTextStyles['regular-24-highlight']!,
                      unselectedText: AppTheme.customTextStyles['medium-14']!,
                      numberQuantity: 4,
                      isHorizontal: true,
                      displayedElements: 4,
                      elements: const [
                        '1',
                        '2',
                        '3',
                        'Auto',
                      ],
                      cardsHeight: 90,
                      cardsWidth: 50,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    NumberList(
                      selectedText:
                          AppTheme.customTextStyles['regular-24-highlight']!,
                      unselectedText: AppTheme.customTextStyles['medium-14']!,
                      numberQuantity: 4,
                      isHorizontal: false,
                      displayedElements: 4,
                      elements: const [
                        '1',
                        '2',
                        '3',
                        'Auto',
                      ],
                      cardsHeight: 60,
                      cardsWidth: 90,
                    ),
                    SwitchCustom(
                        text: 'Mesure frenquency e severity', onPressed: () {}),
                    CentralizedText(
                        text:
                            "The specifications are saved automatically and will be used for the inspections that are started next.\nIf you want to use different settings for another inspection, return to this screen to configure again.",
                        styleText: AppTheme.customTextStyles['regular-11']!),
                  ],
                ),
              ),
            ),
            CustomButton(
              buttonText: 'Start',
              onPressed: () {
                if (visibleComponents) RemovePopup(context);
              },
              buttonHeight: 48,
              buttonTextStyle: AppTheme.customTextStyles['medium-18']!,
              buttonBackColor: AppTheme.customColors['principal-100']!,
              buttonBorderWidth: 0,
              buttonBorderColor: AppTheme.customColors['principal-100']!,
              buttonBorderRadius: 200,
              buttonMarginBottom: 24,
              buttonMarginTop: 16,
              buttonMarginLeft: 16,
              buttonMarginRight: 16,
            ),
          ],
        ),
      ),
    );
  }
}
