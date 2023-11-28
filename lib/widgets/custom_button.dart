import 'package:flutter/material.dart';
import 'package:treinamento/widgets/app_theme.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String buttonText;
  const CustomButton(
      {super.key, required this.buttonText, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        width: double.infinity,
        height: 48,
        child: ElevatedButton(
          onPressed: onPressed,
          style: ButtonStyle(
            side: MaterialStateProperty.all<BorderSide>(
              BorderSide(
                color: AppTheme.customColors['dark-blue-100']!,
                width: 2.0,
              ),
            ),
            elevation: MaterialStateProperty.all<double>(0),
            minimumSize: MaterialStateProperty.all(
                Size(10, 50)),
            backgroundColor: MaterialStatePropertyAll(
              AppTheme.customColors['white-100'],
            ),
            foregroundColor: MaterialStatePropertyAll(
              AppTheme.customColors['dark-blue-100'],
            ),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24),
              ),
            ),
          ),
          child: Text(
            buttonText,
            style: AppTheme.customTextStyles['medium-18']
          ),
        ),
      ),
    );
  }
}