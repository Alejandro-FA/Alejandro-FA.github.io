import 'package:flutter/material.dart';
import '../widgets/app_bar.dart';

class CVPage extends StatelessWidget {
  const CVPage({super.key});

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
                'Curriculum Vitae | Work in progress',
                style: textTheme.displayLarge,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
