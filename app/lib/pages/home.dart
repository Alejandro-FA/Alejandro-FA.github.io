import 'package:flutter/material.dart';
import '../widgets/app_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: <Widget>[
          const PortfolioAppBar(),
          SliverFillRemaining(
            child: Center(
              child: Text(
                'Work in progress',
                style: textTheme.displayLarge,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
