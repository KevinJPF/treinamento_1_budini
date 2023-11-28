import 'package:flutter/material.dart';

class AppTheme {

  static Map<String, Color> customColors = {
    'background-top': const Color(0xFF0A2430),
    'background-bottom': const Color(0xFF05455E),

    'principal-100': const Color(0xFF27F3ED),
    'principal-80': const Color(0xCC27F3ED),
    'principal-54': const Color(0x8A27F3ED),
    'principal-24': const Color(0x3D27F3ED),
    'principal-12': const Color(0x1F27F3ED),

    'white-100':const Color(0xFFFFFFFF),
    'white-80': const Color(0xCCFFFFFF),
    'white-54': const Color(0x8AFFFFFF),
    'white-24': const Color(0x3DFFFFFF),
    'white-12': const Color(0x1FFFFFFF),

    'dark-blue-100':const Color(0xFF2D3442),
    'dark-blue-80': const Color(0xCC2D3442),
    'dark-blue-54': const Color(0x8A2D3442),
    'dark-blue-24': const Color(0x3D2D3442),
    'dark-blue-12': const Color(0x1F2D3442),

    'green-100':const Color(0xFF00FFC4),
    'green-80': const Color(0xCC00FFC4),
    'green-54': const Color(0x8A00FFC4),
    'green-24': const Color(0x3D00FFC4),
    'green-12': const Color(0x1F00FFC4),

    'red-100':const Color(0xFFF32766),
    'red-80': const Color(0xCCF32766),
    'red-54': const Color(0x8AF32766),
    'red-24': const Color(0x3DF32766),
    'red-12': const Color(0x1FF32766),

    'yellow-100':const Color(0xFFFFCC00),
    'yellow-80': const Color(0xCCFFCC00),
    'yellow-54': const Color(0x8AFFCC00),
    'yellow-24': const Color(0x3DFFCC00),
    'yellow-12': const Color(0x1FFFCC00),
  };

  static Map<String, TextStyle> customTextStyles = {
    'bold-48': TextStyle(
      fontFamily: 'Poppins',
      fontSize: 48.0,
      fontWeight: FontWeight.w700,
      color: customColors['white-100']!,
    ),
    'medium-34': TextStyle(
      fontFamily: 'Poppins',
      fontSize: 34.0,
      fontWeight: FontWeight.w600,
      color: customColors['white-100']!,
    ),
    'medium-20': TextStyle(
      fontFamily: 'Poppins',
      fontSize: 20.0,
      fontWeight: FontWeight.w600,
      color: customColors['white-100']!,
    ),
    'medium-18': TextStyle(
      fontFamily: 'Poppins',
      fontSize: 18.0,
      fontWeight: FontWeight.w600,
      color: customColors['dark-blue-100']!,
    ),
    'medium-14': TextStyle(
      fontFamily: 'Poppins',
      fontSize: 14.0,
      fontWeight: FontWeight.w600,
      color: customColors['white-100']!,
    ),
    'regular-11': TextStyle(
      fontFamily: 'Poppins',
      fontSize: 11.0,
      fontWeight: FontWeight.w400,
      color: customColors['white-54']!,
    ),
    'regular-24': TextStyle(
      fontFamily: 'Poppins',
      fontSize: 24.0,
      fontWeight: FontWeight.w400,
      color: customColors['white-100']!,
    ),
    'regular-24-highlight': TextStyle(
      fontFamily: 'Poppins',
      fontSize: 24.0,
      fontWeight: FontWeight.w400,
      color: customColors['principal-100']!,
    ),
    'regular-34-highlight': TextStyle(
      fontFamily: 'Poppins',
      fontSize: 34.0,
      fontWeight: FontWeight.w400,
      color: customColors['principal-100']!,
    ),
    
    'regular-14': TextStyle(
      fontFamily: 'Poppins',
      fontSize: 14.0,
      fontWeight: FontWeight.w400,
      color: customColors['dark-blue-54']!,
    ),
    'regular-14-100': TextStyle(
      fontFamily: 'Poppins',
      fontSize: 14.0,
      fontWeight: FontWeight.w600,
      color: customColors['dark-blue-100']!,
    ),
    'regular-14-54': TextStyle(
      fontFamily: 'Poppins',
      fontSize: 14.0,
      fontWeight: FontWeight.w600,
      color: customColors['dark-blue-54']!,
    ),
  };
  
  static ThemeData lightTheme = ThemeData(
    primaryColor: Colors.blue,
    hintColor: Colors.orange,
    // Adicione outras propriedades do tema conforme necessário
  );

  static ThemeData darkTheme = ThemeData(
    primaryColor: Colors.indigo,
    hintColor: Colors.amber,
    brightness: Brightness.dark,
    // Adicione outras propriedades do tema conforme necessário
  );
}
