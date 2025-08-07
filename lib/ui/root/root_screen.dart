import 'package:aurasync/routing/app_routes.dart';
import 'package:aurasync/ui/_core/widgets/notification_widget.dart';
import 'package:aurasync/ui/_core/widgets/player/player_widget.dart';
import 'package:aurasync/ui/_core/widgets/screen_widget.dart';
import 'package:aurasync/ui/_core/widgets/sidebar_widget.dart';
import 'package:aurasync/ui/home/home_screen.dart';
import 'package:aurasync/ui/login/login_screen.dart';
import 'package:aurasync_ui/aurasync_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'root_module.dart';
part 'widgets/root_player_widget.dart';
part 'widgets/root_device_widget.dart';
part 'widgets/root_sidebar_widget.dart';
part 'widgets/root_toggles_widget.dart';

final class _RootScreen extends StatelessWidget {
  const _RootScreen();

  @override
  Widget build(BuildContext context) {
    return const ScreenWidget(
      body: RouterOutlet(),
      sidebar: _RootSidebarWidget(),
    );
  }
}
