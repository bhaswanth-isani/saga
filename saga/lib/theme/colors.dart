import 'package:flutter/material.dart';

/// Colors of Prism theme.
class PrismColors {
  /// Creates a new instance of [PrismColors].
  const PrismColors({
    required this.primary,
    required this.background,
    required this.surface,
    required this.widget,
    required this.text,
    required this.border,
    required this.basic,
  });

  /// Creates a new instance of [PrismColors] with light theme.
  factory PrismColors.light() => _lightTheme;

  /// Creates a new instance of [PrismColors] with dark theme.
  factory PrismColors.dark() => _darkTheme;

  /// Primary colors of the theme.
  final Color primary;

  /// Background color of the theme.
  final Color background;

  /// Surface color of the theme.
  final Color surface;

  /// Widget colors of the theme.
  final WidgetColors widget;

  /// Text colors of the theme.
  final TextColors text;

  /// Border colors of the theme.
  final BorderColors border;

  /// Basic colors of the theme.
  final BasicColors basic;
}

/// Widget colors of the theme.
class WidgetColors {
  /// Creates a new instance of [WidgetColors].
  const WidgetColors({required this.primary, required this.hover, required this.active});

  /// Widget primary color of the theme.
  final Color primary;

  /// Widget primary color when hovered.
  final Color hover;

  /// Widget primary color when active.
  final Color active;
}

/// Text colors of the theme.
class TextColors {
  /// Creates a new instance of [TextColors].
  const TextColors({
    required this.onPrimary,
    required this.primary,
    required this.secondary,
    required this.property,
    required this.disabled,
  });

  /// Text color on primary color of the theme.
  final Color onPrimary;

  /// Text color of the theme.
  final Color primary;

  /// Secondary text color of the theme.
  final Color secondary;

  /// Text color for property panel label.
  final Color property;

  /// Disabled text color of the theme.
  final Color disabled;
}

/// Border colors of the theme.
class BorderColors {
  /// Creates a new instance of [BorderColors].
  const BorderColors({required this.primary, required this.hover, required this.active});

  /// Border color of the theme.
  final Color primary;

  /// Border color when hovered.
  final Color hover;

  /// Border color when active.
  final Color active;
}

/// Basic colors of the theme.
class BasicColors {
  /// Creates a new instance of [BasicColors].
  const BasicColors({
    required this.red,
    required this.green,
    required this.blue,
    required this.yellow,
    required this.purple,
    required this.orange,
    required this.onBasic,
  });

  /// Red color of the theme.
  final Color red;

  /// Green color of the theme.
  final Color green;

  /// Blue color of the theme.
  final Color blue;

  /// Yellow color of the theme.
  final Color yellow;

  /// Purple color of the theme.
  final Color purple;

  /// Orange color of the theme.
  final Color orange;

  /// Color on other color of the theme.
  final Color onBasic;
}

const _basic = BasicColors(
  red: Color(0xFFf94144),
  green: Color(0xFF06d6a0),
  blue: Color(0xFF1FA2FF),
  yellow: Color(0xFFF7B801),
  purple: Color(0xFF6e79ff),
  orange: Color(0xFFF37335),
  onBasic: Colors.white,
);

const _lightTheme = PrismColors(
  primary: Color(0xFF171717),
  background: Color(0xFFFAFAFA),
  surface: Color(0xFFFFFFFF),
  widget: WidgetColors(
    primary: Color(0xFFF3F3F3),
    hover: Color(0xFFEBEBEB),
    active: Color(0xFFE6E5E5),
  ),
  text: TextColors(
    onPrimary: Color(0xFFFFFFFF),
    primary: Color(0xFF242424),
    secondary: Color(0xFF999999),
    property: Color(0xFF666666),
    disabled: Color(0xFFBBBBBB),
  ),
  border: BorderColors(
    primary: Color(0xFFEBEBEB),
    hover: Color(0xFFC9C9C9),
    active: Color(0xFFA8A8A8),
  ),
  basic: _basic,
);

const _darkTheme = PrismColors(
  primary: Color(0xFFEDEDED),
  background: Color(0xFF1D1D1D),
  surface: Color(0xFF111111),
  widget: WidgetColors(
    primary: Color(0xFF2B2B2B),
    hover: Color(0xFF1F1F1F),
    active: Color(0xFF333333),
  ),
  text: TextColors(
    onPrimary: Color(0xFF0A0A0A),
    primary: Color(0xFFEDEDED),
    secondary: Color(0xFF999999),
    property: Color(0xFFCCCCCC),
    disabled: Color(0xFF777777),
  ),
  border: BorderColors(
    primary: Color(0xFF2E2E2E),
    hover: Color(0xFF454545),
    active: Color(0xFF878787),
  ),
  basic: _basic,
);
