import 'package:flutter/widgets.dart';

import '../theme/material_window_class.dart';

class TimelineEvent extends StatelessWidget {
  const TimelineEvent({
    required this.icon,
    required this.label,
    required this.details,
    this.padding = const EdgeInsets.symmetric(vertical: 8),
    super.key,
  });

  final Widget icon;
  final Widget label;
  final Widget details;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) => Padding(
        padding: padding,
        child: MaterialWindowClass.of(context) >= MaterialWindowClass.expanded
            ? _WideTimelineEvent(
                icon: icon,
                left: label,
                right: details,
              )
            : _NarrowTimelineEvent(
                icon: icon,
                left: label,
                right: details,
              ),
      );
}

class Timeline extends StatelessWidget {
  const Timeline({
    required this.lineColor,
    super.key,
    this.lineWidth = 2,
    this.labelFlex = 1,
    this.detailsFlex = 6,
    this.maxIconWidth = 60,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.children = const <TimelineEvent>[],
  });

  final Color lineColor;
  final double lineWidth;
  final int labelFlex;
  final int detailsFlex;
  final double maxIconWidth;
  final MainAxisAlignment mainAxisAlignment;
  final List<Widget> children;

  static TimelineData of(BuildContext context) {
    final result = context.dependOnInheritedWidgetOfExactType<TimelineData>();
    if (result == null) {
      throw FlutterError(
        'TimelineSettings.of() called without a TimelineSettings widget in the tree',
      );
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    final isWide =
        MaterialWindowClass.of(context) >= MaterialWindowClass.expanded;

    return TimelineData(
      labelFlex: labelFlex,
      detailsFlex: detailsFlex,
      maxIconWidth: maxIconWidth,
      child: CustomPaint(
        painter: TimelineLinePainter(
          color: lineColor,
          lineWidth: lineWidth,
          labelsFlex: isWide ? labelFlex : 0,
          detailsFlex: detailsFlex,
          maxIconWidth: maxIconWidth,
        ),
        child: Column(
          mainAxisAlignment: mainAxisAlignment,
          children: children,
        ),
      ),
    );
  }
}

class TimelineLinePainter extends CustomPainter {
  const TimelineLinePainter({
    required this.color,
    this.lineWidth = 2,
    this.labelsFlex = 1,
    this.detailsFlex = 6,
    this.maxIconWidth = 60,
  });

  final Color color;
  final double lineWidth;
  final int labelsFlex;
  final int detailsFlex;
  final double maxIconWidth;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;

    const topOffset = 0.0;
    const bottomOffset = 0.0;
    final flexFactor = labelsFlex / (labelsFlex + detailsFlex);
    final xOffset = (size.width - maxIconWidth) * flexFactor + maxIconWidth / 2;

    canvas.drawLine(
      Offset(xOffset, topOffset),
      Offset(xOffset, size.height - bottomOffset),
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class TimelineData extends InheritedWidget {
  const TimelineData({
    required this.labelFlex,
    required this.detailsFlex,
    required this.maxIconWidth,
    required super.child,
    super.key,
  });

  final int labelFlex;
  final int detailsFlex;
  final double maxIconWidth;

  @override
  bool updateShouldNotify(TimelineData oldWidget) =>
      labelFlex != oldWidget.labelFlex ||
      detailsFlex != oldWidget.detailsFlex ||
      maxIconWidth != oldWidget.maxIconWidth;
}

class _WideTimelineEvent extends StatelessWidget {
  const _WideTimelineEvent({
    required this.icon,
    required this.left,
    required this.right,
  });

  final Widget icon;
  final Widget left;
  final Widget right;

  @override
  Widget build(BuildContext context) {
    final timeline = Timeline.of(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          flex: timeline.labelFlex,
          child: Align(
            alignment: Alignment.centerRight,
            child: left,
          ),
        ),
        SizedBox(
          width: timeline.maxIconWidth,
          child: icon,
        ),
        Expanded(
          flex: timeline.detailsFlex,
          child: Align(
            alignment: Alignment.centerLeft,
            child: right,
          ),
        ),
      ],
    );
  }
}

class _NarrowTimelineEvent extends StatelessWidget {
  const _NarrowTimelineEvent({
    required this.icon,
    required this.left,
    required this.right,
  });

  final Widget icon;
  final Widget left;
  final Widget right;

  @override
  Widget build(BuildContext context) {
    final timeline = Timeline.of(context);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: timeline.maxIconWidth,
                child: icon,
              ),
              left,
            ],
          ),
        ),
        right,
      ],
    );
  }
}
