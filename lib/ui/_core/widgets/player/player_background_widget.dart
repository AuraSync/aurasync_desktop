part of 'player_widget.dart';

final class _PlayerBackgroundWidget extends StatelessWidget with AppThemeMixin {
  const _PlayerBackgroundWidget();

  @override
  Widget build(BuildContext context) {
    final (colors, metrics) = getTheme(context);
    final inherited = _PlayerInheritedWidget.of(context);

    return ImageFiltered(
      imageFilter: ImageFilter.blur(sigmaX: metrics.blur, sigmaY: metrics.blur),
      child: ImageWidget(
        aspectRatio: 16 / 9,
        uri: inherited.cover,
        borderRadius: inherited.borderRadius,
      ),
    );
  }
}
