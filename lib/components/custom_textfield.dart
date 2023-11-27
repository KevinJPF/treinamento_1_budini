import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controllerText;
  final String hintText;
  final bool isPassword;
  final bool removeSpaces;
  const CustomTextField(
      {super.key,
      required this.controllerText,
      required this.hintText,
      required this.isPassword, 
      required this.removeSpaces});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 50,
      decoration: BoxDecoration(
        color: Colors.white, // Cor de fundo
        borderRadius: BorderRadius.circular(8), // Border radius
      ),
      child: TextField(
        controller: controllerText,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.only(left: 16),
          border: InputBorder.none,
          hintText: hintText,
          hintStyle: const TextStyle(color: Color.fromRGBO(25, 25, 25, 0.3)),
        ),
        style: const TextStyle(color: Colors.black),
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
    );
  }
}