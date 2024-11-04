import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/link.dart';
import 'package:url_launcher/url_launcher.dart';

export 'package:url_launcher/link.dart' show LinkTarget;

class BetterLink extends StatelessWidget {
  const BetterLink({
    required this.uri,
    required this.builder,
    this.target = LinkTarget.defaultTarget,
    super.key,
  });

  final Uri uri;
  final Widget Function(BuildContext, Future<void> Function()?) builder;
  final LinkTarget target;

  @override
  Widget build(BuildContext context) => Focus(
        canRequestFocus: false,
        onKeyEvent: _skipFocusNode,
        child: Link(
          uri: uri,
          target: target,
          builder: (context, _) => builder(
            context,
            () async => followLink(context, uri, target),
          ),
        ),
      );

  /// Skips the unnecessary focus node added by the [Link] widget.
  static KeyEventResult _skipFocusNode(FocusNode node, KeyEvent event) {
    final isTab = event.logicalKey == LogicalKeyboardKey.tab;
    final isTabTraversal = isTab && event is! KeyUpEvent;
    if (isTabTraversal && HardwareKeyboard.instance.isShiftPressed) {
      node.previousFocus();
    } else if (isTabTraversal) {
      node.nextFocus();
    }
    return KeyEventResult.ignored;
  }

  static Future<void> followLink(
    BuildContext context,
    Uri uri,
    LinkTarget target,
  ) async {
    final isModifierPressed = Theme.of(context).platform == TargetPlatform.macOS
        ? HardwareKeyboard.instance.isMetaPressed
        : HardwareKeyboard.instance.isControlPressed;
    if (isRoute(uri)) {
      return isModifierPressed
          ? launchUrl(uri, webOnlyWindowName: '_blank')
          : context.navigateNamedTo(uri.toString());
    }
    final windowName =
        target == LinkTarget.blank || isModifierPressed ? '_blank' : '_self';
    if (!await launchUrl(uri, webOnlyWindowName: windowName)) {
      throw Exception('Could not launch $uri');
    }
  }

  static bool isRoute(Uri uri) => !uri.hasScheme;
}
