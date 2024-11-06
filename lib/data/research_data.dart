import '../models/link_data.dart';
import '../models/research_entry.dart';

const researchFiles = [
  'parallel_bfgp.md',
];

const researchEntries = [
  ResearchEntry(
    filePath: 'parallel_bfgp.md',
    pdfLinks: [
      LinkData(
        url: 'https://repositori.upf.edu/handle/10230/61315',
        text: 'Full Thesis',
      ),
      LinkData(
        url: 'https://arxiv.org/abs/2407.21485',
        text: 'Paper',
      ),
    ],
    githubLinks: [
      LinkData(
        url: 'https://github.com/Alejandro-FA/bfgp-pp',
        text: 'Code',
      ),
    ],
  ),
];
