import 'package:flutter/material.dart';
import 'package:treinamento/widgets/app_theme.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String buttonText;
  final double buttonHeight;
  final double buttonBorderRadius;
  final TextStyle buttonTextStyle;
  final double buttonMarginTop;
  final double buttonMarginBottom;
  final double buttonMarginLeft;
  final double buttonMarginRight;
  final Color buttonBackColor;
  final double buttonBorderWidth;
  final Color buttonBorderColor;

  const CustomButton(
      {super.key, 
      required this.buttonText, 
      required this.onPressed,
      required this.buttonHeight, 
      required this.buttonBorderRadius, 
      required this.buttonTextStyle, 
      required this.buttonMarginTop, 
      required this.buttonMarginBottom, 
      required this.buttonMarginLeft, 
      required this.buttonMarginRight, 
      required this.buttonBackColor, 
      required this.buttonBorderWidth, 
      required this.buttonBorderColor}
    );

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: buttonHeight,
          margin: EdgeInsets.only(left: buttonMarginLeft, right: buttonMarginRight, top: buttonMarginTop  , bottom: buttonMarginBottom),
          decoration: BoxDecoration (
            borderRadius: BorderRadius.circular(buttonBorderRadius),
            boxShadow: [
              BoxShadow(
                color: AppTheme.customColors['black-16']!,
                offset: Offset(0, 4),
                blurRadius: 8,
              ),
            ],
          ),
          child: ElevatedButton(
            onPressed: onPressed,
            style: ButtonStyle(
              side: MaterialStateProperty.all<BorderSide>(
                BorderSide(
                  color: buttonBorderColor!,
                  width: buttonBorderWidth,
                ),
              ),
              elevation: MaterialStateProperty.all<double>(0),
              backgroundColor: MaterialStatePropertyAll(
                buttonBackColor,
              ),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(buttonBorderRadius),
                ),
              ),
            ),
            child: Text(
              buttonText,
              style: buttonTextStyle,
            ),
          ),
        ),
      ],
    );
  }
}