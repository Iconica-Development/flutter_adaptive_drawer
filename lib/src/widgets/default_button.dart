import "package:flutter/material.dart";
import "package:flutter_adaptive_drawer/src/service/adaptive_drawer_service.dart";

/// A button that toggles the drawer. [DefaultButton] must be a 
/// descendant of [AdaptiveDrawerService].
/// [DefaultButton] is used by [AdaptiveDrawer] to toggle the drawer.
/// Can be overridden by setting [AdaptiveDrawerConfig.buttonBuilder].
/// Uses [AdaptiveDrawerConfig.defaultButtonCollapsedIcon] 
/// and [AdaptiveDrawerConfig.defaultButtonExpandedIcon].
/// Uses [AdaptiveDrawerConfig.defaultButtonBackgroundColor]
///  and [AdaptiveDrawerConfig.defaultButtonIconColor].
class DefaultButton extends StatelessWidget implements PreferredSizeWidget {
  /// Creates a new [DefaultButton].
  const DefaultButton({
    required this.isCollapsed,
    super.key,
  });

  /// Whether the drawer is collapsed.
  final bool isCollapsed;

  @override
  Widget build(BuildContext context) {
    var service = AdaptiveDrawerService.of(context);

    if (service == null) {
      throw Exception(
        "DefaultButton must be a descendant of AdaptiveDrawerService",
      );
    }

    return InkWell(
      onTap: service.animate,
      child: Container(
        height: preferredSize.height,
        width: preferredSize.width,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: service.config.defaultButtonBackgroundColor,
        ),
        child: Center(
          child: Icon(
            isCollapsed
                ? service.config.defaultButtonCollapsedIcon
                : service.config.defaultButtonExpandedIcon,
            color: service.config.defaultButtonIconColor,
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size(40, 40);
}
