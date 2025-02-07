import "package:flutter/widgets.dart";

/// A widget that represents an item in an [AdaptiveDrawer].
class AdaptiveDrawerItem {
  /// Creates a new [AdaptiveDrawerItem].
  AdaptiveDrawerItem({
    required this.collapsedBuilder,
    required this.expandedBuilder,
  });

  /// The builder for the collapsed state.
  Widget Function(BuildContext context) collapsedBuilder;

  /// The builder for the expanded state.
  Widget Function(BuildContext context) expandedBuilder;
}
