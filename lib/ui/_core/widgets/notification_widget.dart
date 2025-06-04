import 'package:aurasync_ui/aurasync_ui.dart';
import 'package:flutter/material.dart';

final class NotificationWidget extends StatefulWidget {
  const NotificationWidget({super.key});

  @override
  State<StatefulWidget> createState() => _NotificationWidgetState();
}

final class _NotificationWidgetState extends State<NotificationWidget>
    with AppThemeMixin {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final (colors, metrics) = getTheme(context);

    final Color? bgColor;
    final Color? fgColor;
    if (_isHovered) {
      bgColor = colors.primary;
      fgColor = colors.onPrimary;
    } else {
      bgColor = null;
      fgColor = null;
    }

    return TouchableWidget(
      onFocus: (isFocused) => setState(() => _isHovered = isFocused),
      onHover: (isHovered) => setState(() => _isHovered = isHovered),
      child: ContainerWidget(
        padding: EdgeInsets.all(metrics.small),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.all(metrics.radius),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              spacing: metrics.small,
              children: [
                ImageWidget(
                  uri: null,
                  width: metrics.icon,
                  height: metrics.icon,
                ),
                TextWidget(
                  'App Name',
                  color: fgColor,
                  type: TextWidgetType.bodySmall,
                ),
                const Spacer(),
                TextWidget(
                  '2:30 PM',
                  color: fgColor,
                  type: TextWidgetType.bodySmall,
                ),
              ],
            ),
            SizedBox(height: metrics.small),
            TextWidget(
              'Notification Title',
              color: fgColor,
              type: TextWidgetType.titleMedium,
            ),
            TextWidget(
              // ignore: lines_longer_than_80_chars
              'This is a sample notification message that can be quite long and will wrap to the next line if necessary.',
              color: fgColor,
            ),
          ],
        ),
      ),
    );
  }
}
