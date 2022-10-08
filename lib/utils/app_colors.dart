import 'dart:ui';

class AppColors {
  static final green = Color(getColorHexFromStr('#86BE3C'));
  static final lightGreen = Color(getColorHexFromStr('#ECF8D1'));
  static final darkGreen = Color(getColorHexFromStr('#96C70C'));
  static final appGrey = Color(getColorHexFromStr('#EFEFEF'));
}

int getColorHexFromStr(String colorStr) {
  colorStr = "FF$colorStr";
  colorStr = colorStr.replaceAll("#", "");
  int val = 0;
  int len = colorStr.length;
  for (int i = 0; i < len; i++) {
    int hexDigit = colorStr.codeUnitAt(i);
    if (hexDigit >= 48 && hexDigit <= 57) {
      val += (hexDigit - 48) * (1 << (4 * (len - 1 - i)));
    } else if (hexDigit >= 65 && hexDigit <= 70) {
      // A..F
      val += (hexDigit - 55) * (1 << (4 * (len - 1 - i)));
    } else if (hexDigit >= 97 && hexDigit <= 102) {
      // a..f
      val += (hexDigit - 87) * (1 << (4 * (len - 1 - i)));
    } else {
      throw const FormatException("An error occurred when converting a color");
    }
  }
  return val;
}