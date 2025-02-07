import "package:flutter/material.dart";
import "package:flutter_adaptive_drawer/src/adaptive_drawer.dart";
import "package:flutter_adaptive_drawer/src/models/adaptive_drawer_config.dart";
import "package:flutter_adaptive_drawer/src/service/adaptive_drawer_service.dart";


/// A wrapper scaffold to use with [AdaptiveDrawer].
class AdaptiveDrawerScaffold extends StatefulWidget {
  /// Creates a new [AdaptiveDrawerScaffold].
  const AdaptiveDrawerScaffold({
    required this.child,
    required this.scaffoldBuilder,
    this.config,
    this.drawer,
    super.key,
  });

  /// The builder for the scaffold.
  /// [context] is the current [BuildContext].
  /// [drawer] is the [AdaptiveDrawer] widget.
  /// [isSmallScreen] is a boolean indicating if the screen is small.
  /// [child] is the main content of the scaffold.
  final Scaffold Function(
    BuildContext context, {
    required AdaptiveDrawer? drawer,
    required bool isSmallScreen,
    required Widget child,
  }) scaffoldBuilder;

  /// The drawer widget.
  final AdaptiveDrawer? drawer;

  /// The main content of the scaffold.
  final Widget child;

  /// The configuration for the drawer.
  final AdaptiveDrawerConfig? config;

  @override
  State<AdaptiveDrawerScaffold> createState() => _AdaptiveDrawerScaffoldState();
}

class _AdaptiveDrawerScaffoldState extends State<AdaptiveDrawerScaffold>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  late AdaptiveDrawerConfig config;

  @override
  void initState() {
    super.initState();
    config = widget.config ?? AdaptiveDrawerConfig();
    _controller = AnimationController(
      duration: config.animationDuration,
      vsync: this,
    );

    var tween = Tween<double>(
      begin: config.expandedWidth,
      end: config.collapsedWidth,
    );
    _animation = tween.animate(
      CurvedAnimation(
        parent: _controller,
        curve: config.animationCurve,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var isSmallScreen =
        MediaQuery.of(context).size.width < config.smallScreenWidthBound;

    return AdaptiveDrawerService(
      config: config,
      controller: _controller,
      animation: _animation,
      child: isSmallScreen
          ? widget.scaffoldBuilder.call(
              context,
              drawer: widget.drawer,
              isSmallScreen: isSmallScreen,
              child: widget.child,
            )
          : widget.scaffoldBuilder.call(
              context,
              drawer: null,
              isSmallScreen: isSmallScreen,
              child: Row(
                children: [
                  if (widget.drawer != null) ...[
                    widget.drawer!,
                  ],
                  Expanded(
                    child: widget.child,
                  ),
                ],
              ),
            ),
    );
  }
}
