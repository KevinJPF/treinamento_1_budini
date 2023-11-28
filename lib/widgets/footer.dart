import 'package:flutter/material.dart';
import 'package:treinamento/widgets/app_theme.dart';
import 'package:treinamento/widgets/custom_button.dart';
import 'package:treinamento/widgets/custom_textfield.dart';

class Footer extends StatelessWidget {

  final VoidCallback onPressed;
  final TextEditingController controllerUserName;
  final TextEditingController controllerAddress;
  final TextEditingController controllerTelephone;

  Footer({super.key, 
  required this.onPressed, 
  required this.controllerUserName, 
  required this.controllerAddress, 
  required this.controllerTelephone});

  @override
  Widget build(BuildContext context) {
    return 
      Container(
      color: AppTheme.customColors['white-100'],
      padding: EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 24),
      child: Column(
        children: [
          Row(
            children: [
              CustomTextField(
                controllerText: controllerUserName, 
                hintText: '', 
                titleText: 'nome',
                isPassword: false, 
                removeSpaces: false
              ),
              SizedBox(width: 24),
              CustomTextField(
                controllerText: controllerAddress, 
                hintText: '', 
                titleText: 'endereço',
                isPassword: false, 
                removeSpaces: false
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              CustomTextField(
                controllerText: controllerTelephone, 
                hintText: '', 
                titleText: 'telefone',
                isPassword: false, 
                removeSpaces: false
                ),
              SizedBox(width: 24),
              Expanded(
                child: Container(
                  height: 66,
                  alignment: Alignment.bottomCenter,
                  child: CustomButton(buttonText: 'adicionar', 
                  onPressed: onPressed,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
              );
  }
}