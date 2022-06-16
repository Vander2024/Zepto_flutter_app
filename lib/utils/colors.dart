import 'dart:math';

import 'package:flutter/material.dart';

const primaryColor = Color(0xFF7155a2);
const secondaryColor = Color(0xFF5a428e);
const Color loginTermsLinkColor = Color(0xFF002E86);
const Color kcPrimaryColor = Color(0xff22A45D);
const Color kcMediumGreyColor = Color(0xff868686);
const Color kcLightGreyColor = Color(0xffe5e5e5);
const Color kcVeryLightGreyColor = Color(0xfff2f2f2);
const Color kcRedColor = Color(0xfff44336);
const Color kcOrangeColor = Color(0xffff9800);
const Color darkPinkColor = Color(0xff9B025B);

const Color myStatsColor = Color(0xff00A9FF);
const Color classAverageColor = Color(0xff9B025B);
const Color topperColor = Color(0xffFAC93E);

MaterialColor generateMaterialColor(Color color) {
  return MaterialColor(color.value, {
    50: tintColor(color, 0.9),
    100: tintColor(color, 0.8),
    200: tintColor(color, 0.6),
    300: tintColor(color, 0.4),
    400: tintColor(color, 0.2),
    500: color,
    600: shadeColor(color, 0.1),
    700: shadeColor(color, 0.2),
    800: shadeColor(color, 0.3),
    900: shadeColor(color, 0.4),
  });
}

int tintValue(int value, double factor) =>
    max(0, min((value + ((255 - value) * factor)).round(), 255));

Color tintColor(Color color, double factor) => Color.fromRGBO(
    tintValue(color.red, factor),
    tintValue(color.green, factor),
    tintValue(color.blue, factor),
    1);

int shadeValue(int value, double factor) =>
    max(0, min(value - (value * factor).round(), 255));

Color shadeColor(Color color, double factor) => Color.fromRGBO(
    shadeValue(color.red, factor),
    shadeValue(color.green, factor),
    shadeValue(color.blue, factor),
    1);
