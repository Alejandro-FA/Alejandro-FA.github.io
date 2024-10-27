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
          builder: (context, followLink) => builder(
            context,
            () async => _followLink(context, followLink),
          ),
          target: target,
        ),
      );

  /// Skips the unnecessary focus node added by the [Link] widget.
  KeyEventResult _skipFocusNode(FocusNode node, KeyEvent event) {
    final isTab = event.logicalKey == LogicalKeyboardKey.tab;
    final isTabTraversal = isTab && event is! KeyUpEvent;
    if (isTabTraversal && HardwareKeyboard.instance.isShiftPressed) {
      node.previousFocus();
    } else if (isTabTraversal) {
      node.nextFocus();
    }
    return KeyEventResult.ignored;
  }

  /// Opens the link in a new tab if the modifier key (Ctrl or Cmd) is pressed.
  Future<void> _followLink(
    BuildContext context,
    Future<void> Function()? followLink,
  ) async {
    // If the uri is a normal URL, Ctrl/Cmd + click already works by default.
    if (!uri.hasAbsolutePath) return followLink?.call();

    // Otherwise, we need to override the default behavior of always opening
    // the link in the same tab.
    final isModifierPressed = Theme.of(context).platform == TargetPlatform.macOS
        ? HardwareKeyboard.instance.isMetaPressed
        : HardwareKeyboard.instance.isControlPressed;

    if (isModifierPressed) {
      // Open in a new tab.
      if (!await launchUrl(uri)) throw Exception('Could not launch $uri');
    } else {
      // Respect the behavior of [target].
      await followLink?.call();
    }
  }
}
