import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:treinamento/widgets/app_theme.dart';

class SubHeader extends StatelessWidget {
  final int totalResultados;

  const SubHeader({super.key, required this.totalResultados});

  @override
  Widget build(BuildContext context) {
    return Container(
                width: MediaQuery.of(context).size.width,
                height: 48,
                padding: EdgeInsets.only(left: 16, bottom: 4, top: 8),
                // color: Colors.grey,
                child: Row(
                  children: [
                    Expanded(
                      child: Stack(
                        children: [
                          Container(
                            alignment: Alignment.bottomLeft,
                            margin: EdgeInsets.only(right: 16),
                            // color: Colors.blue,
                            child: Text(
                              'NOME',
                              style: AppTheme.customTextStyles['regular-11-highlight'],
                            ),
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              DateFormat('dd/MM/yyyy').format(DateTime.now()),
                              style: AppTheme.customTextStyles['regular-11'],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Container(
                        alignment: Alignment.bottomLeft,
                        margin: EdgeInsets.only(right: 16),
                        // color: Colors.blue,
                        child: Text(
                          'ENDEREÇO',
                          style: AppTheme.customTextStyles['regular-11-highlight'],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        // color: Colors.lightBlue,
                        child: Align(
                          alignment: Alignment.bottomLeft,
                          child: Text(
                            'TELEFONE',
                            style: AppTheme.customTextStyles['regular-11-highlight'],
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 4),
                      width: 96,
                      height: 48,
                      // color: Colors.green[900],
                      child: Stack(
                        children: [
                          Container(
                            alignment: Alignment.bottomRight,
                            margin: EdgeInsets.only(right: 16),
                            // color: Colors.blue,
                            child: Text(
                              '${totalResultados}',
                              style: AppTheme.customTextStyles['regular-11-highlight'],
                            ),
                          ),
                          Container(
                            alignment: Alignment.topRight,
                            margin: EdgeInsets.only(right: 16),
                            child: Text(
                              'total',
                              style: AppTheme.customTextStyles['regular-11'],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ]
                ),
              );
  }
}