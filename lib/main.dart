import 'dart:io';

import 'package:aurasync/app_builder.dart';
import 'package:aurasync/routing/app_routes.dart';
import 'package:aurasync/ui/root/root_screen.dart';
import 'package:aurasync_ui/aurasync_ui.dart';
import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';
import 'package:flutter_acrylic/flutter_acrylic.dart';
import 'package:flutter_modular/flutter_modular.dart';

const title = 'AuraSync';
const WindowEffect effect = WindowEffect.mica;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    ModularApp(
      module: RootModule(),
      child: const AuraSyncUIApp(child: MyApp()),
    ),
  );

  await _loadWindowEffect();
  _openWindow();
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    Modular.setInitialRoute(AppRoutes.login);
  }

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme(context: context);

    return MaterialApp.router(
      title: title,
      debugShowCheckedModeBanner: false,
      theme: theme.getData(isDark: false),
      darkTheme: theme.getData(isDark: true),
      routerDelegate: Modular.routerDelegate,
      routeInformationParser: Modular.routeInformationParser,
      builder: (_, child) => AppBuilder(effect: effect, child: child),
    );
  }
}

Future<void> _loadWindowEffect() async {
  if (Platform.isLinux) return;

  await Window.initialize();
  await Window.setEffect(effect: effect);

  if (Platform.isMacOS) {
    await Future.wait([
      Window.makeTitlebarTransparent(),
      Window.enableFullSizeContentView(),
    ]);

    return;
  }

  await Window.hideWindowControls();
}

void _openWindow() {
  if (Platform.isLinux) return;

  doWhenWindowReady(() {
    const initialSize = Size(1280, 768);

    appWindow.title = title;
    appWindow.size = initialSize;
    appWindow.minSize = initialSize;
    appWindow.alignment = Alignment.center;
    appWindow.show();
  });
}
