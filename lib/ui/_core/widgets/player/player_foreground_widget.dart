part of 'player_widget.dart';

final class _PlayerForegroundWidget extends StatelessWidget with AppThemeMixin {
  const _PlayerForegroundWidget();

  @override
  Widget build(BuildContext context) {
    final (colors, metrics) = getTheme(context);
    final inherited = _PlayerInheritedWidget.of(context);

    return ContainerWidget(
      padding: EdgeInsets.all(metrics.small),
      decoration: BoxDecoration(
        color: colors.surface,
        borderRadius: inherited.borderRadius,
      ),
      child: Column(
        spacing: metrics.small,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            spacing: metrics.small,
            children: const [
              _PlayerForegroundCoverWidget(),
              Flexible(child: _PlayerForegroundInfoWidget()),
            ],
          ),
          const _PlayerForegroundControlsWidget(),
        ],
      ),
    );
  }
}

final class _PlayerForegroundCoverWidget extends StatelessWidget
    with AppThemeMixin {
  const _PlayerForegroundCoverWidget();

  @override
  Widget build(BuildContext context) {
    final metrics = getThemeMetrics(context);
    final inherited = _PlayerInheritedWidget.of(context);

    final borderRadius =
        inherited.borderRadius - BorderRadius.circular(metrics.small);

    return ImageWidget(
      width: 50,
      height: 50,
      uri: inherited.cover,
      borderRadius: borderRadius,
    );
  }
}

final class _PlayerForegroundInfoWidget extends StatelessWidget {
  const _PlayerForegroundInfoWidget();

  @override
  Widget build(BuildContext context) {
    final inherited = _PlayerInheritedWidget.of(context);

    final title = inherited.title ?? 'Unknown Title';
    final artist = inherited.artist ?? 'Unknown Artist';
    final album = inherited.album ?? 'Unknown Album';

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextWidget(title, type: TextWidgetType.titleMedium),
        TextWidget('$artist • $album', type: TextWidgetType.bodySmall),
      ],
    );
  }
}

final class _PlayerForegroundControlsWidget extends StatelessWidget
    with AppThemeMixin {
  const _PlayerForegroundControlsWidget();

  @override
  Widget build(BuildContext context) {
    final metrics = getThemeMetrics(context);

    return Row(
      spacing: metrics.medium,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButtonWidget(
          isFilled: true,
          iconSize: metrics.icon / 1.8,
          icon: SolarLinearIcons.skipPrevious,
        ),
        IconButtonWidget(
          isFilled: true,
          iconSize: metrics.icon / 1.8,
          icon: SolarLinearIcons.play,
        ),
        IconButtonWidget(
          isFilled: true,
          iconSize: metrics.icon / 1.8,
          icon: SolarLinearIcons.skipNext,
        ),
      ],
    );
  }
}
