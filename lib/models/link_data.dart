class LinkData {
  const LinkData({required this.url, String? text}) : text = text ?? url;

  final String url;
  final String text;
}
