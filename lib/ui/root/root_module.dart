part of 'root_screen.dart';

final class RootModule extends Module {
  @override
  void routes(RouteManager r) {
    r.child(AppRoutes.root, child: (_) => const _RootScreen());
  }
}
