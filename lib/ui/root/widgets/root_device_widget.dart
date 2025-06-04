part of '../root_screen.dart';

final class _RootDeviceWidget extends StatelessWidget with AppThemeMixin {
  const _RootDeviceWidget();

  @override
  Widget build(BuildContext context) {
    final (colors, metrics) = getTheme(context);

    return Row(
      spacing: metrics.medium,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        const SizedBox(width: 80, height: 80, child: Placeholder()),
        Expanded(
          child: Column(
            spacing: metrics.small,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                spacing: metrics.small,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const TextWidget(
                    'Device Name',
                    type: TextWidgetType.titleMedium,
                  ),
                  Container(
                    width: 8,
                    height: 8,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: colors.success,
                    ),
                  ),
                ],
              ),
              Row(
                spacing: metrics.small,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconWidget(
                    SolarLinearIcons.translation,
                    color: colors.onSurface,
                    label: 'Wi-Fi SSID',
                  ),
                  IconWidget(
                    SolarLinearIcons.batteryFullMinimalistic,
                    color: colors.onSurface,
                    label: '100%',
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
