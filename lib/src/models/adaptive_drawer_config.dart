import "package:flutter/material.dart";

/// Configuration for the [AdaptiveDrawer].
class AdaptiveDrawerConfig {
  /// Creates a new [AdaptiveDrawerConfig].
  AdaptiveDrawerConfig({
    this.expandedWidth = 400,
    this.collapsedWidth = 100,
    this.height,
    this.animationDuration = const Duration(milliseconds: 200),
    this.animationCurve = Curves.easeInOut,
    this.smallScreenWidthBound = 600,
    this.buttonAlignment = Alignment.topRight,
    this.buttonBuilder,
    this.dividerIndent = 16,
    this.defaultButtonBackgroundColor = Colors.black,
    this.defaultButtonIconColor = Colors.white,
    this.defaultButtonExpandedIcon = Icons.chevron_left,
    this.defaultButtonCollapsedIcon = Icons.chevron_right,
    this.dividerColor,
    this.backgroundColor,
    this.drawerMargin = EdgeInsets.zero,
  });

  /// The width of the drawer when expanded.
  final double expandedWidth;

  /// The width of the drawer when collapsed.
  final double collapsedWidth;

  /// The height of the drawer.
  final double? height;

  /// The background color of the drawer.
  final Color? backgroundColor;

  /// The duration of the animation.
  final Duration animationDuration;

  /// The curve of the animation.
  final Curve animationCurve;

  /// The width at which the screen is considered small.
  final int smallScreenWidthBound;

  /// The alignment of the button that toggles the drawer.
  final Alignment buttonAlignment;

  /// The builder for the button that toggles the drawer.
  final PreferredSizeWidget Function(
    BuildContext context,
  )? buttonBuilder;

  /// The background color of the default button.
  final Color defaultButtonBackgroundColor;

  /// The color of the icon on the default button.
  final Color defaultButtonIconColor;

  /// The icon to display when the drawer is expanded.
  final IconData defaultButtonExpandedIcon;

  /// The icon to display when the drawer is collapsed.
  final IconData defaultButtonCollapsedIcon;

  /// The indent of the divider.
  final double? dividerIndent;

  /// The color of the divider.
  final Color? dividerColor;

  /// The margin of the drawer.
  final EdgeInsets drawerMargin;
}
