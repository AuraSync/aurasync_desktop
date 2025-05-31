import 'dart:io';

import 'package:aurasync_ui/aurasync_ui.dart';
import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';

class WindowTitleBarWidget extends StatelessWidget {
  const WindowTitleBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return WindowTitleBarBox(
      child: Stack(
        alignment: Alignment.center,
        children: [
          const Text('AuraSync'),
          MoveWindow(child: const SizedBox.expand()),
          if (Platform.isWindows)
            const Positioned(
              top: 0,
              bottom: 0,
              right: 0,
              child: _WindowButtons(),
            ),
        ],
      ),
    );
  }
}

class _WindowButtons extends StatelessWidget with AppThemeMixin {
  const _WindowButtons();

  @override
  Widget build(BuildContext context) {
    final (colors, metrics) = getTheme(context);

    final btnColors = WindowButtonColors(
      mouseOver: colors.surface,
      mouseDown: colors.surface,
      normal: Colors.transparent,
      iconNormal: colors.onSurface,
      iconMouseOver: colors.onSurface,
      iconMouseDown: colors.onSurface,
    );

    final closeBtnColors = btnColors.copyWith(
      mouseOver: colors.error,
      mouseDown: colors.error,
      iconMouseOver: colors.onError,
      iconMouseDown: colors.onError,
    );

    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        MinimizeWindowButton(colors: btnColors),
        MaximizeWindowButton(colors: btnColors),
        CloseWindowButton(colors: closeBtnColors),
      ],
    );
  }
}

extension WindowButtonColorsExtension on WindowButtonColors {
  WindowButtonColors copyWith({
    Color? normal,
    Color? mouseOver,
    Color? mouseDown,
    Color? iconNormal,
    Color? iconMouseOver,
    Color? iconMouseDown,
  }) {
    return WindowButtonColors(
      normal: normal ?? this.normal,
      mouseOver: mouseOver ?? this.mouseOver,
      mouseDown: mouseDown ?? this.mouseDown,
      iconNormal: iconNormal ?? this.iconNormal,
      iconMouseOver: iconMouseOver ?? this.iconMouseOver,
      iconMouseDown: iconMouseDown ?? this.iconMouseDown,
    );
  }
}
