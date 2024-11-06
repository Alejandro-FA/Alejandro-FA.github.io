import 'link_data.dart';

class ResearchEntry {
  const ResearchEntry({
    required this.filePath,
    this.pdfLinks = const [],
    this.githubLinks = const [],
  });

  final String filePath;
  final List<LinkData> pdfLinks;
  final List<LinkData> githubLinks;
}
