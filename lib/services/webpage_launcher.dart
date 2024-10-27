import 'package:url_launcher/url_launcher.dart';

Future<void> openWebpage(String url) async {
  final uri = Uri.parse(url);
  if (uri.scheme != 'https') throw Exception('URL must be secure (HTTPS)');
  if (!await launchUrl(uri)) throw Exception('Could not launch $uri');
}
