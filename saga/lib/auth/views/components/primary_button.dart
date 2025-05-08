import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:saga/auth/views/components/helpers.dart';
import 'package:saga/helpers/duration.dart';
import 'package:saga/theme/theme.dart';

class CustomPrimaryButton extends HookWidget {
  const CustomPrimaryButton(
    this.label, {
    super.key,
    this.onTap,
    this.enabled = true,
    this.loading = false,
    this.size = WidgetSize.medium,
    this.expanded = false,
    this.suffixPrefix = const ButtonSuffixPrefix(),
  });

  final String label;
  final bool enabled;
  final bool loading;
  final VoidCallback? onTap;
  final WidgetSize size;
  final bool expanded;
  final ButtonSuffixPrefix suffixPrefix;

  @override
  Widget build(BuildContext context) {
    final buttonEnabled = enabled && !loading;
    final text = useMemoized(
      () => Text(
        label,
        style: size
            .labelTextStyle(context)
            .copyWith(
              color:
                  buttonEnabled
                      ? Prism.colors(context).text.onPrimary
                      : Prism.colors(context).text.disabled,
            ),
        textAlign: TextAlign.center,
      ),
      [buttonEnabled, label, Theme.of(context).brightness],
    );

    return GestureDetector(
      onTap: buttonEnabled ? onTap : null,
      child: AnimatedContainer(
        width: expanded ? double.infinity : null,
        duration: 100.milliseconds,
        padding: size.padding,
        alignment: expanded ? Alignment.center : null,
        decoration: BoxDecoration(
          color:
              buttonEnabled ? Prism.colors(context).primary : Prism.colors(context).widget.primary,
          borderRadius: size.radius,
          border: Border.all(color: Prism.colors(context).border.primary),
        ),
        child:
            loading
                ? SizedBox(
                  width: size.loaderSize,
                  height: size.loaderSize,
                  child: CircularProgressIndicator(
                    color: Prism.colors(context).text.disabled,
                    strokeWidth: 2,
                  ),
                )
                : Row(
                  mainAxisSize: expanded ? MainAxisSize.max : MainAxisSize.min,
                  mainAxisAlignment: expanded ? MainAxisAlignment.center : MainAxisAlignment.start,
                  children: [
                    if (suffixPrefix.prefix != null) ...[
                      Icon(
                        suffixPrefix.prefix,
                        size: size.iconSize,
                        color:
                            buttonEnabled
                                ? Prism.colors(context).text.onPrimary
                                : Prism.colors(context).text.disabled,
                      ),
                      Prism.spacing.xM,
                    ],
                    text,
                    if (suffixPrefix.suffix != null) ...[
                      Prism.spacing.xS,
                      Icon(
                        suffixPrefix.suffix,
                        size: size.iconSize,
                        color:
                            buttonEnabled
                                ? Prism.colors(context).text.onPrimary
                                : Prism.colors(context).text.disabled,
                      ),
                    ],
                  ],
                ),
      ),
    );
  }
}

/// Suffix and prefix for the button.
class ButtonSuffixPrefix {
  /// Suffix and prefix for the button.
  const ButtonSuffixPrefix({this.suffix, this.prefix});

  /// Suffix for the button.
  final IconData? suffix;

  /// Prefix for the button.
  final IconData? prefix;

  /// Whether the button has a prefix or suffix.
  bool get hasPrefixOrSuffix => suffix != null || prefix != null;
}
