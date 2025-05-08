import 'package:flutter/material.dart';
import 'package:saga/theme/base.dart';
import 'package:saga/theme/colors.dart';
import 'package:saga/theme/padding.dart';
import 'package:saga/theme/radius.dart';
import 'package:saga/theme/spacing.dart';
import 'package:saga/theme/typography.dart';

class Prism {
  const Prism._();

  /// Returns the [PrismColors] for the current theme.
  static PrismColors colors(BuildContext context) =>
      Theme.of(context).brightness == Brightness.light ? PrismColors.light() : PrismColors.dark();

  /// Returns the [PrismTypography] for the current theme.
  static PrismTypography text(BuildContext context) =>
      PrismTypography.basic(Theme.of(context).brightness);

  /// Light theme for Prism.
  static final lightTheme = PrismColors.light();

  /// Dark theme for Prism.
  static final darkTheme = PrismColors.dark();

  /// Padding values for the Prism theme.
  static const padding = PrismPadding();

  /// Radius values for the Prism theme.
  static const radius = PrismRadius();

  /// Spacing values for the Prism theme.
  static const spacing = PrismSpacing();

  /// Base values for the Prism theme.
  static const base = PrismBase();
}
