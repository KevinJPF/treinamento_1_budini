import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:treinamento/widgets/app_theme.dart';
import 'package:treinamento/widgets/custom_button.dart';
import 'package:treinamento/widgets/header.dart';

class ApiTraining extends StatefulWidget {
  const ApiTraining({super.key});

  @override
  State<ApiTraining> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<ApiTraining> {
  @override
  Widget build(BuildContext context) {
    return Container(
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
              tituloHeader: 'Diagnóstico Pneus',
              hasLeftIcon: true,
              leftIcon: CupertinoIcons.xmark,
              hasRightIcon: false),
          Expanded(
            child: Container(
              color: Colors.green,
            ),
          ),
          CustomButton(
            buttonText: 'Confirmar',
            onPressed: () {},
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
    );
  }
}
