import 'package:aurasync_ui/aurasync_ui.dart';
import 'package:flutter/material.dart';

final class SidebarWidget extends StatelessWidget with AppThemeMixin {
  const SidebarWidget({this.body, this.bottom, super.key});

  final Widget? body;
  final Widget? bottom;

  @override
  Widget build(BuildContext context) {
    final (colors, metrics) = getTheme(context);

    return Container(
      width: 320,
      height: double.infinity,
      padding: EdgeInsets.all(metrics.medium),
      child: Column(
        spacing: metrics.medium,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(child: SizedBox.expand(child: body)),
          ContainerWidget(
            width: 220,
            height: metrics.border.width,
            decoration: BoxDecoration(
              color: colors.border,
              borderRadius: BorderRadius.all(metrics.radius),
            ),
            child: const SizedBox.expand(),
          ),
          ?bottom,
        ],
      ),
    );
  }
}
