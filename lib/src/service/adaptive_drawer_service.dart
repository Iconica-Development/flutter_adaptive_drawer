import "package:flutter/material.dart";
import "package:flutter_adaptive_drawer/src/models/adaptive_drawer_config.dart";

/// A service to control the [AdaptiveDrawer].
/// [AdaptiveDrawerService] must be a descendant of [AdaptiveDrawer].
/// When using [AdaptiveDrawerScaffold], [AdaptiveDrawerService] is
/// automatically added to the widget tree.
class AdaptiveDrawerService extends InheritedWidget {
  /// Creates a new [AdaptiveDrawerService].
  const AdaptiveDrawerService({
    required this.controller,
    required this.animation,
    required this.config,
    required super.child,
    super.key,
  });

  /// The controller for the drawer animation.
  final AnimationController controller;

  /// The animation for the drawer.
  final Animation<double> animation;

  /// The configuration for the drawer.
  final AdaptiveDrawerConfig config;

  /// Gets the [AdaptiveDrawerService] from the [BuildContext].
  static AdaptiveDrawerService? of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<AdaptiveDrawerService>();

  /// Animates the drawer.
  void animate() {
    if (controller.isAnimating) return;

    if (controller.status == AnimationStatus.completed) {
      controller.reverse();
    } else {
      controller.forward();
    }
  }

  /// Gets if the drawer is collapsed.
  bool get isCollapsed => controller.status.isCompleted;

  /// Gets if the drawer is expanded.
  bool get isExpanded => controller.status.isDismissed;

  @override
  bool updateShouldNotify(AdaptiveDrawerService oldWidget) =>
      oldWidget.isCollapsed != isCollapsed;
}
