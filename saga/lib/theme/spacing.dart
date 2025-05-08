import 'package:flutter/material.dart';
import 'package:saga/theme/base.dart';

/// Spacing values for the Prism theme.
class PrismSpacing {
  /// Creates a new instance of [PrismSpacing].
  const PrismSpacing();

  /// Horizontal spacing XXS.
  SizedBox get xXXS => SizedBox(width: base.xxs);

  /// Horizontal spacing XS.
  SizedBox get xXS => SizedBox(width: base.xs);

  /// Horizontal spacing S.
  SizedBox get xS => SizedBox(width: base.s);

  /// Horizontal spacing M.
  SizedBox get xM => SizedBox(width: base.m);

  /// Horizontal spacing L.
  SizedBox get xL => SizedBox(width: base.l);

  /// Horizontal spacing XL.
  SizedBox get xXL => SizedBox(width: base.xl);

  /// Horizontal spacing XXL.
  SizedBox get xXXL => SizedBox(width: base.xxl);

  /// Horizontal spacing XXXL.
  SizedBox get xXXXL => SizedBox(width: base.xxxl);

  /// Vertical spacing XXS.
  SizedBox get yXXS => SizedBox(height: base.xxs);

  /// Vertical spacing XS.
  SizedBox get yXS => SizedBox(height: base.xs);

  /// Vertical spacing S.
  SizedBox get yS => SizedBox(height: base.s);

  /// Vertical spacing M.
  SizedBox get yM => SizedBox(height: base.m);

  /// Vertical spacing L.
  SizedBox get yL => SizedBox(height: base.l);

  /// Vertical spacing XL.
  SizedBox get yXL => SizedBox(height: base.xl);

  /// Vertical spacing XXL.
  SizedBox get yXXL => SizedBox(height: base.xxl);

  /// Vertical spacing XXXL.
  SizedBox get yXXXL => SizedBox(height: base.xxxl);
}
