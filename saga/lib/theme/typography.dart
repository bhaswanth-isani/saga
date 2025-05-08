import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:saga/theme/colors.dart';

/// A class that defines the typography styles for the Prism theme.
class PrismTypography {
  /// Creates a new instance of [PrismTypography].
  const PrismTypography({
    required this.displaySmall,
    required this.titleLarge,
    required this.titleMedium,
    required this.titleSmall,
    required this.bodyLarge,
    required this.bodyMedium,
    required this.bodySmall,
    required this.bodyExtraSmall,
    required this.labelLarge,
    required this.labelMedium,
    required this.labelSmall,
    required this.labelExtraSmall,
  });

  /// Creates a basic instance of [PrismTypography] based on the brightness.
  factory PrismTypography.basic(Brightness brightness) {
    final color =
        brightness == Brightness.light
            ? PrismColors.light().text.primary
            : PrismColors.dark().text.primary;
    return PrismTypography(
      displaySmall: GoogleFonts.poppins(fontSize: 32, fontWeight: FontWeight.w600, color: color),
      titleLarge: GoogleFonts.poppins(fontSize: 32, fontWeight: FontWeight.w500, color: color),
      titleMedium: GoogleFonts.poppins(fontSize: 24, fontWeight: FontWeight.w500, color: color),
      titleSmall: GoogleFonts.domine(fontSize: 28, fontWeight: FontWeight.w500, color: color),
      bodyLarge: GoogleFonts.domine(fontSize: 18, fontWeight: FontWeight.w400, color: color),
      bodyMedium: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w400, color: color),
      bodySmall: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w400, color: color),
      bodyExtraSmall: GoogleFonts.poppins(fontSize: 12, fontWeight: FontWeight.w400, color: color),
      labelLarge: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w500, color: color),
      labelMedium: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w500, color: color),
      labelSmall: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w500, color: color),
      labelExtraSmall: GoogleFonts.poppins(fontSize: 12, fontWeight: FontWeight.w500, color: color),
    );
  }

  /// Text style for small display text.
  final TextStyle displaySmall;

  /// Text style for large titles.
  final TextStyle titleLarge;

  /// Text style for medium titles.
  final TextStyle titleMedium;

  /// Text style for small titles.
  final TextStyle titleSmall;

  /// Text style for large body text.
  final TextStyle bodyLarge;

  /// Text style for medium body text.
  final TextStyle bodyMedium;

  /// Text style for small body text.
  final TextStyle bodySmall;

  /// Text style for extra small body text.
  final TextStyle bodyExtraSmall;

  /// Text style for large labels.
  final TextStyle labelLarge;

  /// Text style for medium labels.
  final TextStyle labelMedium;

  /// Text style for small labels.
  final TextStyle labelSmall;

  /// Text style for extra small labels.
  final TextStyle labelExtraSmall;
}
