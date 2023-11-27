import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String buttonText;
  const CustomButton(
      {super.key, required this.buttonText, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        minimumSize: MaterialStateProperty.all(
            Size(MediaQuery.of(context).size.width - 80, 50)),
        backgroundColor: const MaterialStatePropertyAll(
          Color.fromARGB(255, 236, 235, 235),
        ),
        foregroundColor: const MaterialStatePropertyAll(
          Color.fromRGBO(0, 0, 0, 1),
        ),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
        ),
      ),
      child: Text(buttonText),
    );
  }
}