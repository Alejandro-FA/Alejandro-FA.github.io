import 'package:flutter_web_plugins/url_strategy.dart';

/// Decides the [UrlStrategy] based on the platform.
///
/// For GitHub pages, it is set to [HashUrlStrategy], as it does not support
/// path-based URLs. For all other platforms, it is set to [PathUrlStrategy].
void decideUrlStrategy() {
  final isGitHub = Uri.base.host.endsWith('github.io');
  // ignore: prefer_const_constructors
  final strategy = isGitHub ? HashUrlStrategy() : PathUrlStrategy();
  setUrlStrategy(strategy);
}
