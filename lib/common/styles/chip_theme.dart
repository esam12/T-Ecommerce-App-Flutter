import 'package:eco/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class TChipTheme {
  TChipTheme._();

  static ChipThemeData lightChipTheme = ChipThemeData(
      disabledColor: TColors.grey.withOpacity(0.4),
      labelStyle: const TextStyle(color: TColors.black),
      selectedColor: TColors.primary,
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12.0),
      checkmarkColor: TColors.white);
  static ChipThemeData darkChipTheme = ChipThemeData(
      disabledColor: TColors.darkerGrey,
      labelStyle: const TextStyle(color: TColors.white),
      selectedColor: TColors.primary,
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12.0),
      checkmarkColor: TColors.white);
}
