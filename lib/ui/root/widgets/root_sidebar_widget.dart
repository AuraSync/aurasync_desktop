part of '../root_screen.dart';

final class _RootSidebarWidget extends StatelessWidget with AppThemeMixin {
  const _RootSidebarWidget();

  @override
  Widget build(BuildContext context) {
    final metrics = getThemeMetrics(context);

    return SidebarWidget(
      body: const _RootSidebarBodyWidget(),
      bottom: Column(
        spacing: metrics.medium,
        children: const [
          _RootPlayerWidget(),
          _RootTogglesWidget(),
          _RootDeviceWidget(),
        ],
      ),
    );
  }
}

final class _RootSidebarBodyWidget extends StatelessWidget with AppThemeMixin {
  const _RootSidebarBodyWidget();

  @override
  Widget build(BuildContext context) {
    final metrics = getThemeMetrics(context);

    return Column(
      spacing: metrics.small,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextWidget('Notifications', type: TextWidgetType.titleMedium),
            IconButtonWidget(icon: SolarLinearIcons.close),
          ],
        ),
        Expanded(
          child: ListView.separated(
            itemCount: 20,
            separatorBuilder: (_, _) => SizedBox(height: metrics.small),
            itemBuilder: (_, _) {
              return const NotificationWidget();
            },
          ),
        ),
      ],
    );
  }
}
