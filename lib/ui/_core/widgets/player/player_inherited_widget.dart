part of 'player_widget.dart';

final class _PlayerInheritedWidget extends InheritedWidget {
  const _PlayerInheritedWidget({
    required this.cover,
    required this.title,
    required this.artist,
    required this.album,
    required this.borderRadius,
    required super.child,
  });

  factory _PlayerInheritedWidget.of(BuildContext context) {
    final widget = context
        .dependOnInheritedWidgetOfExactType<_PlayerInheritedWidget>();

    if (widget == null) {
      throw FlutterError('No _PlayerInheritedWidget found in context');
    }

    return widget;
  }

  final Uri? cover;
  final String? title;
  final String? artist;
  final String? album;
  final BorderRadius borderRadius;

  @override
  bool updateShouldNotify(covariant _PlayerInheritedWidget oldWidget) {
    return cover != oldWidget.cover ||
        title != oldWidget.title ||
        artist != oldWidget.artist ||
        album != oldWidget.album ||
        borderRadius != oldWidget.borderRadius;
  }
}
