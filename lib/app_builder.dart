import 'dart:io';

import 'package:aurasync/ui/_core/widgets/window_title_bar_widget.dart';
import 'package:aurasync_ui/aurasync_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_acrylic/flutter_acrylic.dart';

final class AppBuilder extends StatelessWidget with AppThemeMixin {
  const AppBuilder({required this.effect, required this.child, super.key});

  final WindowEffect effect;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    final colors = getThemeColors(context);
    final color = colors.background;

    if (Platform.isLinux) {
      return Material(
        color: color,
        child: _AppBuildChild(effect: effect, child: child!),
      );
    }

    return Material(
      color: color,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const WindowTitleBarWidget(),
          Expanded(
            child: _AppBuildChild(effect: effect, child: child!),
          ),
        ],
      ),
    );
  }
}

final class _AppBuildChild extends StatelessWidget with AppThemeMixin {
  const _AppBuildChild({required this.effect, required this.child});

  final WindowEffect effect;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final brightness = getThemeBrightness(context);
    final isDark = brightness == Brightness.dark;

    return FutureBuilder(
      future: _setWindowEffect(isDark),
      builder: (_, _) => child,
    );
  }

  Future<void> _setWindowEffect(bool isDark) {
    return Window.setEffect(effect: effect, dark: isDark);
  }
}
