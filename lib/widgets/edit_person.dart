import 'package:flutter/material.dart';
import 'package:treinamento/database/db_connection.dart';
import 'package:treinamento/widgets/app_theme.dart';
import 'package:treinamento/widgets/custom_textfield.dart';

Future<void> EditPerson(BuildContext context, Map<String, dynamic> pessoa) async {
  TextEditingController nomeController = TextEditingController();
  TextEditingController enderecoController = TextEditingController();
  TextEditingController telefoneController = TextEditingController();


  final int idUser = pessoa['id_user'] as int;
  final String? userDateTime = pessoa['date_time'] as String?;
  nomeController.text = pessoa['user_name'] as String? ?? '';
  enderecoController.text = pessoa['user_address'] as String? ?? '';
  telefoneController.text = pessoa['user_phone'] as String? ?? '';

  await showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Center(child: Text('Editar Pessoa', style: AppTheme.customTextStyles['medium-18'],)),
        backgroundColor: AppTheme.customColors['white-100'],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0), 
          ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        content: Container(
          width: MediaQuery.of(context).size.width * 0.8,
          height: MediaQuery.of(context).size.height * 0.25,
          child: Column(
            children: [
              CustomTextField(
                controllerText: nomeController, 
                hintText: '', 
                titleText: 'Nome',
                isPassword: false, 
                removeSpaces: false
                ),
              CustomTextField(
                controllerText: enderecoController, 
                hintText: '', 
                titleText: 'Endereço',
                isPassword: false, 
                removeSpaces: false
                ),
              CustomTextField(
                controllerText: telefoneController, 
                hintText: '', 
                titleText: 'Telefone',
                isPassword: false, 
                removeSpaces: false
                ),
            ],
          ),
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
                final Map<String, dynamic> pessoaAtualizada = 
                  {'id_user': idUser, 'user_name': nomeController.text, 'user_address': enderecoController.text, 'user_phone': telefoneController.text, 'date_time': userDateTime};
                print(pessoaAtualizada);
                DatabaseConnection().updateItem(pessoaAtualizada);
                Navigator.pop(context);
            },
            child: Text('Confirmar', style: AppTheme.customTextStyles['regular-14-100']),
          ),
        ],
      );
    },
  );
}