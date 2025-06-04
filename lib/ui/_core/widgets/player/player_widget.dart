import 'dart:ui';

import 'package:aurasync_ui/aurasync_ui.dart';
import 'package:flutter/material.dart';

part 'player_inherited_widget.dart';
part 'player_foreground_widget.dart';
part 'player_background_widget.dart';

final class PlayerWidget extends StatelessWidget with AppThemeMixin {
  const PlayerWidget({
    this.cover,
    this.title,
    this.artist,
    this.album,
    super.key,
  });

  final Uri? cover;
  final String? title;
  final String? artist;
  final String? album;

  @override
  Widget build(BuildContext context) {
    final metrics = getThemeMetrics(context);
    final borderRadius = BorderRadius.all(metrics.radius);

    return _PlayerInheritedWidget(
      cover: cover,
      title: title,
      artist: artist,
      album: album,
      borderRadius: borderRadius,
      child: ClipRRect(
        borderRadius: borderRadius,
        child: SizedBox(
          height: 88 + (metrics.small * 2),
          child: const Stack(
            fit: StackFit.expand,
            clipBehavior: Clip.none,
            alignment: Alignment.center,
            children: [
              Positioned.fill(child: _PlayerBackgroundWidget()),
              Positioned.fill(child: _PlayerForegroundWidget()),
            ],
          ),
        ),
      ),
    );
  }
}
