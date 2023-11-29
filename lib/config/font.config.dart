import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_dev_project/config/colors.config.dart';

class AppTextStyles {
  static TextStyle title = TextStyle(
      fontSize: 26,
      fontFamily: GoogleFonts.montserrat().fontFamily,
      fontWeight: FontWeight.w600,
      color: AppColors.dark);

  static TextStyle subtitle = TextStyle(
      fontSize: 20,
      fontFamily: GoogleFonts.montserrat().fontFamily,
      fontWeight: FontWeight.bold,
      color: AppColors.dark);

  static TextStyle text = TextStyle(
      fontSize: 16,
      fontFamily: GoogleFonts.montserrat().fontFamily,
      fontWeight: FontWeight.normal,
      color: AppColors.dark);
}
