import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:treinamento/views/api_json.dart';
import 'package:treinamento/views/api_xml_json.dart';
import 'package:treinamento/views/connect_database.dart';
import 'package:treinamento/views/inspection_settings.dart';
import 'package:treinamento/views/people_list.dart';
import 'package:treinamento/views/settings_tires.dart';
import 'package:treinamento/views/speech_to_text.dart';
import 'package:treinamento/widgets/app_theme.dart';
import 'package:treinamento/widgets/custom_button.dart';
import 'package:treinamento/widgets/header.dart';

class TrainingHub extends StatefulWidget {
  const TrainingHub({super.key});

  @override
  State<TrainingHub> createState() => _TrainingHubState();
}

class _TrainingHubState extends State<TrainingHub> {
  @override
  Widget build(BuildContext context) {
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
        child: Expanded(
          child: Column(
            children: [
              Header(
                tituloHeader: 'Hub de Treinamento',
                hasLeftIcon: false,
                hasRightIcon: false,
                onPressedLeft: () {},
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      child: Column(
                        children: [
                          Text(
                            'Conexão Banco',
                            style: AppTheme.customTextStyles['medium-14']!,
                          ),
                          CustomButton(
                            buttonText: 'Treino 1',
                            onPressed: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => const ConnectDatabase(),
                                ),
                              );
                            },
                            buttonHeight: 48,
                            buttonTextStyle:
                                AppTheme.customTextStyles['medium-18']!,
                            buttonBackColor:
                                AppTheme.customColors['principal-100']!,
                            buttonBorderWidth: 0,
                            buttonBorderColor:
                                AppTheme.customColors['principal-100']!,
                            buttonBorderRadius: 200,
                            buttonMarginBottom: 24,
                            buttonMarginTop: 16,
                            buttonMarginLeft: 16,
                            buttonMarginRight: 16,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      child: Column(
                        children: [
                          Text(
                            'Lista Pessoas',
                            style: AppTheme.customTextStyles['medium-14']!,
                          ),
                          CustomButton(
                            buttonText: 'Treino 2',
                            onPressed: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => const PeopleList(),
                                ),
                              );
                            },
                            buttonHeight: 48,
                            buttonTextStyle:
                                AppTheme.customTextStyles['medium-18']!,
                            buttonBackColor:
                                AppTheme.customColors['principal-100']!,
                            buttonBorderWidth: 0,
                            buttonBorderColor:
                                AppTheme.customColors['principal-100']!,
                            buttonBorderRadius: 200,
                            buttonMarginBottom: 24,
                            buttonMarginTop: 16,
                            buttonMarginLeft: 16,
                            buttonMarginRight: 16,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      child: Column(
                        children: [
                          Text(
                            'Inspection Settings',
                            style: AppTheme.customTextStyles['medium-14']!,
                          ),
                          CustomButton(
                            buttonText: 'Treino 3',
                            onPressed: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const InspectionSettings(),
                                ),
                              );
                            },
                            buttonHeight: 48,
                            buttonTextStyle:
                                AppTheme.customTextStyles['medium-18']!,
                            buttonBackColor:
                                AppTheme.customColors['principal-100']!,
                            buttonBorderWidth: 0,
                            buttonBorderColor:
                                AppTheme.customColors['principal-100']!,
                            buttonBorderRadius: 200,
                            buttonMarginBottom: 24,
                            buttonMarginTop: 16,
                            buttonMarginLeft: 16,
                            buttonMarginRight: 16,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      child: Column(
                        children: [
                          Text(
                            'Tire Settings',
                            style: AppTheme.customTextStyles['medium-14']!,
                          ),
                          CustomButton(
                            buttonText: 'Treino 4',
                            onPressed: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => const SettingsTires(),
                                ),
                              );
                            },
                            buttonHeight: 48,
                            buttonTextStyle:
                                AppTheme.customTextStyles['medium-18']!,
                            buttonBackColor:
                                AppTheme.customColors['principal-100']!,
                            buttonBorderWidth: 0,
                            buttonBorderColor:
                                AppTheme.customColors['principal-100']!,
                            buttonBorderRadius: 200,
                            buttonMarginBottom: 24,
                            buttonMarginTop: 16,
                            buttonMarginLeft: 16,
                            buttonMarginRight: 16,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      child: Column(
                        children: [
                          Text(
                            'API XML>JSON',
                            style: AppTheme.customTextStyles['medium-14']!,
                          ),
                          CustomButton(
                            buttonText: 'Treino 5',
                            onPressed: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => const ApiXmlJson(),
                                ),
                              );
                            },
                            buttonHeight: 48,
                            buttonTextStyle:
                                AppTheme.customTextStyles['medium-18']!,
                            buttonBackColor:
                                AppTheme.customColors['principal-100']!,
                            buttonBorderWidth: 0,
                            buttonBorderColor:
                                AppTheme.customColors['principal-100']!,
                            buttonBorderRadius: 200,
                            buttonMarginBottom: 24,
                            buttonMarginTop: 16,
                            buttonMarginLeft: 16,
                            buttonMarginRight: 16,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      child: Column(
                        children: [
                          Text(
                            'API JSON',
                            style: AppTheme.customTextStyles['medium-14']!,
                          ),
                          CustomButton(
                            buttonText: 'Treino 6',
                            onPressed: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => const ApiJson(),
                                ),
                              );
                            },
                            buttonHeight: 48,
                            buttonTextStyle:
                                AppTheme.customTextStyles['medium-18']!,
                            buttonBackColor:
                                AppTheme.customColors['principal-100']!,
                            buttonBorderWidth: 0,
                            buttonBorderColor:
                                AppTheme.customColors['principal-100']!,
                            buttonBorderRadius: 200,
                            buttonMarginBottom: 24,
                            buttonMarginTop: 16,
                            buttonMarginLeft: 16,
                            buttonMarginRight: 16,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      child: Column(
                        children: [
                          Text(
                            'Speech to Text',
                            style: AppTheme.customTextStyles['medium-14']!,
                          ),
                          CustomButton(
                            buttonText: 'Voice to Text',
                            onPressed: () {
                              Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                  builder: (context) => const SpeechText(),
                                ),
                              );
                            },
                            buttonHeight: 48,
                            buttonTextStyle:
                                AppTheme.customTextStyles['medium-18']!,
                            buttonBackColor:
                                AppTheme.customColors['principal-100']!,
                            buttonBorderWidth: 0,
                            buttonBorderColor:
                                AppTheme.customColors['principal-100']!,
                            buttonBorderRadius: 200,
                            buttonMarginBottom: 24,
                            buttonMarginTop: 16,
                            buttonMarginLeft: 16,
                            buttonMarginRight: 16,
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
      ),
    );
  }
}
