import 'package:flutter_test/flutter_test.dart';
import 'package:portfolio/widgets/better_link.dart';

void main() {
  test('localhost is not detected as a route', () {
    final uri = Uri.parse('localhost:8080/research');
    expect(BetterLink.isRoute(uri), false);
  });

  test('full url is not detected as a route', () {
    final uri = Uri.https('flutter.dev');
    expect(BetterLink.isRoute(uri), false);
  });

  test('full url with path is not detected as a route', () {
    final uri = Uri.https('flutter.dev', 'cookbook');
    expect(BetterLink.isRoute(uri), false);
  });

  test('route is detected as a route', () {
    final uri = Uri.parse('/projects');
    final rootUri = Uri.parse('/');
    expect(BetterLink.isRoute(uri), true);
    expect(BetterLink.isRoute(rootUri), true);
  });

  test('route with query parameters is detected as a route', () {
    final uri = Uri.parse('/projects?lang=es');
    final rootUri = Uri.parse('/?lang=es');
    expect(BetterLink.isRoute(uri), true);
    expect(BetterLink.isRoute(rootUri), true);
  });
}
