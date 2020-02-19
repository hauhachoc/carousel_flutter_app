import 'package:flutter/material.dart';

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));

  static int getColorHexFromStr(String colorStr) {
    colorStr = "FF" + colorStr;
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
        throw new FormatException("An error occurred when converting a color");
      }
    }
    return val;
  }
}

  

final String primaryColor = "#00bbcb";
final String primaryGadient1 = "#3f7dbc";
final String primaryGadient2 = "#8cb3d9";
final String acentColor = "#00bbcb";
final String facebookColor = "#38558f";
final String googleColor = "#dc3545";

final String textInputColor = "#595959";
final String textHintColor = "#acacac";

final String black = "#000000";
final String white = "#ffffff";

final String borderColor = "#eaeef0";
final String inputBorderColor = "#8e9199";
final String backgroundColor = "#fafafa";
final String backgroundColor2 = "#ececec";
final String backgroundActionColor = "#fef2f2";
final String backgroundHeaderShipmentItem = "#eaf7f7";
final String backgroundEnable = "#f2f2f2";

final String pointFromToColor = "#d5d6da";
final String newShipmentColor = "#77bfe8";

final String titleTextColor = "#757a86";
final String contentTextColor = "#757a86";
final String headerTextColor = "#adb2b6";
final String searchBorderColor = "#e9ecf2";
final String tabbarUnselectColor = "#575e6e";


final String iconBlue = "#01BCCD";
final String moneyGrey = "#818890";

final String userTop = "#F9F9F9";
final String blackBackground = "#2C2E31";