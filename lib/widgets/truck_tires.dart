import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:treinamento/widgets/app_theme.dart';
import 'package:treinamento/widgets/custom_button.dart';
import 'package:treinamento/widgets/custom_icon_button.dart';

class TruckTires extends StatefulWidget {

  const TruckTires({super.key});

  @override
  State<TruckTires> createState() => _TruckTiresState();
}

class _TruckTiresState extends State<TruckTires> {
  bool frontIsActivated = true;
  bool leftIsActivated = true;
  bool isClockwise = true;
  List<String> tires = ['1', '2', '3', '4'];

  final Map<String, dynamic> customButtonProperties = {
    'activated-back-color': AppTheme.customColors['principal-100']!,
    'deactivated-back-color': AppTheme.customColors['dark-blue-54']!,
    'activated-border-color': Colors.transparent,
    'deactivated-border-color': AppTheme.customColors['principal-100']!,
    'activated-font-style': AppTheme.customTextStyles['medium-14-blue']!,
    'deactivated-font-style': AppTheme.customTextStyles['medium-14']!,

    'deactivated-number-back-color': AppTheme.customColors['black-54']!,
    
    'deactivated-icon-back-color': AppTheme.customColors['white-12']!,
    'activated-icon-color': AppTheme.customColors['dark-blue-100']!,
    'deactivated-icon-color': AppTheme.customColors['white-24']!,
  };

  void changeButtonsState(bool frontButton, bool leftButton) {
    setState(() {
      frontIsActivated = frontButton;
      leftIsActivated = leftButton;
      print('left: $leftIsActivated | front: $frontIsActivated');
      changeTiresNumbers();
    });
  }

  void changeClockwise(bool isClockwise) {
    setState(() {
      this.isClockwise = isClockwise;
      print('left: ${this.isClockwise}');
      changeTiresNumbers();
    });
  }

