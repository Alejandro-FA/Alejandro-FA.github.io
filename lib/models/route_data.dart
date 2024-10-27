import 'package:flutter/widgets.dart';

class RouteData {
  const RouteData({
    required this.name,
    required this.path,
    required this.icon,
  });

  final String name;
  final String path;
  final IconData icon;
}
