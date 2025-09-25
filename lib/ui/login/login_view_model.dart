part of 'login_screen.dart';

final class _LoginViewModel extends ChangeNotifier {
  _LoginViewModel(this._authRepository) {
    discover = Command.createAsyncNoParamNoResult(_discover);
    advertise = Command.createAsyncNoParamNoResult(_advertise);
  }

  final AuthRepository _authRepository;

  final _devices = <DeviceEntity>{};
  Set<DeviceEntity> get devices => _devices;

  StreamSubscription<DeviceEntity>? _devicesSubscription;

  late final Command<void, void> discover;
  late final Command<void, void> advertise;

  Future<void> _discover() async {
    final devices = await _authRepository.discover(DeviceTypeEnum.mobile);
    _devicesSubscription = devices.listen((device) {
      _devices.add(device);
      notifyListeners();
    });
  }

  Future<void> _advertise() async {
    await _authRepository.advertise(DeviceTypeEnum.pc);
  }

  @override
  Future<void> dispose() async {
    discover.dispose();
    advertise.dispose();
    _authRepository.dispose();
    await _devicesSubscription?.cancel();
    super.dispose();
  }
}
