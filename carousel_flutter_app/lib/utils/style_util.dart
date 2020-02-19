import 'package:carousel_flutter_app/utils/screen_util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StyleUtil {
  static TextStyle overline({Color cl, bool italic}) {
    return TextStyle(
      fontStyle: italic ?? false ? FontStyle.italic : FontStyle.normal,
      fontSize: ScreenUtil.getInstance().setSp(10),
      color: cl,
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle subtitle2({Color cl, bool italic}) {
    return TextStyle(
      fontStyle: italic ?? false ? FontStyle.italic : FontStyle.normal,
      fontSize: ScreenUtil.getInstance().setSp(14),
      color: cl,
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle subtitle({Color cl, bool italic}) {
    return TextStyle(
      fontStyle: italic ?? false ? FontStyle.italic : FontStyle.normal,
      fontSize: ScreenUtil.getInstance().setSp(14),
      color: cl,
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle button2({Color cl, bool italic}) {
    return TextStyle(
      fontStyle: italic ?? false ? FontStyle.italic : FontStyle.normal,
      fontSize: ScreenUtil.getInstance().setSp(14),
      color: cl,
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle button({Color cl, bool italic}) {
    return TextStyle(
      fontStyle: italic ?? false ? FontStyle.italic : FontStyle.normal,
      fontSize: ScreenUtil.getInstance().setSp(14),
      color: cl,
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle caption({Color cl, bool italic}) {
    return TextStyle(
      fontStyle: italic ?? false ? FontStyle.italic : FontStyle.normal,
      fontSize: ScreenUtil.getInstance().setSp(12),
      color: cl,
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle body1({Color cl, bool italic}) {
    return TextStyle(
      fontStyle: italic ?? false ? FontStyle.italic : FontStyle.normal,
      fontSize: ScreenUtil.getInstance().setSp(14),
      color: cl,
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle body3({Color cl, bool italic}) {
    return TextStyle(
      fontStyle: italic ?? false ? FontStyle.italic : FontStyle.normal,
      fontSize: ScreenUtil.getInstance().setSp(14),
      color: cl,
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle body2({Color cl, bool italic}) {
    return TextStyle(
      fontStyle: italic ?? false ? FontStyle.italic : FontStyle.normal,
      fontSize: ScreenUtil.getInstance().setSp(14),
      color: cl,
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle subhead({Color cl, bool italic}) {
    return TextStyle(
      fontStyle: italic ?? false ? FontStyle.italic : FontStyle.normal,
      fontSize: ScreenUtil.getInstance().setSp(16),
      color: cl,
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle subhead2({Color cl, bool italic}) {
    return TextStyle(
      fontStyle: italic ?? false ? FontStyle.italic : FontStyle.normal,
      fontSize: ScreenUtil.getInstance().setSp(16),
      color: cl,
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle title2({Color cl, bool italic}) {
    return TextStyle(
      fontStyle: italic ?? false ? FontStyle.italic : FontStyle.normal,
      fontSize: ScreenUtil.getInstance().setSp(20),
      color: cl,
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle title({Color cl, bool italic}) {
    return TextStyle(
      fontStyle: italic ?? false ? FontStyle.italic : FontStyle.normal,
      fontSize: ScreenUtil.getInstance().setSp(20),
      color: cl,
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle headline({Color cl, bool italic}) {
    return TextStyle(
      fontStyle: italic ?? false ? FontStyle.italic : FontStyle.normal,
      fontSize: ScreenUtil.getInstance().setSp(24),
      color: cl,
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle display1({Color cl, bool italic}) {
    return TextStyle(
      fontStyle: italic ?? false ? FontStyle.italic : FontStyle.normal,
      fontSize: ScreenUtil.getInstance().setSp(34),
      color: cl,
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle display1Bold({Color cl, bool italic}) {
    return TextStyle(
      fontStyle: italic ?? false ? FontStyle.italic : FontStyle.normal,
      fontSize: ScreenUtil.getInstance().setSp(34),
      color: cl,
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle display2({Color cl, bool italic}) {
    return TextStyle(
      fontStyle: italic ?? false ? FontStyle.italic : FontStyle.normal,
      fontSize: ScreenUtil.getInstance().setSp(45),
      color: cl,
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle display3({Color cl, bool italic}) {
    return TextStyle(
      fontStyle: italic ?? false ? FontStyle.italic : FontStyle.normal,
      fontSize: ScreenUtil.getInstance().setSp(56),
      color: cl,
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle display4({Color cl, bool italic}) {
    return TextStyle(
      fontStyle: italic ?? false ? FontStyle.italic : FontStyle.normal,
      fontSize: ScreenUtil.getInstance().setSp(112),
      color: cl,
      fontWeight: FontWeight.w100,
    );
  }
}
