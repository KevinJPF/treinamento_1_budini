import 'package:flutter/material.dart';
import 'package:treinamento/widgets/app_theme.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controllerText;
  final String hintText;
  final String titleText;
  final bool isPassword;
  final bool removeSpaces;
  const CustomTextField(
      {super.key,
      required this.controllerText,
      required this.hintText,
      required this.isPassword, 
      required this.removeSpaces, 
      required this.titleText});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        // width: MediaQuery.of(context).size.width,
        // height: 70,
        decoration: BoxDecoration(
          color: Colors.white, // Cor de fundo
          borderRadius: BorderRadius.circular(8), // Border radius
        ),
        child: Column(
          children: [
            Container(
              alignment: Alignment.bottomLeft,
              margin: EdgeInsets.only(bottom: 4),
              child: Text(
                titleText,
                style: AppTheme.customTextStyles['regular-14'],
                )
            ),
            Container(
              height: 48,
              child: TextField(
                controller: controllerText,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.only(left: 16),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: AppTheme.customColors['dark-blue-12']!,
                      width: 2.0,
                    ),
                  ),
                  hintText: hintText,
                  hintStyle: AppTheme.customTextStyles['regular-14-54'],
                ),
                style: AppTheme.customTextStyles['regular-14-100'],
                onChanged: (text) {
                  // Remove espaços em branco
                  if (!isPassword && removeSpaces) {
                    final textWithoutSpaces = text.replaceAll(' ', '');
                    if (text != textWithoutSpaces) {
                      controllerText.value = TextEditingValue(
                        text: textWithoutSpaces,
                        selection:
                            TextSelection.collapsed(offset: textWithoutSpaces.length),
                      );
                    }
                  }
                },
                obscureText: isPassword,
              ),
            ),
          ],
        ),
      ),
    );
  }
}