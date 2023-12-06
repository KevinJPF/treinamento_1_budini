import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:treinamento/widgets/app_theme.dart';

class HeaderUsers extends StatelessWidget {
  final int totalResultados;

  const HeaderUsers({super.key, required this.totalResultados});

  @override
  Widget build(BuildContext context) {
    double statusBarHeight = MediaQuery.of(context).padding.top;

    return Container(
      margin: EdgeInsets.only(top: statusBarHeight),
      width: MediaQuery.of(context).size.width,
      height: 104,
      // color: Colors.yellow,
      child: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: 56,
            // color: Colors.white,
            child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Container(
                height: 48,
                width: 48,
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(top: 4, left: 4),
                // color: Colors.orange,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    elevation: MaterialStateProperty.all<double>(0),
                    padding: MaterialStateProperty.all(EdgeInsets.zero),
                    backgroundColor: MaterialStatePropertyAll(
                      Colors.transparent,
                    ),
                    shape: MaterialStateProperty.all<OutlinedBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.zero,
                      ),
                    ),
                    minimumSize: MaterialStateProperty.all(Size(48, 48)),
                  ),
                  child: Icon(
                    CupertinoIcons.xmark,
                    color: AppTheme.customColors['white-100'],
                    size: 24,
                  ),
                ),
              ),
              Container(
                height: 56,
                width: null,
                margin: EdgeInsets.only(left: 20),
                alignment: Alignment.center,
                // color: Colors.orange,
                child: Text(
                  'Pessoas',
                  style: AppTheme.customTextStyles['medium-20'],
                ),
              ),
              Spacer(),
              Container(
                height: 48,
                width: 48,
                alignment: Alignment.centerRight,
                margin: EdgeInsets.only(top: 4),
                // color: Colors.orange,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    elevation: MaterialStateProperty.all<double>(0),
                    padding: MaterialStateProperty.all(EdgeInsets.zero),
                    backgroundColor: MaterialStatePropertyAll(
                      Colors.transparent,
                    ),
                    shape: MaterialStateProperty.all<OutlinedBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.zero,
                      ),
                    ),
                    minimumSize: MaterialStateProperty.all(Size(48, 48)),
                  ),
                  child: Icon(
                    CupertinoIcons.check_mark,
                    color: AppTheme.customColors['white-100'],
                    size: 24,
                  ),
                ),
              ),
            ]),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 48,
            padding: EdgeInsets.only(left: 16, bottom: 4, top: 8),
            // color: Colors.grey,
            child: Row(children: [
              Expanded(
                child: Stack(
                  children: [
                    Container(
                      alignment: Alignment.bottomLeft,
                      margin: EdgeInsets.only(right: 16),
                      // color: Colors.blue,
                      child: Text(
                        'NOME',
                        style:
                            AppTheme.customTextStyles['regular-11-highlight'],
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
                        style:
                            AppTheme.customTextStyles['regular-11-highlight'],
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
            ]),
          ),
        ],
      ),
    );
  }
}
