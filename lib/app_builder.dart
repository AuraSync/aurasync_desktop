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
    final isLinux = Platform.isLinux;

    final colors = getThemeColors(context);
    final brightness = getThemeBrightness(context);
    final isDark = brightness == Brightness.dark;

    if (isLinux) {
      return Material(
        color: colors.surface,
        child: FutureBuilder(
          future: _setWindowEffect(isDark),
          builder: (_, _) => child!,
        ),
      );
    }

    return Material(
      color: colors.surfaceAlt,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const WindowTitleBarWidget(),
          Expanded(
            child: FutureBuilder(
              future: _setWindowEffect(isDark),
              builder: (_, _) => child!,
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _setWindowEffect(bool isDark) {
    return Window.setEffect(effect: effect, dark: isDark);
  }
}
