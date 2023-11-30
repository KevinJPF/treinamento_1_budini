import 'dart:async';
import 'package:flutter/material.dart';
import 'package:treinamento/database/db_connection.dart';
import 'package:treinamento/widgets/app_theme.dart';

Future<void>  RemovePopup (BuildContext context) async  {

    await showDialog(
      context: context,
      builder: (BuildContext context) { 
        return AlertDialog(
          title: Text('Concluído', style: AppTheme.customTextStyles['medium-18']),
          backgroundColor: AppTheme.customColors['white-100'],
          content: Text('Sequência de inspeção definida com sucesso.', style: AppTheme.customTextStyles['regular-14-100'],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Voltar', style: AppTheme.customTextStyles['regular-14-100']),
            ),
        ],
      );
      }
    );
}
