import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:treinamento/widgets/app_theme.dart';
import 'package:treinamento/widgets/custom_button.dart';

class TruckTires extends StatelessWidget {
  const TruckTires({super.key});

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
            margin: EdgeInsets.symmetric(horizontal: 16),
            // color: Colors.blue,
            child: Align (
              alignment: Alignment.centerLeft,
              child: CustomButton(
                buttonText: 'Frente', 
                onPressed: () {},
                buttonHeight: 40,
                buttonTextStyle: AppTheme.customTextStyles['medium-14-blue']!,
                buttonBackColor: AppTheme.customColors['principal-100']!,
                buttonBorderWidth: 0,
                buttonBorderColor: AppTheme.customColors['principal-100']!,
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
                    buttonText: '1', 
                    onPressed: () {},
                    buttonHeight: 22,
                    buttonTextStyle: AppTheme.customTextStyles['regular-6']!,
                    buttonBackColor: AppTheme.customColors['black-54']!,
                    buttonBorderWidth: 0,
                    buttonBorderColor: Colors.transparent!,
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
                    buttonText: '1', 
                    onPressed: () {},
                    buttonHeight: 22,
                    buttonTextStyle: AppTheme.customTextStyles['regular-6']!,
                    buttonBackColor: AppTheme.customColors['principal-100']!,
                    buttonBorderWidth: 0,
                    buttonBorderColor: AppTheme.customColors['principal-100']!,
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
                  onPressed: () {},
                  buttonHeight: 40,
                  buttonTextStyle: AppTheme.customTextStyles['medium-14']!,
                  buttonBackColor: AppTheme.customColors['dark-blue-54']!,
                  buttonBorderWidth: 1,
                  buttonBorderColor: AppTheme.customColors['principal-100']!,
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
                  onPressed: () {},
                  buttonHeight: 40,
                  buttonTextStyle: AppTheme.customTextStyles['medium-14-blue']!,
                  buttonBackColor: AppTheme.customColors['principal-100']!,
                  buttonBorderWidth: 0,
                  buttonBorderColor: AppTheme.customColors['principal-100']!,
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
                    buttonText: '1', 
                    onPressed: () {},
                    buttonHeight: 22,
                    buttonTextStyle: AppTheme.customTextStyles['regular-6']!,
                    buttonBackColor: AppTheme.customColors['black-54']!,
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
                    buttonText: '1', 
                    onPressed: () {},
                    buttonHeight: 22,
                    buttonTextStyle: AppTheme.customTextStyles['regular-6']!,
                    buttonBackColor: AppTheme.customColors['black-54']!,
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
                onPressed: () {},
                buttonHeight: 40,
                buttonTextStyle: AppTheme.customTextStyles['medium-14']!,
                buttonBackColor: AppTheme.customColors['dark-blue-54']!,
                buttonBorderWidth: 1,
                buttonBorderColor: AppTheme.customColors['principal-100']!,
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
                          'Sentido Horário', 
                          style: AppTheme.customTextStyles['regular-11-white']
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 50),
                Row(
                  children: [
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          width: 30,
                          height: 30,
                          child: CustomButton(
                            buttonText: '', 
                            onPressed: () {},
                            buttonHeight: 30,
                            buttonTextStyle: AppTheme.customTextStyles['medium-14']!,
                            buttonBackColor: AppTheme.customColors['principal-100']!,
                            buttonBorderWidth: 0,
                            buttonBorderColor: Colors.transparent,
                            buttonBorderRadius: 4,
                            buttonMarginBottom: 0,
                            buttonMarginTop: 0,
                            buttonMarginLeft: 0,
                            buttonMarginRight: 0,
                          ),
                        ),
                        Icon(
                          CupertinoIcons.arrow_counterclockwise,
                          color: AppTheme.customColors['black-100'],
                          size: 25,
                        ),
                      ],
                    ),
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          width: 30,
                          height: 30,
                          child: CustomButton(
                            buttonText: '', 
                            onPressed: () {},
                            buttonHeight: 30,
                            buttonTextStyle: AppTheme.customTextStyles['medium-14']!,
                            buttonBackColor: AppTheme.customColors['white-54']!,
                            buttonBorderWidth: 0,
                            buttonBorderColor: Colors.transparent,
                            buttonBorderRadius: 4,
                            buttonMarginBottom: 0,
                            buttonMarginTop: 0,
                            buttonMarginLeft: 0,
                            buttonMarginRight: 0,
                          ),
                        ),
                        Icon(
                          CupertinoIcons.arrow_clockwise,
                          color: AppTheme.customColors['black-100'],
                          size: 25,
                        ),
                      ],
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