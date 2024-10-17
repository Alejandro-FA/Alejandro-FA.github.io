import 'package:flutter/widgets.dart';

import '../utils.dart' show MaterialWindowSizeClass;

abstract class TimelineEvent {
  Widget buildLeft(BuildContext context);
  Widget buildIcon(BuildContext context);
  Widget buildRight(BuildContext context);
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
  final EdgeInsetsGeometry eventPadding =
      const EdgeInsets.symmetric(vertical: 8);
  final Iterable<TimelineEvent> children;

  @override
  Widget build(BuildContext context) =>
      MaterialWindowSizeClass.of(context) >= MaterialWindowSizeClass.expanded
          ? _buildWide(context)
          : _buildNarrow(context);

  Widget _buildWide(BuildContext context) {
    final xAlignment = 2 * leftFlex / (leftFlex + rightFlex) - 1;

    return IntrinsicHeight(
      child: Stack(
        children: [
          Align(
            alignment: Alignment(xAlignment, 0),
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
            children: children.map(_buildEventWide).toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildNarrow(BuildContext context) => IntrinsicHeight(
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
              children: children.map(_buildEventNarrow).toList(),
            ),
          ],
        ),
      );

  Widget _buildEventWide(TimelineEvent event) => Builder(
        builder: (context) => Padding(
          padding: eventPadding,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                flex: leftFlex,
                child: Align(
                  alignment: Alignment.centerRight,
                  child: event.buildLeft(context),
                ),
              ),
              SizedBox(
                width: centerWidth,
                child: event.buildIcon(context),
              ),
              Expanded(
                flex: rightFlex,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: event.buildRight(context),
                ),
              ),
            ],
          ),
        ),
      );

  Widget _buildEventNarrow(TimelineEvent event) => Builder(
        builder: (context) => Padding(
          padding: eventPadding,
          child: Column(
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
                      child: event.buildIcon(context),
                    ),
                    event.buildLeft(context),
                  ],
                ),
              ),
              event.buildRight(context),
            ],
          ),
        ),
      );
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
