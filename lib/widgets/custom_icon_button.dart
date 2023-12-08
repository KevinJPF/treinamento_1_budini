import 'package:flutter/material.dart';
import 'package:treinamento/widgets/app_theme.dart';

class CustomIconButton extends StatelessWidget {
  final VoidCallback onPressed;
  final double buttonHeight;
  final IconData? buttonIcon;
  final Color buttonIconColor;
  final double buttonIconSize;
  final double buttonMarginTop;
  final double buttonMarginBottom;
  final double buttonMarginLeft;
  final double buttonMarginRight;
  final Color buttonBackColor;
  final double buttonBorderWidth;
  final Color buttonBorderColor;
  final double buttonTopLeftRadius;
  final double buttonTopRightRadius;
  final double buttonBottomLeftRadius;
  final double buttonBottomRightRadius;

  const CustomIconButton(
      {super.key,
      required this.onPressed,
      required this.buttonHeight,
      required this.buttonMarginTop,
      required this.buttonMarginBottom,
      required this.buttonMarginLeft,
      required this.buttonMarginRight,
      required this.buttonBackColor,
      required this.buttonBorderWidth,
      required this.buttonBorderColor,
      this.buttonIcon,
      required this.buttonTopLeftRadius,
      required this.buttonTopRightRadius,
      required this.buttonBottomLeftRadius,
      required this.buttonBottomRightRadius,
      required this.buttonIconColor,
      required this.buttonIconSize});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: buttonHeight,
          margin: EdgeInsets.only(
              left: buttonMarginLeft,
              right: buttonMarginRight,
              top: buttonMarginTop,
              bottom: buttonMarginBottom),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(buttonTopLeftRadius),
              topRight: Radius.circular(buttonTopRightRadius),
              bottomLeft: Radius.circular(buttonBottomLeftRadius),
              bottomRight: Radius.circular(buttonBottomRightRadius),
            ),
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
              padding: MaterialStateProperty.all(EdgeInsets.zero),
              side: MaterialStateProperty.all<BorderSide>(
                BorderSide(
                  color: buttonBorderColor,
                  width: buttonBorderWidth,
                ),
              ),
              elevation: MaterialStateProperty.all<double>(0),
              backgroundColor: MaterialStatePropertyAll(
                buttonBackColor,
              ),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(buttonTopLeftRadius),
                    topRight: Radius.circular(buttonTopRightRadius),
                    bottomLeft: Radius.circular(buttonBottomLeftRadius),
                    bottomRight: Radius.circular(buttonBottomRightRadius),
                  ),
                ),
              ),
            ),
            child: Icon(
              buttonIcon,
              color: buttonIconColor,
              size: buttonIconSize,
            ),
          ),
        ),
      ],
    );
  }
}
