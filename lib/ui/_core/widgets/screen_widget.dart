import 'package:aurasync_ui/aurasync_ui.dart';
import 'package:flutter/material.dart';

final class ScreenWidget extends StatelessWidget with AppThemeMixin {
  const ScreenWidget({this.body, this.sidebar, super.key});

  final Widget? body;
  final Widget? sidebar;

  @override
  Widget build(BuildContext context) {
    final (colors, metrics) = getTheme(context);

    final Color backgroundColor;
    final BorderRadius borderRadius;
    if (sidebar == null) {
      borderRadius = BorderRadius.zero;
      backgroundColor = Colors.transparent;
    } else {
      borderRadius = BorderRadius.only(topLeft: metrics.radius);
      backgroundColor = colors.surface;
    }

    return Row(
      children: [
        ?sidebar,
        Expanded(
          child: ClipRRect(
            borderRadius: borderRadius,
            child: Scaffold(backgroundColor: backgroundColor, body: body),
          ),
        ),
      ],
    );
  }
}
