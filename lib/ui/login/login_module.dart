part of 'login_screen.dart';

final class LoginModule extends Module {
  @override
  void binds(Injector i) {
    super.binds(i);

    i.addSingleton<_LoginViewModel>(
      () => _LoginViewModel(
        AuthRepositoryImpl(
          MDNSService(),
          DeviceService(),
          const NetworkService(),
        ),
      ),
    );
  }

  @override
  void routes(RouteManager r) {
    r.child(AppRoutes.root, child: (_) => const _LoginScreen());
  }
}
