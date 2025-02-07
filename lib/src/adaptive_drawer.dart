import "package:flutter/material.dart";
import "package:flutter_adaptive_drawer/src/models/adaptive_drawer_item.dart";
import "package:flutter_adaptive_drawer/src/service/adaptive_drawer_service.dart";
import "package:flutter_adaptive_drawer/src/widgets/default_button.dart";

/// A widget that displays a drawer that adapts to the screen size.
/// [AdaptiveDrawer] must be a descendant of [AdaptiveDrawerService].
class AdaptiveDrawer extends StatelessWidget {
  /// Creates a new [AdaptiveDrawer].
  const AdaptiveDrawer({
    this.topChildren,
    this.mainChildren,
    this.bottomChildren,
    super.key,
  });

  /// The children to display at the top of the drawer.
  final List<AdaptiveDrawerItem>? topChildren;

  /// The children to display in the main section of the drawer.
  final List<AdaptiveDrawerItem>? mainChildren;

  /// The children to display at the bottom of the drawer.
  final List<AdaptiveDrawerItem>? bottomChildren;

  @override
  Widget build(BuildContext context) {
    var service = AdaptiveDrawerService.of(context);

    if (service == null) {
      throw Exception(
        "AdaptiveDrawer must be a descendant of AdaptiveDrawerService",
      );
    }

    var isSmallScreen = MediaQuery.of(context).size.width <
        service.config.smallScreenWidthBound;

    return AnimatedBuilder(
      animation: service.animation,
      builder: (context, child) => SizedBox(
        width: service.animation.value,
        height: service.config.height ?? MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            Container(
              margin: EdgeInsets.only(
                top: service.config.drawerMargin.top,
                bottom: service.config.drawerMargin.bottom,
                left: service.config.drawerMargin.left,
                right: service.config.drawerMargin.right +
                    (service.config.buttonBuilder
                                ?.call(context)
                                .preferredSize
                                .width ??
                            DefaultButton(
                              isCollapsed: service.isCollapsed,
                            ).preferredSize.width) /
                        2,
              ), // button width / 2
              width: service.animation.value,
              height:
                  service.config.height ?? MediaQuery.of(context).size.height,
              color: service.config.backgroundColor ??
                  Theme.of(context).colorScheme.primary,
              child: Column(
                children: [
                  if (topChildren != null) ...[
                    if (service.isExpanded) ...[
                      ...topChildren?.map(
                            (item) => item.expandedBuilder(context),
                          ) ??
                          [],
                    ] else ...[
                      ...topChildren?.map(
                            (item) => item.collapsedBuilder(context),
                          ) ??
                          [],
                    ],
                    Divider(
                      indent: service.config.dividerIndent,
                      endIndent: service.config.dividerIndent,
                      color: service.config.dividerColor,
                    ),
                  ],
                  if (service.isExpanded) ...[
                    ...mainChildren?.map(
                          (item) => item.expandedBuilder(context),
                        ) ??
                        [],
                  ] else ...[
                    ...mainChildren?.map(
                          (item) => item.collapsedBuilder(context),
                        ) ??
                        [],
                  ],
                  const Spacer(),
                  if (bottomChildren != null) ...[
                    Divider(
                      indent: service.config.dividerIndent,
                      endIndent: service.config.dividerIndent,
                      color: service.config.dividerColor,
                    ),
                    if (service.isExpanded) ...[
                      ...bottomChildren?.map(
                            (item) => item.expandedBuilder(context),
                          ) ??
                          [],
                    ] else ...[
                      ...bottomChildren?.map(
                            (item) => item.collapsedBuilder(context),
                          ) ??
                          [],
                    ],
                  ],
                ],
              ),
            ),
            if (!isSmallScreen) ...[
              Container(
                margin: EdgeInsets.only(
                  top: service.config.drawerMargin.top,
                  bottom: service.config.drawerMargin.bottom,
                  right: service.config.drawerMargin.right,
                  left: service.config.drawerMargin.left,
                ),
                child: Align(
                  alignment: service.config.buttonAlignment,
                  child: service.config.buttonBuilder?.call(
                        context,
                      ) ??
                      DefaultButton(
                        isCollapsed: service.isCollapsed,
                      ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
