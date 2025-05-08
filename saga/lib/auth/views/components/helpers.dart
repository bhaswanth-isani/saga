import 'package:flutter/material.dart';
import 'package:saga/theme/theme.dart';

/// The size of the widget.
enum WidgetSize {
  /// A small widget.
  small,

  /// A medium widget.
  medium,

  /// A large widget.
  large;

  /// Size of the loader
  double get loaderSize => switch (this) {
    WidgetSize.small => 18,
    WidgetSize.medium => 22,
    WidgetSize.large => 26,
  };

  /// Padding for property field.
  EdgeInsets get propertyPadding => Prism.padding.xS + const EdgeInsets.symmetric(vertical: 5.5);

  /// The padding for the button.
  EdgeInsets get padding => switch (this) {
    WidgetSize.small => Prism.padding.s,
    WidgetSize.medium || WidgetSize.large => Prism.padding.xL + Prism.padding.yM,
  };

  /// The text style for the widget.
  TextStyle textStyle(BuildContext context) => switch (this) {
    WidgetSize.small => Prism.text(context).bodySmall,
    WidgetSize.medium => Prism.text(context).bodyMedium,
    WidgetSize.large => Prism.text(context).bodyLarge,
  };

  /// The text style for table header.
  TextStyle headerStyle(BuildContext context) => switch (this) {
    WidgetSize.small => Prism.text(context).labelExtraSmall,
    WidgetSize.medium => Prism.text(context).labelSmall,
    WidgetSize.large => Prism.text(context).labelMedium,
  };

  /// The text style for the label.
  TextStyle labelTextStyle(BuildContext context) => switch (this) {
    WidgetSize.small => Prism.text(context).labelSmall,
    WidgetSize.medium => Prism.text(context).labelMedium,
    WidgetSize.large => Prism.text(context).labelLarge,
  };

  /// The border radius for the widget.
  BorderRadius get radius => switch (this) {
    WidgetSize.small || WidgetSize.medium => Prism.radius.xs,
    WidgetSize.large => Prism.radius.s,
  };

  /// The icon size for hints.
  double get hintIconSize => switch (this) {
    WidgetSize.small => 12,
    WidgetSize.medium => 14,
    WidgetSize.large => 16,
  };

  /// The icon padding for the button.
  EdgeInsets get iconPadding => const EdgeInsets.all(9);

  /// The spacing between widgets.
  double get spacing => Prism.base.s;

  /// The spacing between widgets.
  double get helperSpacing => Prism.base.xxs;

  /// The icon size for the helper.
  double get helperIconSize => switch (this) {
    WidgetSize.small => 12,
    WidgetSize.medium => 16,
    WidgetSize.large => 20,
  };

  /// The icon size for the button.
  double get iconSize => switch (this) {
    WidgetSize.small => 16,
    WidgetSize.medium => 20,
    WidgetSize.large => 24,
  };
}
