import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:treinamento/widgets/app_theme.dart';
import 'package:treinamento/widgets/centralized_text.dart';
import 'package:treinamento/widgets/custom_button.dart';
import 'package:treinamento/widgets/header.dart';
import 'package:http/http.dart' as http;
import 'package:treinamento/widgets/number_list.dart';
import 'package:xml2json/xml2json.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ApiXmlJson extends StatefulWidget {
  const ApiXmlJson({super.key});

  @override
  State<ApiXmlJson> createState() => _ApiXmlJsonState();
}

class _ApiXmlJsonState extends State<ApiXmlJson> {
  List<String> pneus = [];
  int index = 0;

  final Xml2Json xml2Json = Xml2Json();
  var data;

  Future<void> getdata() async {
    final response = await http.get(Uri.parse(
        'https://testbudini.fleetsurvey.com/survey/wsrest.php/VehicleForInspection/serial/AA99999997/fleet-branch/PSUITE-XXX/vehicle/ESTEPE1'));

    final document = (response.body);

    xml2Json.parse(response.body);
    var jsonString = xml2Json.toGData();
    // print(jsonString);

    setState(() {
      data = json.decode(jsonString);

      for (int i = 0;
          i < data['DADOSPARAINSPECAO']['VEICULO']['PNEU'].length;
          i++) {
        pneus.add((i + 1).toString());
      }
    });
  }

  Future<void> initiateData() async {
    await getdata();
  }

  @override
  void initState() {
    initiateData();
    super.initState();
  }

  Size designSize = const Size(375, 812);
  @override
  Widget build(BuildContext context) {
    if (data == null) {
      return Container(
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
          child: Center(
              child: Column(
            children: [
              Header(
                tituloHeader: 'Diagnóstico Pneus',
                hasLeftIcon: true,
                leftIcon: CupertinoIcons.xmark,
                hasRightIcon: true,
                rightIcon: CupertinoIcons.gear_solid,
                onPressedLeft: () {
                  Navigator.of(context).pop();
                },
              ),
              const Spacer(),
              const CircularProgressIndicator(color: Color(0xFF27F3ED)),
              const Spacer(),
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
          )));
    }
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
            Header(
              tituloHeader: 'Diagnóstico Pneus',
              hasLeftIcon: true,
              leftIcon: CupertinoIcons.xmark,
              hasRightIcon: true,
              rightIcon: CupertinoIcons.gear_solid,
              onPressedLeft: () {
                Navigator.of(context).pop();
              },
            ),
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    // color: Colors.blue,
                    margin: EdgeInsets.symmetric(horizontal: 16.sp),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          alignment: Alignment.center,
                          // color: Colors.green,
                          child: Text(
                            'Dados Inspeção',
                            style: AppTheme.customTextStyles['medium-34']!,
                          ),
                        ),
                        Container(
                          // color: Colors.green,
                          child: Text(
                            'TipoPressaoAr',
                            style: AppTheme.customTextStyles['medium-20']!,
                          ),
                        ),
                        Container(
                          // color: Colors.green,
                          child: Text(
                            data['DADOSPARAINSPECAO']['TipoPressaoAr']['\$t'] ??
                                '-',
                            style: AppTheme
                                .customTextStyles['regular-24-highlight']!,
                          ),
                        ),
                        Container(
                          // color: Colors.green,
                          child: Text(
                            'NomeFilial',
                            style: AppTheme.customTextStyles['medium-20']!,
                          ),
                        ),
                        Container(
                          // color: Colors.green,
                          child: Text(
                            data['DADOSPARAINSPECAO']['NomeFilial']['\$t'] ??
                                '-',
                            style: AppTheme
                                .customTextStyles['regular-24-highlight']!,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 16.sp),
                  Container(
                    // color: Colors.blue,
                    margin: EdgeInsets.symmetric(horizontal: 16.sp),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          alignment: Alignment.center,
                          // color: Colors.green,
                          child: Text(
                            'Veículo',
                            style: AppTheme.customTextStyles['medium-34']!,
                          ),
                        ),
                        Container(
                          // color: Colors.green,
                          child: Text(
                            'CodVeiculo',
                            style: AppTheme.customTextStyles['medium-20']!,
                          ),
                        ),
                        Container(
                          // color: Colors.green,
                          child: Text(
                            data['DADOSPARAINSPECAO']['VEICULO']['CodVeiculo']
                                    ['\$t'] ??
                                '-',
                            style: AppTheme
                                .customTextStyles['regular-24-highlight']!,
                          ),
                        ),
                        Container(
                          // color: Colors.green,
                          child: Text(
                            'QtPosicoes',
                            style: AppTheme.customTextStyles['medium-20']!,
                          ),
                        ),
                        Container(
                          // color: Colors.green,
                          child: Text(
                            data['DADOSPARAINSPECAO']['VEICULO']['QtPosicoes']
                                    ['\$t'] ??
                                '-',
                            style: AppTheme
                                .customTextStyles['regular-24-highlight']!,
                          ),
                        ),
                      ],
                    ),
                  ),
                  // SizedBox(height: 16.sp),
                  CentralizedText(
                    text: 'Selecionar Pneu',
                    styleText: AppTheme.customTextStyles['medium-14']!,
                  ),
                  Container(
                    // color: Colors.pink,
                    child: NumberList(
                      isHorizontal: true,
                      elements: pneus,
                      displayedElements: 5,
                      selectedText:
                          AppTheme.customTextStyles['regular-24-highlight']!,
                      unselectedText: AppTheme.customTextStyles['medium-14']!,
                      onSelectionChanged: (value) {
                        setState(() {
                          index = value;
                        });
                      },
                    ),
                  ),
                  SizedBox(height: 16.sp),
                  Container(
                    // color: Colors.blue,
                    margin: EdgeInsets.symmetric(horizontal: 16.sp),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          alignment: Alignment.center,
                          // color: Colors.green,
                          child: Text(
                            'Pneu ${index + 1}',
                            style: AppTheme.customTextStyles['medium-34']!,
                          ),
                        ),
                        Container(
                          // color: Colors.green,
                          child: Text(
                            'CodDesRef',
                            style: AppTheme.customTextStyles['medium-20']!,
                          ),
                        ),
                        Container(
                          // color: Colors.green,
                          child: Text(
                            data['DADOSPARAINSPECAO']['VEICULO']['PNEU'][index]
                                    ['CodDesRef']['\$t'] ??
                                '-',
                            style: AppTheme
                                .customTextStyles['regular-24-highlight']!,
                          ),
                        ),
                        Container(
                          // color: Colors.green,
                          child: Text(
                            'CodPos',
                            style: AppTheme.customTextStyles['medium-20']!,
                          ),
                        ),
                        Container(
                          // color: Colors.green,
                          child: Text(
                            data['DADOSPARAINSPECAO']['VEICULO']['PNEU'][index]
                                    ['CodPos']['\$t'] ??
                                '-',
                            style: AppTheme
                                .customTextStyles['regular-24-highlight']!,
                          ),
                        ),
                        Container(
                          // color: Colors.green,
                          child: Text(
                            'TireID',
                            style: AppTheme.customTextStyles['medium-20']!,
                          ),
                        ),
                        Container(
                          // color: Colors.green,
                          child: Text(
                            data['DADOSPARAINSPECAO']['VEICULO']['PNEU'][index]
                                    ['TireID']['\$t'] ??
                                '-',
                            style: AppTheme
                                .customTextStyles['regular-24-highlight']!,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                ],
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
      ),
    );
  }
}
