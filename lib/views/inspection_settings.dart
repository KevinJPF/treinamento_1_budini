import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:treinamento/widgets/app_theme.dart';
import 'package:treinamento/widgets/centralized_text.dart';
import 'package:treinamento/widgets/switch.dart';
import 'package:treinamento/widgets/custom_button.dart';
import 'package:treinamento/widgets/header.dart';
import 'package:treinamento/widgets/simple_popup.dart';
import 'package:treinamento/widgets/truck_tires.dart';

class InspectionSettings extends StatefulWidget {
  const InspectionSettings({super.key});

  @override
  State<InspectionSettings> createState() => _InspectionSettingsState();
}

class _InspectionSettingsState extends State<InspectionSettings> {
  bool visibleComponents = false;

  void componentsVisibility() {
    setState(() {
      visibleComponents = !visibleComponents;
      print(visibleComponents);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
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
            Header(
              tituloHeader: 'Sequência de Inspeção[63]',
              hasLeftIcon: true,
              leftIcon: CupertinoIcons.arrow_left,
              hasRightIcon: false,
              onPressedLeft: () {
                Navigator.of(context).pop();
              },
            ),
            SwitchCustom(
              text: 'Alterar sequência de inspeção',
              onPressed: componentsVisibility,
            ),
            Visibility(
                visible: visibleComponents,
                child: CentralizedText(
                  text:
                      'Para determinar um padrão de inspeção, selecione a posição inicial e rotação no veículo modelo.',
                  styleText: AppTheme.customTextStyles['medium-14']!,
                )),
            Visibility(visible: visibleComponents, child: const TruckTires()),
            const Spacer(),
            CustomButton(
              buttonText: 'Aplicar',
              onPressed: () {
                if (visibleComponents) SimplePopup(context);
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
