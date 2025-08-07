import 'dart:async';
import 'dart:developer';

import 'package:aurasync/routing/app_routes.dart';
import 'package:aurasync/ui/_core/widgets/screen_widget.dart';
import 'package:aurasync_engine/aurasync_engine.dart';
import 'package:aurasync_ui/aurasync_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_command/flutter_command.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'login_module.dart';
part 'login_view_model.dart';

final class _LoginScreen extends StatefulWidget {
  const _LoginScreen();

  @override
  State<StatefulWidget> createState() => _LoginScreenState();
}

final class _LoginScreenState extends State<_LoginScreen> with AppThemeMixin {
  late final _LoginViewModel _viewModel;

  @override
  void initState() {
    super.initState();
    _viewModel = Modular.get<_LoginViewModel>();
    _viewModel.discover();
    _viewModel.advertise();
  }

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final metrics = getThemeMetrics(context);

    return ScreenWidget(
      body: Padding(
        padding: EdgeInsets.all(metrics.medium),
        child: Center(
          child: ListenableBuilder(
            listenable: _viewModel,
            builder: (_, _) => _RadarWidget(devices: _viewModel.devices),
          ),
        ),
      ),
    );
  }
}

final class _PanelWidget extends StatelessWidget with AppThemeMixin {
  const _PanelWidget({
    required this.title,
    required this.subtitle,
    required this.child,
  });

  final String title;
  final String subtitle;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final metrics = getThemeMetrics(context);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextWidget(title, type: TextWidgetType.headlineMedium),
            TextWidget(subtitle),
          ],
        ),
        SizedBox(height: metrics.large * 2),
        SizedBox(height: 320, child: child),
      ],
    );
  }
}

final class _RadarWidget extends StatelessWidget {
  const _RadarWidget({required this.devices});

  final Set<DeviceEntity> devices;

  @override
  Widget build(BuildContext context) {
    return _PanelWidget(
      title: 'Connect via Radar',
      subtitle: 'Open the app on your device and wait to be displayed below.',
      child: Center(
        child: DeviceRadarWidget(
          dimension: 320,
          devices: devices,
          onPressed: (device) => log(device.name),
        ),
      ),
    );
  }
}
