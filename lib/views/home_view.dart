import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:treinamento/widgets/app_theme.dart';
import 'package:treinamento/widgets/switch.dart';
import 'package:treinamento/widgets/custom_button.dart';
import 'package:treinamento/widgets/custom_textfield.dart';
import 'package:treinamento/widgets/edit_person.dart';
import 'package:treinamento/widgets/footer.dart';
import 'package:treinamento/widgets/header.dart';
import 'package:treinamento/widgets/remove_popup.dart';
import 'package:treinamento/widgets/subheader.dart';
import 'package:treinamento/widgets/users_list.dart';
import 'package:treinamento/database/db_connection.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  bool _isSwitched = false;

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
                rightIcon: null,
              ),

              SwitchCustom(
                text: 'Alterar sequência de inspeção',
              ),

              

            ],
          ),
        ),
    );
  }
}