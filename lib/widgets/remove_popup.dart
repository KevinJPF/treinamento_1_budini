import 'dart:async';
import 'package:flutter/material.dart';
import 'package:treinamento/database/db_connection.dart';
import 'package:treinamento/widgets/app_theme.dart';

Future<void>  RemovePopup (BuildContext context, int indexPessoa, String nome) async  {

  void removerPessoa(int indexPessoa, String nome) {
      DatabaseConnection().deleteItem(indexPessoa);
  }

    await showDialog(
      context: context,
      builder: (BuildContext context) { 
        return AlertDialog(
          title: Text('AVISO', style: AppTheme.customTextStyles['medium-18']),
          backgroundColor: AppTheme.customColors['white-100'],
          content: Text('Tem certeza que deseja excluir a pessoa "$nome"?', style: AppTheme.customTextStyles['regular-14-100'],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Cancelar', style: AppTheme.customTextStyles['regular-14-100']),
            ),
            TextButton(
            onPressed: () {
              removerPessoa(indexPessoa, nome);
              Navigator.pop(context);
            },
            child: Text('Confirmar', style: AppTheme.customTextStyles['regular-14-100']),
          ),
        ],
      );
      }
    );
}
