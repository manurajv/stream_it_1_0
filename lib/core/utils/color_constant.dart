import 'dart:ui';
import 'package:flutter/material.dart';

class ColorConstant {
  static Color black9007f = fromHex('#7f000000');

  static Color gray5001 = fromHex('#fafcff');

  static Color gray5002 = fromHex('#f8f9fa');

  static Color black900B2 = fromHex('#b2000000');

  static Color red700 = fromHex('#d03329');

  static Color blueA700 = fromHex('#0061ff');

  static Color lightBlue100 = fromHex('#b0e5fc');

  static Color red200 = fromHex('#fa9a9a');

  static Color greenA100 = fromHex('#b5eacd');

  static Color black9003f = fromHex('#3f000000');

  static Color gray50 = fromHex('#f9fbff');

  static Color black90000 = fromHex('#00000000');

  static Color black900 = fromHex('#000000');

  static Color blueGray700 = fromHex('#535763');

  static Color blueGray900 = fromHex('#262b35');

  static Color gray70011 = fromHex('#11555555');

  static Color gray400 = fromHex('#c4c4c4');

  static Color blueGray200 = fromHex('#bac1ce');

  static Color blueGray100 = fromHex('#d6dae2');

  static Color blueGray400 = fromHex('#74839d');

  static Color blue700 = fromHex('#1976d2');

  static Color amber500 = fromHex('#feb909');

  static Color gray900 = fromHex('#2a2a2a');

  static Color gray200 = fromHex('#efefef');

  static Color whiteA70000 = fromHex('#00ffffff');

  static Color blueGray1006c = fromHex('#6cd1d3d4');

  static Color black90099 = fromHex('#99000000');

  static Color blueGray40001 = fromHex('#888888');

  static Color whiteA700 = fromHex('#ffffff');

  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}
