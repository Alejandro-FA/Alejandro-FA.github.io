import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../web_utils.dart' show downloadFile;
import '../widgets/base_page.dart';
import '../widgets/timeline.dart';

@RoutePage()
class CVPage extends StatelessWidget {
  const CVPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final screenWidth = MediaQuery.of(context).size.width;

    return BasePage(
      title: 'Curriculum Vitae | Alejandro Fernández Alburquerque',
      floatingActionButton: FloatingActionButton.extended(
        label: Text('Download CV', style: textTheme.titleMedium),
        tooltip: 'Download CV',
        onPressed: () => downloadFile('/r2/alejandro_fernandez_cv-en.pdf'),
        icon: const Icon(Icons.download),
      ),
      slivers: [
        SliverPadding(
          padding: EdgeInsets.all(screenWidth * 0.1),
          sliver: SliverList.list(
            children: [
              Padding(
                // Check: https://medium.com/geekculture/dynamically-pinned-list-headers-ee5aa23f1db4
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Text('Education', style: textTheme.displaySmall),
              ),
              Timeline(
                lineColor: theme.colorScheme.surfaceContainerHighest,
                lineWidth: 3,
                children: const [
                  MyTimelineEvent(
                    date: 'Sep 2020 - Jul 2024',
                    location: 'Barcelona, Spain',
                    title: "Bachelor's degree, Computer Engineering",
                    institution: 'Universitat Pompeu Fabra',
                    grade: '9.16/10',
                    awards: '20 subjects completed with Honours',
                    description: """
My four-year academic journey in Physics Engineering led me to discover my passion for computer engineering and programming. I graduated in Computer Engineering in second place, completing 20 subjects with Honours ("Matrícula de Honor" in Spanish). These subjects, including Artificial Intelligence, Cryptography and Security, Object-Oriented Programming, Machine Learning, and Algorithm Design, are a testament to my strong technical skills and academic achievements.

One of the most rewarding aspects of my Bachelor's degree was the opportunity to collaborate on multiple team projects with brilliant colleagues. This experience honed my fundamental skills in collaborative planning and organization, technical communication, and synchronous and asynchronous collaboration in software development.""",
                  ),
                  MyTimelineEvent(
                    date: 'Sep 2016 - Jul 2020',
                    location: 'Barcelona, Spain',
                    title:
                        "Bachelor's degree, Physics Engineering (unfinished)",
                    institution: 'Universitat Politècnica de Catalunya',
                    description: """
After completing my Baccalaureate studies with an honorary distinction, I decided to continue my education with a challenging scientific Bachelor's degree, so I chose Engineering Physics. However, amid the COVID-19 pandemic, I discovered my passion for computers and programming, prompting me to switch from Engineering Physics to Computer Engineering. Even though I did not finish my studies, I am deeply appreciative for the learning experience and the brilliant people I met, and for the strong foundation in mathematics and physics that I acquired.""",
                  ),
                  MyTimelineEvent(
                    date: 'Sep 2014 - Jun 2016',
                    location: 'Barcelona, Spain',
                    title: 'Spanish Baccalaureate, Science',
                    institution: 'Col·legi Pare Manyanet Les Corts',
                    grade: '10/10',
                    awards: 'Baccalaureate completion with honors.',
                  ),
                ],
              ),
              const SizedBox(height: 40),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 0,
                  vertical: 20,
                ),
                child: Text('Experience', style: textTheme.displaySmall),
              ),
              Timeline(
                lineColor: theme.colorScheme.surfaceContainerHighest,
                lineWidth: 3,
                children: const [
                  MyTimelineEvent(
                    date: 'Jan 2024 - Jun 2024',
                    location: 'Barcelona, Spain',
                    title:
                        'Intern at the Artificial Intelligence and Machine Learning Research Group',
                    institution: 'Universitat Pompeu Fabra',
                    description: """
While interning at the University's AI and ML research group, I developed my Bachelor's thesis, "Parallel Strategies for Best-First Generalized Planning." I also had the opportunity to learn from world-renowned researchers in automated planning.

For more information check my Research page.""",
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class MyTimelineEvent implements TimelineEvent {
  const MyTimelineEvent({
    required this.date,
    required this.location,
    required this.title,
    required this.institution,
    this.grade,
    this.awards,
    this.description,
  });

  final String date;
  final String location;
  final String title;
  final String institution;
  final String? grade;
  final String? awards;
  final String? description;

  @override
  Widget buildLeft(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          date,
          style: textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 4),
        Text(location, style: textTheme.bodyLarge),
      ],
    );
  }

  @override
  Widget buildIcon(BuildContext context) => Container(
        width: 20,
        height: 20,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          shape: BoxShape.circle,
        ),
      );

  @override
  Widget buildRight(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainer,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: textTheme.titleLarge?.copyWith(color: colorScheme.tertiary),
          ),
          Text(
            institution,
            style: textTheme.titleMedium?.copyWith(color: colorScheme.tertiary),
          ),
          if (grade != null || awards != null || description != null)
            const SizedBox(height: 12),
          if (grade != null)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 6),
              child: RichText(
                text: TextSpan(
                  text: 'Average grade: ',
                  style: textTheme.bodyLarge?.copyWith(
                    color: colorScheme.secondary,
                    fontWeight: FontWeight.bold,
                  ),
                  children: [
                    TextSpan(
                      text: grade,
                      style: const TextStyle(fontWeight: FontWeight.normal),
                    ),
                  ],
                ),
              ),
            ),
          if (awards != null)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 6),
              child: RichText(
                text: TextSpan(
                  text: 'Awards: ',
                  style: textTheme.bodyLarge?.copyWith(
                    color: colorScheme.secondary,
                    fontWeight: FontWeight.bold,
                  ),
                  children: [
                    TextSpan(
                      text: awards,
                      style: const TextStyle(fontWeight: FontWeight.normal),
                    ),
                  ],
                ),
              ),
            ),
          if (description != null)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Text(
                description!,
                style: textTheme.bodyMedium,
              ),
            ),
        ],
      ),
    );
  }
}
