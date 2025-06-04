part of 'home_screen.dart';


final class HomeModule extends Module {
  @override
  void routes(RouteManager r) {
    r.child(AppRoutes.root, child: (_) => const _HomeScreen());
  }
}
