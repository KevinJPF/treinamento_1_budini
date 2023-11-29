import 'package:flutter/material.dart';
import 'package:treinamento/widgets/app_theme.dart';

class Header extends StatelessWidget {
  final String tituloHeader;
  final bool hasLeftIcon;
  final IconData? leftIcon;
  final bool hasRightIcon;
  final IconData? rightIcon;


  const Header({super.key, required this.tituloHeader, required this.hasLeftIcon, this.leftIcon, required this.hasRightIcon, this.rightIcon});

  @override
  Widget build(BuildContext context) {
    double statusBarHeight = MediaQuery.of(context).padding.top;

    return Container(
      margin: EdgeInsets.only(top: statusBarHeight),
      width: MediaQuery.of(context).size.width,
      height: 56,
      // color: Colors.yellow,
      child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: 56,
                // color: Colors.white,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 48,
                      width: 48,
                      alignment: Alignment.centerLeft,
                      margin: EdgeInsets.only(top: 4, left: 4),
                      // color: Colors.orange,
                      child:
                      ElevatedButton(
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
                          minimumSize: MaterialStateProperty.all(
                          Size(48, 48)),
                        ),
                        child: Icon(
                            leftIcon,
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
                        tituloHeader,
                        style: AppTheme.customTextStyles['medium-20'],
                      ),
                    ),
                    Spacer(),
                    Container(
                      height: 48,
                      width: hasRightIcon ? 48 : 0,
                      alignment: Alignment.centerRight,
                      margin: EdgeInsets.only(top: 4),
                      color: Colors.orange,
                      child:
                      ElevatedButton(
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
                          minimumSize: MaterialStateProperty.all(
                          Size(48, 48)),
                        ),
                        child: Icon(
                            rightIcon,
                            color: AppTheme.customColors['white-100'],
                            size: 24,
                          ),
                      ),
                    ),
                  ]
                ),
              ),
              
          ],
        ),
    );
  }
}