part of '../root_screen.dart';

final class _RootTogglesWidget extends StatelessWidget {
  const _RootTogglesWidget();

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButtonWidget(icon: SolarLinearIcons.translation, isFilled: true),
        IconButtonWidget(
          icon: SolarLinearIcons.transferVertical,
          isFilled: true,
        ),
        IconButtonWidget(icon: SolarLinearIcons.bluetooth, isFilled: true),
        IconButtonWidget(icon: SolarLinearIcons.volumeLoud, isFilled: true),
        IconButtonWidget(icon: SolarLinearIcons.bellOff, isFilled: true),
      ],
    );
  }
}
