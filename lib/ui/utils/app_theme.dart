import 'package:flutter/material.dart';
import 'package:muslim_app/ui/utils/app_colors.dart';

abstract class AppTheme{
  static const TextStyle appBarTitleTextStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold,
      color: AppColors.accent);
  static const TextStyle quranTabTitleTextStyle = TextStyle(fontSize: 25, fontWeight: FontWeight.w600,
      color: AppColors.accent);
}