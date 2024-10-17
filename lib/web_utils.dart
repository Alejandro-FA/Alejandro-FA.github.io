import 'package:path/path.dart' as path;
import 'package:web/web.dart' as web;

void downloadFile(String url) {
  final uri = Uri.parse(url);

  web.document.createElement('a') as web.HTMLAnchorElement
    ..href = url
    ..download = path.basename(uri.path)
    ..click()
    ..remove();
}