  void changeTiresNumbers() {
    setState(() {
      int firstTire;

      frontIsActivated ? (leftIsActivated ? firstTire = 0 : firstTire = 1) : (!leftIsActivated ? firstTire = 2 : firstTire = 3);

      for (int i = 1; i < 5; i++) {
        tires[firstTire] = i.toString();

        isClockwise ? firstTire + 1 > 3 ? firstTire = 0 : firstTire++ : firstTire - 1 < 0 ? firstTire = 3 : firstTire--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {

    return Container(
      width: (MediaQuery.of(context).size.width),
      constraints: const BoxConstraints(
        minHeight: 48.0,
      ),
      // color: Colors.white,
      child: Column(
        children: [
          Container (
            width: 160,
            margin: const EdgeInsets.symmetric(horizontal: 16),
            // color: Colors.blue,
            child: Align (
              alignment: Alignment.centerLeft,
              child: CustomButton(
                buttonText: 'Frente', 
                onPressed: () {
                  changeButtonsState(true, leftIsActivated);
                },
                buttonHeight: 40,
                buttonTextStyle: frontIsActivated ? customButtonProperties['activated-font-style'] : customButtonProperties['deactivated-font-style'],
                buttonBackColor: frontIsActivated ? customButtonProperties['activated-back-color'] : customButtonProperties['deactivated-back-color'],
                buttonBorderWidth: frontIsActivated ? 0 : 1,
                buttonBorderColor: frontIsActivated ? customButtonProperties['activated-border-color'] : customButtonProperties['deactivated-border-color'],
                buttonBorderRadius: 16,
                buttonMarginBottom: 16,
                buttonMarginTop: 16,
                buttonMarginLeft: 16,
                buttonMarginRight: 16,
              ),
            ),
          ),
          Container(
            width: 300,
            height: 50,
            // color: Colors.pink,
            child: Row(
              children: [
                Spacer(),
                Container(
                  height: 50,
                  width: 25,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: AppTheme.customColors['white-12'],
                    border: Border.all(
                      color: AppTheme.customColors['white-100']!,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: CustomButton(
                    buttonText: tires[0],
                    onPressed: () {
                      changeButtonsState(true, true);
                    },
                    buttonHeight: 22,
                    buttonTextStyle: frontIsActivated && leftIsActivated ? customButtonProperties['activated-font-style'] : customButtonProperties['deactivated-font-style'],
                    buttonBackColor: frontIsActivated && leftIsActivated ? customButtonProperties['activated-back-color'] : customButtonProperties['deactivated-number-back-color'],
                    buttonBorderWidth: 0,
                    buttonBorderColor: Colors.transparent,
                    buttonBorderRadius: 16,
                    buttonMarginBottom: 1,
                    buttonMarginTop: 13,
                    buttonMarginLeft: 1,
                    buttonMarginRight: 1,
                  ),
                ),
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      height: 1,
                      width: 125,
                      decoration: BoxDecoration(
                        border: Border(bottom: BorderSide(color: AppTheme.customColors['white-100']!,width: 1.0))
                      ),
                    ),
                    Container(
                      width: 30,
                      height: 30,
                      color: Colors.white,
                      child: Icon(
                        CupertinoIcons.chevron_up_circle,
                        color: AppTheme.customColors['dark-blue-100'],
                        size: 25,
                      ),
                    ),
                  ],
                ),
                Container(
                  height: 50,
                  width: 25,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: AppTheme.customColors['white-12'],
                    border: Border.all(
                      color: AppTheme.customColors['white-100']!,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: CustomButton(
                    buttonText: tires[1],
                    onPressed: () {
                      changeButtonsState(true, false);
                    },
                    buttonHeight: 22,
                    buttonTextStyle: frontIsActivated && !leftIsActivated ? customButtonProperties['activated-font-style'] : customButtonProperties['deactivated-font-style'],
                    buttonBackColor: frontIsActivated && !leftIsActivated ? customButtonProperties['activated-back-color'] : customButtonProperties['deactivated-number-back-color'],
                    buttonBorderWidth: 0,
                    buttonBorderColor: Colors.transparent,
                    buttonBorderRadius: 16,
                    buttonMarginBottom: 1,
                    buttonMarginTop: 13,
                    buttonMarginLeft: 1,
                    buttonMarginRight: 1,
                  ),
                ),
                Spacer(),
              ],
            ),
          ),
          Row(
            children: [
              Container (
                width: 160,
                // color: Colors.green,
                child: CustomButton(
                  buttonText: 'Esquerda', 
                  onPressed: () {
                    changeButtonsState(frontIsActivated, true);
                  },
                  buttonHeight: 40,
                  buttonTextStyle: leftIsActivated ? customButtonProperties['activated-font-style'] : customButtonProperties['deactivated-font-style'],
                  buttonBackColor: leftIsActivated ? customButtonProperties['activated-back-color'] : customButtonProperties['deactivated-back-color'],
                  buttonBorderWidth: leftIsActivated ? 0 : 1,
                  buttonBorderColor: leftIsActivated ? customButtonProperties['activated-border-color'] : customButtonProperties['deactivated-border-color'],
                  buttonBorderRadius: 16,
                  buttonMarginBottom: 32,
                  buttonMarginTop: 32,
                  buttonMarginLeft: 16,
                  buttonMarginRight: 16,
                ),
              ),
              Spacer(),
              Container (
                width: 160,
                // color: Colors.green,
                child: CustomButton(
                  buttonText: 'Direita', 
                  onPressed: () {
                    changeButtonsState(frontIsActivated, false);
                  },
                  buttonHeight: 40,
                  buttonTextStyle: !leftIsActivated ? customButtonProperties['activated-font-style'] : customButtonProperties['deactivated-font-style'],
                  buttonBackColor: !leftIsActivated ? customButtonProperties['activated-back-color'] : customButtonProperties['deactivated-back-color'],
                  buttonBorderWidth: !leftIsActivated ? 0 : 1,
                  buttonBorderColor: !leftIsActivated ? customButtonProperties['activated-border-color'] : customButtonProperties['deactivated-border-color'],
                  buttonBorderRadius: 16,
                  buttonMarginBottom: 32,
                  buttonMarginTop: 32,
                  buttonMarginLeft: 16,
                  buttonMarginRight: 16,
                ),
              ),
            ],
          ),
          Container(
            width: 300,
            height: 50,
            // color: Colors.pink,
            child: Row(
              children: [
                Spacer(),
                Container(
                  height: 50,
                  width: 25,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: AppTheme.customColors['white-12'],
                    border: Border.all(
                      color: AppTheme.customColors['white-100']!,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: CustomButton(
                    buttonText: tires[3],
                    onPressed: () {
                      changeButtonsState(false, true);
                    },
                    buttonHeight: 22,
                    buttonTextStyle: !frontIsActivated && leftIsActivated ? customButtonProperties['activated-font-style'] : customButtonProperties['deactivated-font-style'],
                    buttonBackColor: !frontIsActivated && leftIsActivated ? customButtonProperties['activated-back-color'] : customButtonProperties['deactivated-number-back-color'],
                    buttonBorderWidth: 0,
                    buttonBorderColor: Colors.transparent,
                    buttonBorderRadius: 16,
                    buttonMarginBottom: 1,
                    buttonMarginTop: 13,
                    buttonMarginLeft: 1,
                    buttonMarginRight: 1,
                  ),
                ),
                Container(
                  height: 1,
                  width: 125,
                  alignment: Alignment.topCenter,
                  decoration: BoxDecoration(
                    border: Border(bottom: BorderSide(color: AppTheme.customColors['white-100']!,width: 1.0))
                  ),
                ),
                Container(
                  height: 50,
                  width: 25,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: AppTheme.customColors['white-12'],
                    border: Border.all(
                      color: AppTheme.customColors['white-100']!,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: CustomButton(
                    buttonText: tires[2],
                    onPressed: () {
                      changeButtonsState(false, false);
                    },
                    buttonHeight: 22,
                    buttonTextStyle: !frontIsActivated && !leftIsActivated ? customButtonProperties['activated-font-style'] : customButtonProperties['deactivated-font-style'],
                    buttonBackColor: !frontIsActivated && !leftIsActivated ? customButtonProperties['activated-back-color'] : customButtonProperties['deactivated-number-back-color'],
                    buttonBorderWidth: 0,
                    buttonBorderColor: Colors.transparent,
                    buttonBorderRadius: 16,
                    buttonMarginBottom: 1,
                    buttonMarginTop: 13,
                    buttonMarginLeft: 1,
                    buttonMarginRight: 1,
                  ),
                ),
                Spacer(),
              ],
            ),
          ),
          Container (
            width: 160,
            margin: EdgeInsets.symmetric(horizontal: 16),
            // color: Colors.blue,
            child: Align (
              alignment: Alignment.centerLeft,
              child: CustomButton(
                buttonText: 'Traseira', 
                onPressed: () {
                  changeButtonsState(false, leftIsActivated);
                },
                buttonHeight: 40,
                buttonTextStyle: !frontIsActivated ? customButtonProperties['activated-font-style'] : customButtonProperties['deactivated-font-style'],
                buttonBackColor: !frontIsActivated ? customButtonProperties['activated-back-color'] : customButtonProperties['deactivated-back-color'],
                buttonBorderWidth: !frontIsActivated ? 0 : 1,
                buttonBorderColor: !frontIsActivated ? customButtonProperties['activated-border-color'] : customButtonProperties['deactivated-border-color'],
                buttonBorderRadius: 16,
                buttonMarginBottom: 16,
                buttonMarginTop: 24,
                buttonMarginLeft: 16,
                buttonMarginRight: 16,
              ),
            ),
          ),
          
          Container(
            width: 300,
            height: 80,
            // color: Colors.pink,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container (
                  // width: (MediaQuery.of(context).size.width - 103),
                  constraints: const BoxConstraints(
                    minHeight: 48.0,
                  ),
                  margin: EdgeInsets.symmetric(horizontal: 0),
                  // color: Colors.blue,
                  child: Align (
                    alignment: Alignment.centerLeft,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text (
                          'Rotação', 
                          style: AppTheme.customTextStyles['medium-20']
                        ),
                        Text (
                          isClockwise ? 'Sentido horário' : 'Sentido anti-horário',
                          style: AppTheme.customTextStyles['regular-11-white']
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 50),
                Row(
                  children: [
                    Container(
                      width: 30,
                      height: 30,
                      child: 
                      CustomIconButton(
                        onPressed: () {
                          changeClockwise(false);
                        }, 
                        buttonHeight: 30, 
                        buttonMarginTop: 0, 
                        buttonMarginBottom: 0, 
                        buttonMarginLeft: 0, 
                        buttonMarginRight: 0, 
                        buttonBackColor: !isClockwise ? customButtonProperties['activated-back-color'] : customButtonProperties['deactivated-icon-back-color'],
                        buttonBorderWidth: 0, 
                        buttonBorderColor: Colors.transparent, 
                        buttonTopLeftRadius: 4, 
                        buttonTopRightRadius: 0, 
                        buttonBottomLeftRadius: 4, 
                        buttonBottomRightRadius: 0,
                        buttonIcon: CupertinoIcons.arrow_counterclockwise,
                        buttonIconColor: !isClockwise ? customButtonProperties['activated-icon-color'] : customButtonProperties['deactivated-icon-color'],
                        buttonIconSize: 25,
                      ),
                    ),
                    Container(
                      width: 30,
                      height: 30,
                      child: 
                      CustomIconButton(
                        onPressed: () {
                          changeClockwise(true);
                        }, 
                        buttonHeight: 30, 
                        buttonMarginTop: 0, 
                        buttonMarginBottom: 0, 
                        buttonMarginLeft: 0, 
                        buttonMarginRight: 0, 
                        buttonBackColor: isClockwise ? customButtonProperties['activated-back-color'] : customButtonProperties['deactivated-icon-back-color'],
                        buttonBorderWidth: 0, 
                        buttonBorderColor: Colors.transparent, 
                        buttonTopLeftRadius: 0, 
                        buttonTopRightRadius: 4, 
                        buttonBottomLeftRadius: 0, 
                        buttonBottomRightRadius: 4,
                        buttonIcon: CupertinoIcons.arrow_clockwise,
                        buttonIconColor: isClockwise ? customButtonProperties['activated-icon-color'] : customButtonProperties['deactivated-icon-color'],
                        buttonIconSize: 25,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}