import 'package:aurasync/routing/app_routes.dart';
import 'package:aurasync/ui/_core/widgets/screen_widget.dart';
import 'package:aurasync_ui/aurasync_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'home_module.dart';

final class _HomeScreen extends StatelessWidget with AppThemeMixin {
  const _HomeScreen();

  @override
  Widget build(BuildContext context) {
    final metrics = getThemeMetrics(context);

    return ScreenWidget(
      body: Column(
        spacing: metrics.small,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ImageWidget(
            width: 80,
            fit: BoxFit.contain,
            package: 'aurasync_ui',
            uri: Uri.parse('assets/logo.png'),
          ),
          const TextWidget('AuraSync', type: TextWidgetType.headlineSmall),
        ],
      ),
    );
  }
}
