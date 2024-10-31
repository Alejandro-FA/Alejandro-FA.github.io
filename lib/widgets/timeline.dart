import 'package:flutter/widgets.dart';

import '../theme/material_window_class.dart';

class TimelineEvent extends StatelessWidget {
  const TimelineEvent({
    required this.icon,
    required this.left,
    required this.right,
    this.centerWidth = 60,
    this.leftFlex = 1,
    this.rightFlex = 6,
    this.padding = const EdgeInsets.symmetric(vertical: 8),
    super.key,
  });

  final Widget icon;
  final Widget left;
  final Widget right;
  final double centerWidth;
  final int leftFlex;
  final int rightFlex;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) =>
      MaterialWindowClass.of(context) >= MaterialWindowClass.expanded
          ? Padding(
              padding: padding,
              child: _WideTimelineEvent(
                icon: icon,
                left: left,
                right: right,
                centerWidth: centerWidth,
                leftFlex: leftFlex,
                rightFlex: rightFlex,
              ),
            )
          : Padding(
              padding: padding,
              child: _NarrowTimelineEvent(
                icon: icon,
                left: left,
                right: right,
                centerWidth: centerWidth,
              ),
            );
}

class _WideTimelineEvent extends StatelessWidget {
  const _WideTimelineEvent({
    required this.icon,
    required this.left,
    required this.right,
    this.centerWidth = 60,
    this.leftFlex = 1,
    this.rightFlex = 6,
  });

  final Widget icon;
  final Widget left;
  final Widget right;
  final double centerWidth;
  final int leftFlex;
  final int rightFlex;

  @override
  Widget build(BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: leftFlex,
            child: Align(
              alignment: Alignment.centerRight,
              child: left,
            ),
          ),
          SizedBox(
            width: centerWidth,
            child: icon,
          ),
          Expanded(
            flex: rightFlex,
            child: Align(
              alignment: Alignment.centerLeft,
              child: right,
            ),
          ),
        ],
      );
}

class _NarrowTimelineEvent extends StatelessWidget {
  const _NarrowTimelineEvent({
    required this.icon,
    required this.left,
    required this.right,
    this.centerWidth = 60,
  });

  final Widget icon;
  final Widget left;
  final Widget right;
  final double centerWidth;

  @override
  Widget build(BuildContext context) => Column(
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
                  width: centerWidth,
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

class Timeline extends StatelessWidget {
  const Timeline({
    required this.lineColor,
    super.key,
    this.lineWidth = 2,
    this.leftFlex = 1,
    this.rightFlex = 6,
    this.centerWidth = 60,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.children = const <TimelineEvent>[],
  });

  final Color lineColor;
  final double lineWidth;
  final int leftFlex;
  final int rightFlex;
  final double centerWidth;
  final MainAxisAlignment mainAxisAlignment;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) =>
      MaterialWindowClass.of(context) >= MaterialWindowClass.expanded
          ? _WideTimeline(
              lineColor: lineColor,
              lineWidth: lineWidth,
              centerWidth: centerWidth,
              mainAxisAlignment: mainAxisAlignment,
              children: children,
            )
          : _NarrowTimeline(
              lineColor: lineColor,
              lineWidth: lineWidth,
              centerWidth: centerWidth,
              mainAxisAlignment: mainAxisAlignment,
              children: children,
            );
}

class _NarrowTimeline extends StatelessWidget {
  const _NarrowTimeline({
    required this.lineColor,
    required this.lineWidth,
    required this.centerWidth,
    required this.mainAxisAlignment,
    required this.children,
  });

  final Color lineColor;
  final double lineWidth;
  final double centerWidth;
  final MainAxisAlignment mainAxisAlignment;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) => IntrinsicHeight(
        child: Stack(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: CustomPaint(
                size: Size(centerWidth, double.infinity),
                painter: TimelineLinePainter(
                  color: lineColor,
                  width: lineWidth,
                ),
              ),
            ),
            Column(
              mainAxisAlignment: mainAxisAlignment,
              children: children,
            ),
          ],
        ),
      );
}

class _WideTimeline extends StatelessWidget {
  const _WideTimeline({
    required this.lineColor,
    required this.lineWidth,
    required this.centerWidth,
    required this.mainAxisAlignment,
    required this.children,
  });

  final Color lineColor;
  final double lineWidth;
  final double centerWidth;
  final MainAxisAlignment mainAxisAlignment;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    const leftFlex = 1;
    const rightFlex = 6;
    const xAlignment = 2 * leftFlex / (leftFlex + rightFlex) - 1;

    return IntrinsicHeight(
      child: Stack(
        children: [
          Align(
            alignment: const Alignment(xAlignment, 0),
            child: CustomPaint(
              size: Size(centerWidth, double.infinity),
              painter: TimelineLinePainter(
                color: lineColor,
                width: lineWidth,
              ),
            ),
          ),
          Column(
            mainAxisAlignment: mainAxisAlignment,
            children: children,
          ),
        ],
      ),
    );
  }
}

class TimelineLinePainter extends CustomPainter {
  const TimelineLinePainter({required this.color, this.width = 2});

  final Color color;
  final double width;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = width
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;

    const topOffset = 0.0;
    const bottomOffset = 0.0;

    canvas.drawLine(
      Offset(size.width / 2, topOffset),
      Offset(size.width / 2, size.height - bottomOffset),
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
