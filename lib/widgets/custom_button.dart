import 'package:flutter/material.dart';
import 'package:treinamento/widgets/app_theme.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String buttonText;
  final Color backgroundColor;
  final TextStyle textStyle;
  final double borderSize;
  final Color borderColor;
  const CustomButton(
      {super.key, required this.buttonText, required this.onPressed, required this.backgroundColor, required this.textStyle, required this.borderSize, required this.borderColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 48,
      margin: EdgeInsets.only(left: 16, right: 16, top: 16  , bottom: 24),
      decoration: BoxDecoration (
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
              color: borderColor,
              width: borderSize,
            ),
          ),
          elevation: MaterialStateProperty.all<double>(0),
          minimumSize: MaterialStateProperty.all(
              Size(10, 50)),
          backgroundColor: MaterialStatePropertyAll(
            backgroundColor,
          ),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24),
            ),
          ),
        ),
        child: Text(
          buttonText,
          style: textStyle,
        ),
      ),
    );
  }
}