import 'dart:math';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../data/home_data.dart';
import '../theme/window_class.dart';
import '../widgets/markdown_content.dart';
import '../widgets/page_scaffold.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) => const PageScaffold(
        title: 'Home | Alejandro Fernández Alburquerque',
        socialMediaRail: true,
        slivers: [
          SliverToBoxAdapter(child: HeroSection()),
        ],
      );
}

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Colors.transparent, colorScheme.primary.withOpacity(0.05)],
        ),
      ),
      padding: EdgeInsets.symmetric(horizontal: _getPadding(context)),
      child: WindowClass.of(context) >= WindowClass.large
          ? const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Flexible(flex: 10, child: _Greeting()),
                SizedBox(width: 20),
                Flexible(flex: 10, child: _Portrait()),
              ],
            )
          : const Column(
              children: [
                _Greeting(),
                _Portrait(),
              ],
            ),
    );
  }

  static double _getPadding(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return switch (WindowClass.of(context)) {
      WindowClass.compact => 30,
      WindowClass.medium => 50,
      WindowClass.expanded => 100,
      _ => max(100, (screenWidth - WindowClass.expanded.minDP) / 5),
    };
  }
}

class _Portrait extends StatelessWidget {
  const _Portrait();

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.only(top: 50),
        child: Image.asset('assets/images/portrait.png'),
      );
}

class _Greeting extends StatelessWidget {
  const _Greeting();

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    final isCompact = WindowClass.of(context) == WindowClass.compact;
    final nameStyle =
        isCompact ? textTheme.displayMedium : textTheme.displayLarge;
    final markdownTheme = MarkdownTheme.of(context);

    return Padding(
      padding: const EdgeInsets.only(top: 50, bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Hello, I’m ',
            style: isCompact ? textTheme.displaySmall : textTheme.displayMedium,
          ),
          Text(
            'Alejandro Fernández',
            style: nameStyle?.copyWith(
              fontWeight: FontWeight.bold,
              color: colorScheme.primary,
            ),
          ),
          const SizedBox(height: 20),
          MarkdownContent(
            file: aboutMe,
            styleSheet: markdownTheme.copyWith(
              p: markdownTheme.p?.copyWith(
                fontSize: isCompact
                    ? textTheme.titleMedium?.fontSize
                    : textTheme.titleLarge?.fontSize,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
