import 'dart:io';

import 'package:aurasync/app_builder.dart';
import 'package:aurasync_ui/aurasync_ui.dart';
import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';
import 'package:flutter_acrylic/flutter_acrylic.dart';

const title = 'AuraSync';
const WindowEffect effect = WindowEffect.mica;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await _loadWindowEffect();
  runApp(const AuraSyncUIApp(child: MyApp()));
  _openWindow();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme(context: context);

    return MaterialApp(
      title: title,
      debugShowCheckedModeBanner: false,
      theme: theme.getData(isDark: false),
      darkTheme: theme.getData(isDark: true),
      home: const MyHomePage(title: title),
      builder: (_, child) => AppBuilder(effect: effect, child: child),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({required this.title, super.key});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('You have pushed the button this many times:'),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
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
  }
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
