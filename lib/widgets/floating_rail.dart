import 'package:flutter/material.dart';

class FloatingRail extends StatelessWidget {
  const FloatingRail({
    super.key,
    this.children = const <Widget>[],
    this.backgroundColor,
    this.opacity = 0.9,
    this.axis = Axis.vertical,
  });

  final List<Widget> children;
  final Color? backgroundColor;
  final double opacity;
  final Axis axis;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final defaultBackgroundColor = colorScheme.tertiaryContainer;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      decoration: BoxDecoration(
        color: backgroundColor ?? defaultBackgroundColor.withOpacity(opacity),
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: axis == Axis.vertical
          ? Column(
              mainAxisSize: MainAxisSize.min,
              children: children,
            )
          : Row(
              mainAxisSize: MainAxisSize.min,
              children: children,
            ),
    );
  }
}
