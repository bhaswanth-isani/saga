import 'package:flutter/material.dart';
import 'package:saga/theme/base.dart';

/// Radius values for the Prism theme.
class PrismRadius {
  /// Creates a new instance of [PrismRadius].
  const PrismRadius();

  /// Right Radius XXS.
  BorderRadius get rXXS => BorderRadius.only(
    topRight: Radius.circular(base.xxs),
    bottomRight: Radius.circular(base.xxs),
  );

  /// Right Radius XS.
  BorderRadius get rXS =>
      BorderRadius.only(topRight: Radius.circular(base.xs), bottomRight: Radius.circular(base.xs));

  /// Right Radius S.
  BorderRadius get rS =>
      BorderRadius.only(topRight: Radius.circular(base.s), bottomRight: Radius.circular(base.s));

  /// Right Radius M.
  BorderRadius get rM =>
      BorderRadius.only(topRight: Radius.circular(base.m), bottomRight: Radius.circular(base.m));

  /// Right Radius L.
  BorderRadius get rL =>
      BorderRadius.only(topRight: Radius.circular(base.l), bottomRight: Radius.circular(base.l));

  /// Right Radius XL.
  BorderRadius get rXL =>
      BorderRadius.only(topRight: Radius.circular(base.xl), bottomRight: Radius.circular(base.xl));

  /// Right Radius XXL.
  BorderRadius get rXXL => BorderRadius.only(
    topRight: Radius.circular(base.xxl),
    bottomRight: Radius.circular(base.xxl),
  );

  /// Left Radius XXS.
  BorderRadius get lXXS =>
      BorderRadius.only(topLeft: Radius.circular(base.xxs), bottomLeft: Radius.circular(base.xxs));

  /// Left Radius XS.
  BorderRadius get lXS =>
      BorderRadius.only(topLeft: Radius.circular(base.xs), bottomLeft: Radius.circular(base.xs));

  /// Left Radius S.
  BorderRadius get lS =>
      BorderRadius.only(topLeft: Radius.circular(base.s), bottomLeft: Radius.circular(base.s));

  /// Left Radius M.
  BorderRadius get lM =>
      BorderRadius.only(topLeft: Radius.circular(base.m), bottomLeft: Radius.circular(base.m));

  /// Left Radius L.
  BorderRadius get lL =>
      BorderRadius.only(topLeft: Radius.circular(base.l), bottomLeft: Radius.circular(base.l));

  /// Left Radius XL.
  BorderRadius get lXL =>
      BorderRadius.only(topLeft: Radius.circular(base.xl), bottomLeft: Radius.circular(base.xl));

  /// Left Radius XXL.
  BorderRadius get lXXL =>
      BorderRadius.only(topLeft: Radius.circular(base.xxl), bottomLeft: Radius.circular(base.xxl));

  /// Top Radius XXS.
  BorderRadius get tXXS =>
      BorderRadius.only(topLeft: Radius.circular(base.xxs), topRight: Radius.circular(base.xxs));

  /// Top Radius XS.
  BorderRadius get tXS =>
      BorderRadius.only(topLeft: Radius.circular(base.xs), topRight: Radius.circular(base.xs));

  /// Top Radius S.
  BorderRadius get tS =>
      BorderRadius.only(topLeft: Radius.circular(base.s), topRight: Radius.circular(base.s));

  /// Top Radius M.
  BorderRadius get tM =>
      BorderRadius.only(topLeft: Radius.circular(base.m), topRight: Radius.circular(base.m));

  /// Top Radius L.
  BorderRadius get tL =>
      BorderRadius.only(topLeft: Radius.circular(base.l), topRight: Radius.circular(base.l));

  /// Top Radius XL.
  BorderRadius get tXL =>
      BorderRadius.only(topLeft: Radius.circular(base.xl), topRight: Radius.circular(base.xl));

  /// Top Radius XXL.
  BorderRadius get tXXL =>
      BorderRadius.only(topLeft: Radius.circular(base.xxl), topRight: Radius.circular(base.xxl));

  /// Bottom Radius XXS.
  BorderRadius get bXXS => BorderRadius.only(
    bottomLeft: Radius.circular(base.xxs),
    bottomRight: Radius.circular(base.xxs),
  );

  /// Bottom Radius XS.
  BorderRadius get bXS => BorderRadius.only(
    bottomLeft: Radius.circular(base.xs),
    bottomRight: Radius.circular(base.xs),
  );

  /// Bottom Radius S.
  BorderRadius get bS =>
      BorderRadius.only(bottomLeft: Radius.circular(base.s), bottomRight: Radius.circular(base.s));

  /// Bottom Radius M.
  BorderRadius get bM =>
      BorderRadius.only(bottomLeft: Radius.circular(base.m), bottomRight: Radius.circular(base.m));

  /// Bottom Radius L.
  BorderRadius get bL =>
      BorderRadius.only(bottomLeft: Radius.circular(base.l), bottomRight: Radius.circular(base.l));

  /// Bottom Radius XL.
  BorderRadius get bXL => BorderRadius.only(
    bottomLeft: Radius.circular(base.xl),
    bottomRight: Radius.circular(base.xl),
  );

  /// Bottom Radius XXL.
  BorderRadius get bXXL => BorderRadius.only(
    bottomLeft: Radius.circular(base.xxl),
    bottomRight: Radius.circular(base.xxl),
  );

  /// Circular Radius XXS.
  BorderRadius get xxs => BorderRadius.circular(base.xxs);

  /// Circular Radius XS.
  BorderRadius get xs => BorderRadius.circular(base.xs);

  /// Circular Radius S.
  BorderRadius get s => BorderRadius.circular(base.s);

  /// Circular Radius M.
  BorderRadius get m => BorderRadius.circular(base.m);

  /// Circular Radius L.
  BorderRadius get l => BorderRadius.circular(base.l);

  /// Circular Radius XL.
  BorderRadius get xl => BorderRadius.circular(base.xl);

  /// Circular Radius XXL.
  BorderRadius get xxl => BorderRadius.circular(base.xxl);
}
