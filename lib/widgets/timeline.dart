import 'package:flutter/widgets.dart';

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
    this.rightFlex = 4,
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
  final EdgeInsetsGeometry eventPadding = const EdgeInsets.symmetric(
    horizontal: 0,
    vertical: 8,
  );
  final Iterable<TimelineEvent> children;

  @override
  Widget build(BuildContext context) {
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
            children: children.map(buildEvent).toList(),
          ),
        ],
      ),
    );
  }

  Widget buildEvent(TimelineEvent event) => Builder(
        builder: (context) => Padding(
          padding: eventPadding,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                flex: leftFlex,
                child: event.buildLeft(context),
              ),
              SizedBox(
                width: centerWidth,
                child: event.buildIcon(context),
              ),
              Expanded(
                flex: rightFlex,
                child: event.buildRight(context),
              ),
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
