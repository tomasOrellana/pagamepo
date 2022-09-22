import 'package:flutter/material.dart';
import 'package:oepaga/theme/index.dart';

class ThemeTexts {
  static FontWeight regular = FontWeight.w400;
  static FontWeight medium = FontWeight.w500;
  static FontWeight semibold = FontWeight.w600;
  static FontWeight bold = FontWeight.w700;

  static TextStyle getTextStyle(double X, FontWeight w, {Color? c}) {
    if (c == null) {
      return TextStyle(fontWeight: w, fontSize: X, color: ThemeColors.text);
    }
    return TextStyle(fontWeight: w, fontSize: X, color: c);
  }

  // Regular
  static TextStyle regular9({Color? c}) => getTextStyle(9, regular, c: c);
  static TextStyle regular10({Color? c}) => getTextStyle(10, regular, c: c);
  static TextStyle regular11({Color? c}) => getTextStyle(11, regular, c: c);
  static TextStyle regular12({Color? c}) => getTextStyle(12, regular, c: c);
  static TextStyle regular13({Color? c}) => getTextStyle(13, regular, c: c);
  static TextStyle regular14({Color? c}) => getTextStyle(14, regular, c: c);
  static TextStyle regular15({Color? c}) => getTextStyle(15, regular, c: c);
  static TextStyle regular16({Color? c}) => getTextStyle(16, regular, c: c);

  // Medium
  static TextStyle medium12({Color? c}) => getTextStyle(12, medium, c: c);
  static TextStyle medium16({Color? c}) => getTextStyle(16, medium, c: c);
  // Semibold
  static TextStyle semibold11({Color? c}) => getTextStyle(11, semibold, c: c);
  static TextStyle semibold12({Color? c}) => getTextStyle(12, semibold, c: c);
  static TextStyle semibold13({Color? c}) => getTextStyle(13, semibold, c: c);
  static TextStyle semibold14({Color? c}) => getTextStyle(14, semibold, c: c);
  static TextStyle semibold16({Color? c}) => getTextStyle(16, semibold, c: c);
  static TextStyle semibold18({Color? c}) => getTextStyle(18, semibold, c: c);

  // Bold
  static TextStyle bold10({Color? c}) => getTextStyle(10, bold, c: c);
  static TextStyle bold11({Color? c}) => getTextStyle(11, bold, c: c);
  static TextStyle bold12({Color? c}) => getTextStyle(12, bold, c: c);
  static TextStyle bold13({Color? c}) => getTextStyle(13, bold, c: c);
  static TextStyle bold14({Color? c}) => getTextStyle(14, bold, c: c);
  static TextStyle bold15({Color? c}) => getTextStyle(15, bold, c: c);
  static TextStyle bold16({Color? c}) => getTextStyle(16, bold, c: c);
  static TextStyle bold18({Color? c}) => getTextStyle(18, bold, c: c);
  static TextStyle bold24({Color? c}) => getTextStyle(24, bold, c: c);
  static TextStyle bold30({Color? c}) => getTextStyle(30, bold, c: c);
}
